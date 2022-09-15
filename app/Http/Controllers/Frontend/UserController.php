<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use Session;
use Illuminate\Support\Facades\Hash;
use App\Models\Blog\BlogPostCategory;
use App\Models\SubSubCategory;
use App\Models\ShipDivision;
use App\Models\ShipDistrict;
use App\Models\SiteSetting;
use App\Models\SubCategory;
use App\Models\ShipState;
use App\Models\OrderItem;
use App\Models\Wishlist;
use App\Models\MultiImg;
use App\Models\Category;
use App\Models\BlogPost;
use App\Models\Product;
use App\Models\Review;
use App\Models\Coupon;
use App\Models\Slider;
use App\Models\Admin;
use App\Models\Order;
use App\Models\Brand;
use App\Models\User;
use App\Models\Seo;
use Carbon\Carbon;
use PDF;
use Gloudemans\Shoppingcart\Facades\Cart;


class UserController extends Controller
{
    public function index(){
        $blogpost = BlogPost::latest()->get();
    	$products = Product::where('status',1)->orderBy('id','DESC')->limit(10)->get();
    	$sliders = Slider::where('status',1)->orderBy('id','ASC')->limit(4)->get();
    	$categories = Category::orderBy('category_name_en','ASC')->get();
    	$featured = Product::where('featured',1)->orderBy('id','DESC')->limit(6)->get();
    	$hot_deals = Product::where('hot_deals',1)->where('discount_price','!=',NULL)->orderBy('id','DESC')->limit(3)->get();
    	$special_offer = Product::where('special_offer',1)->orderBy('id','DESC')->limit(10)->get();
    	$special_deals = Product::where('special_deals',1)->orderBy('id','DESC')->limit(4)->get();
    	$skip_category_0 = Category::skip(0)->first();
    	$skip_product_0 = Product::where('status',1)->where('category_id',$skip_category_0->id)->orderBy('id','DESC')->get();
    	$skip_category_1 = Category::skip(1)->first();
    	$skip_product_1 = Product::where('status',1)->where('category_id',$skip_category_1->id)->orderBy('id','DESC')->get();
    	$skip_brand_1 = Brand::skip(1)->first();
    	$skip_brand_product_1 = Product::where('status',1)->where('brand_id',$skip_brand_1->id)->orderBy('id','DESC')->get();
		$data = Product::orderBy('id','DESC')->get();
        
    	return view('frontend.index',compact('categories','sliders','products','featured','hot_deals','special_offer','special_deals','skip_category_0','skip_product_0','skip_category_1','skip_product_1','skip_brand_1','skip_brand_product_1','blogpost', 'data'));
    }

	// ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    // Product Logic
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------

    public function ProductDetails($id,$slug){
		$product = Product::findOrFail($id);
		$color_en = $product->product_color_en;
		$product_color_en = explode(',', $color_en);
		$size_en = $product->product_size_en;
		$product_size_en = explode(',', $size_en);
		$multiImag = MultiImg::where('product_id',$id)->get();
		$cat_id = $product->category_id;
		$relatedProduct = Product::where('category_id',$cat_id)->where('id','!=',$id)->orderBy('id','DESC')->get();
	 	return view('frontend.product.product_details',compact('product','multiImag','product_color_en','product_size_en','relatedProduct'));
	}

	public function TagWiseProduct($tag){
		$products = Product::where('status',1)->where('product_tags_en',$tag)->orderBy('id','DESC')->paginate(3);
		$categories = Category::orderBy('category_name_en','ASC')->get();
		return view('frontend.tags.tags_view',compact('products','categories'));
	}

	public function SubCatWiseProduct(Request $request, $subcat_id,$slug){
		$products = Product::where('status',1)->where('subcategory_id',$subcat_id)->orderBy('id','DESC')->paginate(3);
		$categories = Category::orderBy('category_name_en','ASC')->get();
		$breadsubcat = SubCategory::with(['category'])->where('id',$subcat_id)->get();
		if ($request->ajax()) {
            $grid_view = view('frontend.product.grid_view_product',compact('products'))->render();
            $list_view = view('frontend.product.list_view_product',compact('products'))->render();
            return response()->json(['grid_view' => $grid_view,'list_view',$list_view]);	
		}
		return view('frontend.product.subcategory_view',compact('products','categories','breadsubcat'));
	}

	public function SubSubCatWiseProduct($subsubcat_id,$slug){
		$products = Product::where('status',1)->where('subsubcategory_id',$subsubcat_id)->orderBy('id','DESC')->paginate(6);
		$categories = Category::orderBy('category_name_en','ASC')->get();
		$breadsubsubcat = SubSubCategory::with(['category','subcategory'])->where('id',$subsubcat_id)->get();
		return view('frontend.product.sub_subcategory_view',compact('products','categories','breadsubsubcat'));
	}

	public function ProductViewAjax($id){
		$product = Product::with('category','brand')->findOrFail($id);
		$color = $product->product_color_en;
		$product_color = explode(',', $color);
		$size = $product->product_size_en;
		$product_size = explode(',', $size);
		return response()->json(array(
			'product' => $product,
			'color' => $product_color,
			'size' => $product_size,
		));
	}

	public function ProductSearch(Request $request){
		$request->validate(["search" => "required"]);
		$item = $request->search;
        $categories = Category::orderBy('category_name_en','ASC')->get();
		$products = Product::where('product_name_en','LIKE',"%$item%")->get();
		return view('frontend.product.search',compact('products','categories'));
	}

	public function SearchProduct(Request $request){
		$request->validate(["search" => "required"]);
		$item = $request->search;		 
		$products = Product::where('product_name_en','LIKE',"%$item%")->select('product_name_en','product_thambnail','selling_price','id','product_slug_en')->limit(5)->get();
		return view('frontend.product.search_product',compact('products'));
	}



	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	// Cart Logic
	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	public function AddToCart(Request $request, $id){
		if (Session::has('coupon')) {
			Session::forget('coupon');
	   	}
		$product = Product::findOrFail($id);
		if ($product->discount_price == NULL) {
			Cart::add([
				'id' => $id, 
				'name' => $request->product_name, 
				'qty' => $request->quantity, 
				'price' => $product->selling_price,
				'weight' => 1, 
				'options' => [
					'image' => $product->product_thambnail,
					'color' => $request->color,
					'size' => $request->size,
				], 
			]);
			return response()->json(['success' => 'Successfully Added on Your Cart']);
		}else{
			Cart::add([
				'id' => $id, 
				'name' => $request->product_name, 
				'qty' => $request->quantity, 
				'price' => $product->discount_price,
				'weight' => 1, 
				'options' => [
					'image' => $product->product_thambnail,
					'color' => $request->color,
					'size' => $request->size,
				],
			]);
			return response()->json(['success' => 'Successfully Added on Your Cart']);
		}
	}

	// Mini Cart Section
	public function AddMiniCart(){
		$carts = Cart::content();
		$cartQty = Cart::count();
		$cartTotal = Cart::total();
		return response()->json(array(
			'carts' => $carts,
			'cartQty' => $cartQty,
			'cartTotal' => round($cartTotal),
		));
	}

	/// remove mini cart 
	public function RemoveMiniCart($rowId){
		Cart::remove($rowId);
		return response()->json(['success' => 'Product Remove from Cart']);

	}

	// add to wishlist mehtod 
	public function AddToWishlist(Request $request, $product_id){
		if (Auth::check()) {
			$exists = Wishlist::where('user_id',Auth::id())->where('product_id',$product_id)->first();
			if (!$exists) {
				Wishlist::insert([
				'user_id' => Auth::id(), 
				'product_id' => $product_id, 
				'created_at' => Carbon::now(), 
			]);
			return response()->json(['success' => 'Successfully Added On Your Wishlist']);
			}else{

				return response()->json(['error' => 'This Product has Already on Your Wishlist']);
			}            
		}else{
			return response()->json(['error' => 'At First Login Your Account']);
		}
	}

	public function CouponApply(Request $request){
		$coupon = Coupon::where('coupon_name',$request->coupon_name)->where('coupon_validity','>=',Carbon::now()->format('Y-m-d'))->first();
		if ($coupon) {
			Session::put('coupon',[
				'coupon_name' => $coupon->coupon_name,
				'coupon_discount' => $coupon->coupon_discount,
				'discount_amount' => round(Cart::total() * $coupon->coupon_discount/100), 
				'total_amount' => round(Cart::total() - Cart::total() * $coupon->coupon_discount/100)  
			]);
			return response()->json(array(
				'validity' => true,
				'success' => 'Coupon Applied Successfully'
			));
		}else{
			return response()->json(['error' => 'Invalid Coupon']);
		}
	}

	public function CouponCalculation(){
		if (Session::has('coupon')) {
			return response()->json(array(
				'subtotal' => Cart::total(),
				'coupon_name' => session()->get('coupon')['coupon_name'],
				'coupon_discount' => session()->get('coupon')['coupon_discount'],
				'discount_amount' => session()->get('coupon')['discount_amount'],
				'total_amount' => session()->get('coupon')['total_amount'],
			));
		}else{
			return response()->json(array(
				'total' => Cart::total(),
			));

		}
	}

	// Remove Coupon 
	public function CouponRemove(){
		Session::forget('coupon');
		return response()->json(['success' => 'Coupon Remove Successfully']);
	}

	// Checkout Method 
	public function CheckoutCreate(){
		if (Auth::check()) {
			if (Cart::total() > 0) {
			$carts = Cart::content();
			$cartQty = Cart::count();
			$cartTotal = Cart::total();
			$divisions = ShipDivision::orderBy('division_name','ASC')->get();
			return view('frontend.checkout.checkout_view',compact('carts','cartQty','cartTotal','divisions'));
			}else{
				$notification = array(
				'message' => 'Shopping At list One Product',
				'alert-type' => 'error'
				);
				return redirect()->to('/')->with($notification);
			}
		}else{
			$notification = array(
			'message' => 'You Need to Login First',
			'alert-type' => 'error'
			);
			return redirect()->route('login')->with($notification);
		}

   	}


	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	// Home Blog Logic
	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------

	public function AddBlogPost(){
    	$blogcategory = BlogPostCategory::latest()->get();
    	$blogpost = BlogPost::latest()->get();
    	return view('frontend.blog.blog_list',compact('blogpost','blogcategory'));
    }

    public function DetailsBlogPost($id){
        $blogcategory = BlogPostCategory::latest()->get();
    	$blogpost = BlogPost::findOrFail($id);
    	return view('frontend.blog.blog_details',compact('blogpost','blogcategory'));
    }

    public function HomeBlogCatPost($category_id){
    	$blogcategory = BlogPostCategory::latest()->get();
    	$blogpost = BlogPost::where('category_id',$category_id)->orderBy('id','DESC')->get();
    	return view('frontend.blog.blog_cat_list',compact('blogpost','blogcategory'));
    }

	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	// Shop Logic
	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------

	public function ShopPage(){
        $products = Product::query();
        if (!empty($_GET['category'])) {
            $slugs = explode(',',$_GET['category']);
            $catIds = Category::select('id')->whereIn('category_slug_en',$slugs)->pluck('id')->toArray();
            $products = $products->whereIn('category_id',$catIds)->paginate(3);
        }
        if (!empty($_GET['brand'])) {
            $slugs = explode(',',$_GET['brand']);
            $brandIds = Brand::select('id')->whereIn('brand_slug_en',$slugs)->pluck('id')->toArray();
            $products = $products->whereIn('brand_id',$brandIds)->paginate(3);
        }
        else{
            $products = Product::where('status',1)->orderBy('id','DESC')->paginate(3);
        }
        $brands = Brand::orderBy('brand_name_en','ASC')->get();
        $categories = Category::orderBy('category_name_en','ASC')->get();
        return view('frontend.shop.shop_page',compact('products','categories','brands'));

    }

    public function ShopFilter(Request $request){
        $data = $request->all();
        // Filter Category
        $catUrl = "";
		if (!empty($data['category'])) {
			foreach ($data['category'] as $category) {
				if (empty($catUrl)) {
					$catUrl .= '&category='.$category;
				}else{
					$catUrl .= ','.$category;
				}
			}
		} 
 		// Filter Brand 
        $brandUrl = "";
		if (!empty($data['brand'])) {
			foreach ($data['brand'] as $brand) {
				if (empty($brandUrl)) {
					$brandUrl .= '&brand='.$brand;
				}else{
					$brandUrl .= ','.$brand;
				}
			}
		}
        return redirect()->route('shop.page',$catUrl.$brandUrl);
    }
}
