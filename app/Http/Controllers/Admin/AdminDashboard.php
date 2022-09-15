<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
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
use DateTime;
use Storage;
use Image;
use Auth;
use PDF;
use DB;


class AdminDashboard extends Controller{

    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    // Profile Logic
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------

    public function AdminProfile(){
        $adminData = Admin::findOrFail(1);
        return view('admin.admin_profile_view', compact('adminData'));
    }

    public function AdminProfileEdit(){
        $editData = Admin::find(1);
        return view('admin.admin_profile_edit', compact('editData'));
    }

    public function AdminProfileStore(Request $request){
        $adminData = Admin::find(1);
        $adminData->name = $request->name;
        $adminData->email = $request->email;
        if($request->file('profile_photo_path')){
            $image = $request->file('profile_photo_path');
            @unlink(public_path('upload/admin_images/'.$adminData->profile_photo_path));
            $slug = Str::slug($request->profile_photo_path);
            $imageName = $slug .'-'. date('YmdHi') . '.' .$image->getClientOriginalExtension();
            $image->move(public_path('upload/admin_images'), $imageName);
            $adminData['profile_photo_path'] = $imageName;
            
            if(!Storage::disk ('public')->exists('upload/admin_images')){
                Storage::disk('public')->makeDirectory('upload/admin_images');
            }
        }
        $adminData->save();
        return redirect()->route('admin.profile');
    }

    public function AdminChangePassword(){
        return view('admin.admin_change_password');
    }

    public function AdminStorePassword(Request $request, ){
        $validateData = $request->validate([
            'oldpassword' => 'required',
            'password' => 'required|confirmed',
        ]);
        $hashedPassword = Admin::find(1)->password;
        if (Hash::check($request->oldpassword, $hashedPassword)) {
            $adminData = Admin::find(1);
            $adminData->password = Hash::make($request->password);
            $adminData->save();
            Auth::logout();
            return redirect()->route('admin.logout');
        } else {
            return redirect()->back();
        }
    }

    public function AllUsers(){
		$users = User::latest()->get();
		return view('backend.user.all_user',compact('users'));
	}

    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    // Brand Logic
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------

    public function BrandView(){
    	$brands = Brand::latest()->get();
    	return view('backend.brand.brand_view',compact('brands'));

    }

    public function BrandStore(Request $request){
    	$request->validate([
    		'brand_name_en' => 'required',
    		'brand_image' => 'required',
    	],[
    		'brand_name_en.required' => 'Please Input Brand English Name',
            'brand_image.required' => 'Please Input Brand Image',
    	]);
    	$image = $request->file('brand_image');
    	$name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
        if(!Storage::disk ('public')->exists('upload/brand')){
            Storage::disk('public')->makeDirectory('upload/brand');
        }
    	Image::make($image)->resize(300,300)->save('upload/brand/'.$name_gen);
    	$save_url = 'upload/brand/'.$name_gen;
        Brand::insert([
            'brand_name_en' => $request->brand_name_en,
            'brand_slug_en' => strtolower(str_replace(' ', '-',$request->brand_name_en)),
            'brand_image' => $save_url,
        ]);
        $notification = array(
            'message' => 'Brand Inserted Successfully',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }

    public function BrandEdit($id){
    	$brand = Brand::findOrFail($id);
    	return view('backend.brand.brand_edit',compact('brand'));
    }

    public function BrandUpdate(Request $request){
    	$brand_id = $request->id;
    	$old_img = $request->old_image;
    	if ($request->file('brand_image')) {
            unlink($old_img);
            $image = $request->file('brand_image');
            $name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
            Image::make($image)->resize(300,300)->save('upload/brand/'.$name_gen);
            
            $save_url = 'upload/brand/'.$name_gen;
            Brand::findOrFail($brand_id)->update([
                'brand_name_en' => $request->brand_name_en,
                'brand_slug_en' => strtolower(str_replace(' ', '-',$request->brand_name_en)),
                'brand_image' => $save_url,
            ]);
            $notification = array(
                'message' => 'Brand Updated Successfully',
                'alert-type' => 'info'
            );
            return redirect()->route('all.brand')->with($notification);
    	}else{
            Brand::findOrFail($brand_id)->update([
                'brand_name_en' => $request->brand_name_en,
                'brand_slug_en' => strtolower(str_replace(' ', '-',$request->brand_name_en)),
            ]);
            $notification = array(
                'message' => 'Brand Updated Successfully',
                'alert-type' => 'info'
		);
		return redirect()->route('all.brand')->with($notification);
    	}
    }

    public function BrandDelete($id){
    	$brand = Brand::findOrFail($id);
    	$img = $brand->brand_image;
    	unlink($img);
    	Brand::findOrFail($id)->delete();
    	$notification = array(
			'message' => 'Brand Deleted Successfully',
			'alert-type' => 'info'
		);
		return redirect()->back()->with($notification);
    }

    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    // Category Logic
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------

    public function CategoryView(){
    	$category = Category::latest()->get();
    	return view('backend.category.category_view',compact('category'));
    }

    public function CategoryStore(Request $request){
        $request->validate([
    		'category_name_en' => 'required',
    		'category_icon' => 'required',
    	],[
    		'category_name_en.required' => 'Input Category English Name',
    	]);
	    Category::insert([
            'category_name_en' => $request->category_name_en,
            'category_slug_en' => strtolower(str_replace(' ', '-',$request->category_name_en)),
            'category_icon' => $request->category_icon,
    	]);
	    $notification = array(
			'message' => 'Category Inserted Successfully',
			'alert-type' => 'success'
		);
		return redirect()->back()->with($notification);
    }

    public function CategoryEdit($id){
    	$category = Category::findOrFail($id);
    	return view('backend.category.category_edit',compact('category'));

    }

    public function CategoryUpdate(Request $request ,$id){
        Category::findOrFail($id)->update([
            'category_name_en' => $request->category_name_en,
            'category_slug_en' => strtolower(str_replace(' ', '-',$request->category_name_en)),
            'category_icon' => $request->category_icon,
    	]);
	    $notification = array(
			'message' => 'Category Updated Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('all.category')->with($notification);
    }

    public function CategoryDelete($id){
    	Category::findOrFail($id)->delete();
    	$notification = array(
			'message' => 'Category Deleted Successfully',
			'alert-type' => 'success'
		);
		return redirect()->back()->with($notification);
    }

    
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    // Sub Category Logic
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------

    public function SubCategoryView(){
    	$categories = Category::orderBy('category_name_en','ASC')->get();
    	$subcategory = SubCategory::latest()->get();
    	return view('backend.category.subcategory_view',compact('subcategory','categories'));
    }

    public function SubCategoryStore(Request $request){
        $request->validate([
    		'category_id' => 'required',
    		'subcategory_name_en' => 'required',
    	],[
    		'category_id.required' => 'Please select Any option',
    		'subcategory_name_en.required' => 'Input SubCategory English Name',
    	]);
	    SubCategory::insert([
            'category_id' => $request->category_id,
            'subcategory_name_en' => $request->subcategory_name_en,
            'subcategory_slug_en' => strtolower(str_replace(' ', '-',$request->subcategory_name_en)),
    	]);
	    $notification = array(
			'message' => 'SubCategory Inserted Successfully',
			'alert-type' => 'success'
		);
		return redirect()->back()->with($notification);
    }

    public function SubCategoryEdit($id){
    	$categories = Category::orderBy('category_name_en','ASC')->get();
    	$subcategory = SubCategory::findOrFail($id);
    	return view('backend.category.subcategory_edit',compact('subcategory','categories'));
    }

    public function SubCategoryUpdate(Request $request){
    	$subcat_id = $request->id;
    	SubCategory::findOrFail($subcat_id)->update([
            'category_id' => $request->category_id,
            'subcategory_name_en' => $request->subcategory_name_en,
            'subcategory_slug_en' => strtolower(str_replace(' ', '-',$request->subcategory_name_en)),
    	]);
	    $notification = array(
			'message' => 'SubCategory Updated Successfully',
			'alert-type' => 'info'
		);
		return redirect()->route('all.subcategory')->with($notification);
    }

    public function SubCategoryDelete($id){
    	SubCategory::findOrFail($id)->delete();
    	$notification = array(
			'message' => 'SubCategory Deleted Successfully',
			'alert-type' => 'info'
		);
		return redirect()->back()->with($notification);
    }


    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    // Sub Sub Category Logic
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------

    public function SubSubCategoryView(){
 	    $categories = Category::orderBy('category_name_en','ASC')->get();
        $subcategories = SubCategory::orderBy('subcategory_name_en','ASC')->get();
    	$subsubcategories = SubSubCategory::latest()->get();
    	return view('backend.category.sub_subcategory_view',compact('subsubcategories', 'subcategories', 'categories'));
    }

    public function GetSubCategory($category_id){
     	$subcat = SubCategory::where('category_id',$category_id)->orderBy('subcategory_name_en','ASC')->get();
     	return json_encode($subcat);
    }

    public function GetSubSubCategory($subcategory_id){
        $subsubcat = SubSubCategory::where('subcategory_id',$subcategory_id)->orderBy('subsubcategory_name_en','ASC')->get();
        return json_encode($subsubcat);
    }

    public function SubSubCategoryStore(Request $request){
        $request->validate([
    		'category_id' => 'required',
    		'subcategory_id' => 'required',
    		'subsubcategory_name_en' => 'required',
    	],[
    		'category_id.required' => 'Please select Any option',
    		'subsubcategory_name_en.required' => 'Input SubSubCategory English Name',
    	]);
	    SubSubCategory::insert([
            'category_id' => $request->category_id,
            'subcategory_id' => $request->subcategory_id,
            'subsubcategory_name_en' => $request->subsubcategory_name_en,
            'subsubcategory_slug_en' => strtolower(str_replace(' ', '-',$request->subsubcategory_name_en)),
    	]);
	    $notification = array(
			'message' => 'Sub-SubCategory Inserted Successfully',
			'alert-type' => 'success'
		);
		return redirect()->back()->with($notification);
    }

    public function SubSubCategoryEdit($id){
    	$categories = Category::orderBy('category_name_en','ASC')->get();
    	$subcategories = SubCategory::orderBy('subcategory_name_en','ASC')->get();
    	$subsubcategories = SubSubCategory::findOrFail($id);
    	return view('backend.category.sub_subcategory_edit',compact('categories','subcategories','subsubcategories'));
    }

    public function SubSubCategoryUpdate(Request $request){
    	$subsubcat_id = $request->id;
    	SubSubCategory::findOrFail($subsubcat_id)->update([
            'category_id' => $request->category_id,
            'subcategory_id' => $request->subcategory_id,
            'subsubcategory_name_en' => $request->subsubcategory_name_en,
            'subsubcategory_slug_en' => strtolower(str_replace(' ', '-',$request->subsubcategory_name_en)),
    	]);
	    $notification = array(
			'message' => 'Sub-SubCategory Update Successfully',
			'alert-type' => 'info'
		);
		return redirect()->route('all.subsubcategory')->with($notification);
    }

    public function SubSubCategoryDelete($id){
    	SubSubCategory::findOrFail($id)->delete();
    	$notification = array(
			'message' => 'Sub-SubCategory Deleted Successfully',
			'alert-type' => 'info'
		);
		return redirect()->back()->with($notification);
    }



    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    // Product Logic
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------

	public function AddProduct(){
		$categories = Category::latest()->get();
		$brands = Brand::latest()->get();
		return view('backend.product.product_add',compact('categories','brands'));
	}

	public function StoreProduct(Request $request){
        if(!Storage::disk ('public')->exists('upload/products/thambnail/')){
            Storage::disk('public')->makeDirectory('upload/products/thambnail/');
        }
        if(!Storage::disk ('public')->exists('upload/pdf/')){
            Storage::disk('public')->makeDirectory('upload/pdf/');
        }
        
        $image = $request->file('product_thambnail');
    	$name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
    	Image::make($image)->resize(917,1000)->save('upload/products/thambnail/'.$name_gen);
    	$save_url = 'upload/products/thambnail/'.$name_gen;
        $product_id = Product::insertGetId([
            'brand_id' => $request->brand_id,
            'category_id' => $request->category_id,
            'subcategory_id' => $request->subcategory_id,
            'subsubcategory_id' => $request->subsubcategory_id,
            'product_name_en' => $request->product_name_en,
            'product_slug_en' =>  strtolower(str_replace(' ', '-', $request->product_name_en)),
            'product_code' => $request->product_code,
            'product_qty' => $request->product_qty,
            'product_tags_en' => $request->product_tags_en,
            'product_size_en' => $request->product_size_en,
            'product_color_en' => $request->product_color_en,

            'selling_price' => $request->selling_price,
            'discount_price' => $request->discount_price,
            'short_descp_en' => $request->short_descp_en,
            'long_descp_en' => $request->long_descp_en,

            'hot_deals' => $request->hot_deals,
            'featured' => $request->featured,
            'special_offer' => $request->special_offer,
            'special_deals' => $request->special_deals,
            'product_thambnail' => $save_url,
            'status' => 1,
        ]);

        // Multiple Image Upload Start
        $images = $request->file('multi_img');
        foreach ($images as $img) {
            $make_name = hexdec(uniqid()).'.'.$img->getClientOriginalExtension();
            if(!Storage::disk ('public')->exists('upload/products/multi-image/')){
                Storage::disk('public')->makeDirectory('upload/products/multi-image/');
            }
            Image::make($img)->resize(917,1000)->save('upload/products/multi-image/'.$make_name);
            $uploadPath = 'upload/products/multi-image/'.$make_name;
            MultiImg::insert([
                'product_id' => $product_id,
                'photo_name' => $uploadPath,
                'created_at' => Carbon::now(), 
            ]);
        }

        // Een Multiple Image Upload Start
        $notification = array(
			'message' => 'Product Inserted Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('manage-product')->with($notification);
	}

	public function ManageProduct(){

		$products = Product::latest()->get();
		return view('backend.product.product_view',compact('products'));
	}

	public function EditProduct($id){
		$multiImgs = MultiImg::where('product_id',$id)->get();
		$categories = Category::latest()->get();
		$brands = Brand::latest()->get();
		$subcategory = SubCategory::latest()->get();
		$subsubcategory = SubSubCategory::latest()->get();
		$products = Product::findOrFail($id);
		return view('backend.product.product_edit',compact('categories','brands','subcategory','subsubcategory','products','multiImgs'));
	}

	public function ProductDataUpdate(Request $request){
		$product_id = $request->id;
        Product::findOrFail($product_id)->update([
            'brand_id' => $request->brand_id,
            'category_id' => $request->category_id,
            'subcategory_id' => $request->subcategory_id,
            'subsubcategory_id' => $request->subsubcategory_id,
            'product_name_en' => $request->product_name_en,
            'product_slug_en' =>  strtolower(str_replace(' ', '-', $request->product_name_en)),
            'product_code' => $request->product_code,

            'product_qty' => $request->product_qty,
            'product_tags_en' => $request->product_tags_en,
            'product_size_en' => $request->product_size_en,
            'product_color_en' => $request->product_color_en,

            'selling_price' => $request->selling_price,
            'discount_price' => $request->discount_price,
            'short_descp_en' => $request->short_descp_en,
            'long_descp_en' => $request->long_descp_en,
            'hot_deals' => $request->hot_deals,
            'featured' => $request->featured,
            'special_offer' => $request->special_offer,
            'special_deals' => $request->special_deals,      	 
            'status' => 1,
            'created_at' => Carbon::now(),
        ]);
        $notification = array(
		    'message' => 'Product Updated Without Image Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('manage-product')->with($notification);
	} 

    // Multiple Image Update
	public function MultiImageUpdate(Request $request){
		$imgs = $request->multi_img;
		foreach ($imgs as $id => $img) {
            $imgDel = MultiImg::findOrFail($id);
            unlink($imgDel->photo_name);
            $make_name = hexdec(uniqid()).'.'.$img->getClientOriginalExtension();
            if(!Storage::disk ('public')->exists('upload/products/multi-image/')){
                Storage::disk('public')->makeDirectory('upload/products/multi-image/');
            }
            Image::make($img)->resize(917,1000)->save('upload/products/multi-image/'.$make_name);
            $uploadPath = 'upload/products/multi-image/'.$make_name;
            MultiImg::where('id',$id)->update([
                'photo_name' => $uploadPath,
                'updated_at' => Carbon::now(),
            ]);
	    }
        $notification = array(
            'message' => 'Product Image Updated Successfully',
            'alert-type' => 'info'
        );
        return redirect()->back()->with($notification);
	} 


    // Product Main Thambnail Update
    public function ThambnailImageUpdate(Request $request){
 	$pro_id = $request->id;
 	$oldImage = $request->old_img;
 	unlink($oldImage);
    $image = $request->file('product_thambnail');
    	$name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
    	Image::make($image)->resize(917,1000)->save('upload/products/thambnail/'.$name_gen);
    	$save_url = 'upload/products/thambnail/'.$name_gen;
    	Product::findOrFail($pro_id)->update([
    		'product_thambnail' => $save_url,
    		'updated_at' => Carbon::now(),
    	]);
        $notification = array(
			'message' => 'Product Image Thambnail Updated Successfully',
			'alert-type' => 'info'
		);
		return redirect()->back()->with($notification);
    }


    // Multi Image Delete
    public function MultiImageDelete($id){
     	$oldimg = MultiImg::findOrFail($id);
     	unlink($oldimg->photo_name);
     	MultiImg::findOrFail($id)->delete();
     	$notification = array(
			'message' => 'Product Image Deleted Successfully',
			'alert-type' => 'success'
		);
		return redirect()->back()->with($notification);
    }

    public function ProductInactive($id){
     	Product::findOrFail($id)->update(['status' => 0]);
     	$notification = array(
			'message' => 'Product Inactive',
			'alert-type' => 'success'
		);
		return redirect()->back()->with($notification);
    }

    public function ProductActive($id){
  	    Product::findOrFail($id)->update(['status' => 1]);
     	$notification = array(
			'message' => 'Product Active',
			'alert-type' => 'success'
		);
		return redirect()->back()->with($notification);
    }

    public function ProductDelete($id){
     	$product = Product::findOrFail($id);
     	unlink($product->product_thambnail);
     	Product::findOrFail($id)->delete();
     	$images = MultiImg::where('product_id',$id)->get();
     	foreach ($images as $img) {
     		unlink($img->photo_name);
     		MultiImg::where('product_id',$id)->delete();
     	}
     	$notification = array(
			'message' => 'Product Deleted Successfully',
			'alert-type' => 'success'
		);
		return redirect()->back()->with($notification);

    }

    // product Stock 
    public function ProductStock(){
        $products = Product::latest()->get();
        return view('backend.product.product_stock',compact('products'));
    }


    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    // Slider Logic
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    public function SliderView(){
		$sliders = Slider::latest()->get();
		return view('backend.slider.slider_view',compact('sliders'));
	}

    public function SliderStore(Request $request){
    	$request->validate([
    		'slider_img' => 'required',
    	],[
    		'slider_img.required' => 'Plz Select One Image',
    	]);
    	$image = $request->file('slider_img');
    	$name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
    	Image::make($image)->resize(870,370)->save('upload/slider/'.$name_gen);
    	$save_url = 'upload/slider/'.$name_gen;
	    Slider::insert([
            'title' => $request->title,
            'description' => $request->description,
            'slider_img' => $save_url,
    	]);
	    $notification = array(
			'message' => 'Slider Inserted Successfully',
			'alert-type' => 'success'
		);
		return redirect()->back()->with($notification);
    } 

    public function SliderEdit($id){
    $sliders = Slider::findOrFail($id);
		return view('backend.slider.slider_edit',compact('sliders'));
    }

    public function SliderUpdate(Request $request){
    	$slider_id = $request->id;
    	$old_img = $request->old_image;
    	if ($request->file('slider_img')) {
            unlink($old_img);
            $image = $request->file('slider_img');
            $name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
            Image::make($image)->resize(870,370)->save('upload/slider/'.$name_gen);
            $save_url = 'upload/slider/'.$name_gen;
            Slider::findOrFail($slider_id)->update([
                'title' => $request->title,
                'description' => $request->description,
                'slider_img' => $save_url,
            ]);
            $notification = array(
                'message' => 'Slider Updated Successfully',
                'alert-type' => 'info'
            );
            return redirect()->route('manage-slider')->with($notification);
    	}else{
            Slider::findOrFail($slider_id)->update([
                'title' => $request->title,
                'description' => $request->description,
            ]);
            $notification = array(
                'message' => 'Slider Updated Without Image Successfully',
                'alert-type' => 'info'
            );
            return redirect()->route('manage-slider')->with($notification);
    	} 
    } 

    public function SliderDelete($id){
    	$slider = Slider::findOrFail($id);
    	$img = $slider->slider_img;
    	unlink($img);
    	Slider::findOrFail($id)->delete();
    	$notification = array(
			'message' => 'Slider Delectd Successfully',
			'alert-type' => 'info'
		);
		return redirect()->back()->with($notification);
    }

    public function SliderInactive($id){
    	Slider::findOrFail($id)->update(['status' => 0]);
    	$notification = array(
			'message' => 'Slider Inactive Successfully',
			'alert-type' => 'info'
		);
		return redirect()->back()->with($notification);
    }

    public function SliderActive($id){
    	Slider::findOrFail($id)->update(['status' => 1]);
    	$notification = array(
			'message' => 'Slider Active Successfully',
			'alert-type' => 'info'
		);
		return redirect()->back()->with($notification);
    }


    // ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	// Admin User Logic
	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------

    public function AllAdminRole(){
    	$adminuser = Admin::where('type',2)->latest()->get();
    	return view('backend.role.admin_role_all',compact('adminuser'));
    }

    public function AddAdminRole(){
    	return view('backend.role.admin_role_create');
    }

    public function StoreAdminRole(Request $request){
    	$image = $request->file('profile_photo_path');
    	$name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
    	Image::make($image)->resize(225,225)->save('upload/admin_images/'.$name_gen);
    	$save_url = 'upload/admin_images/'.$name_gen;
	    Admin::insert([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'phone' => $request->phone,
            'brand' => $request->brand,
            'category' => $request->category,
            'product' => $request->product,
            'slider' => $request->slider,
            'coupons' => $request->coupons,

            'shipping' => $request->shipping,
            'blog' => $request->blog,
            'setting' => $request->setting,
            'returnorder' => $request->returnorder,
            'review' => $request->review,

            'orders' => $request->orders,
            'stock' => $request->stock,
            'reports' => $request->reports,
            'alluser' => $request->alluser,
            'adminuserrole' => $request->adminuserrole,
            'type' => 2,
            'profile_photo_path' => $save_url,
            'created_at' => Carbon::now(),
    	]);
	    $notification = array(
			'message' => 'Admin User Created Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('all.admin.user')->with($notification);
    }
    public function EditAdminRole($id){
    	$adminuser = Admin::findOrFail($id);
    	return view('backend.role.admin_role_edit',compact('adminuser'));
    }
    public function UpdateAdminRole(Request $request){
    	$admin_id = $request->id;
    	$old_img = $request->old_image;
    	if ($request->file('profile_photo_path')) {
            $image = $request->file('profile_photo_path');
            $name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
            Image::make($image)->resize(225,225)->save('upload/admin_images/'.$name_gen);
            $save_url = 'upload/admin_images/'.$name_gen;
            Admin::findOrFail($admin_id)->update([
                'name' => $request->name,
                'email' => $request->email,
                'phone' => $request->phone,
                // ($request->name) == 0 ? "'brand' = 0,":"'brand' => $request->brand",
                'brand' => $request->brand,
                'category' => $request->category,
                'product' => $request->product,
                'slider' => $request->slider,
                'coupons' => $request->coupons,
                'shipping' => $request->shipping,
                'blog' => $request->blog,
                'setting' => $request->setting,
                'returnorder' => $request->returnorder,
                'review' => $request->review,
                'orders' => $request->orders,
                'stock' => $request->stock,
                'reports' => $request->reports,
                'alluser' => $request->alluser,
                'adminuserrole' => $request->adminuserrole,
                'type' => 2,
                'profile_photo_path' => $save_url,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);

            $notification = array(
                'message' => 'Admin User Updated Successfully',
                'alert-type' => 'info'
            );
            return redirect()->route('all.admin.user')->with($notification);

    	}else{
            Admin::findOrFail($admin_id)->update([
                'name' => $request->name,
                'email' => $request->email,
                'phone' => $request->phone,
                'brand' => $request->brand,
                'category' => $request->category,
                'product' => $request->product,
                'slider' => $request->slider,
                'coupons' => $request->coupons,
                'shipping' => $request->shipping,
                'blog' => $request->blog,
                'setting' => $request->setting,
                'returnorder' => $request->returnorder,
                'review' => $request->review,
                'orders' => $request->orders,
                'stock' => $request->stock,
                'reports' => $request->reports,
                'alluser' => $request->alluser,
                'adminuserrole' => $request->adminuserrole,
                'type' => 2,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);
            $notification = array(
                'message' => 'Admin User Updated Successfully',
                'alert-type' => 'info'
            );
            return redirect()->route('all.admin.user')->with($notification);
    	}
    }

 	public function DeleteAdminRole($id){
 		$adminimg = Admin::findOrFail($id);
 		$img = $adminimg->profile_photo_path;
 		unlink($img);
 		Admin::findOrFail($id)->delete();
 		$notification = array(
		    'message' => 'Admin User Deleted Successfully',
			'alert-type' => 'info'
		);
		return redirect()->back()->with($notification);
 	}



    // ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	// Blog Logic
	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------

    public function BlogCategory(){
        $blogcategory = BlogPostCategory::latest()->get();
        return view('backend.blog.category.category_view',compact('blogcategory'));
    }

    public function BlogCategoryStore(Request $request){
        $request->validate([
            'blog_category_name_en' => 'required',
                
        ],[
            'blog_category_name_en.required' => 'Input Blog Category English Name',
        ]);

        BlogPostCategory::insert([
            'blog_category_name_en' => $request->blog_category_name_en,
            'blog_category_slug_en' => strtolower(str_replace(' ', '-',$request->blog_category_name_en)),
            'created_at' => Carbon::now(),
        ]);
        $notification = array(
            'message' => 'Blog Category Inserted Successfully',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }

    public function BlogCategoryEdit($id){
        $blogcategory = BlogPostCategory::findOrFail($id);
        return view('backend.blog.category.category_edit',compact('blogcategory'));
    }

    public function BlogCategoryUpdate(Request $request){

        $blogcar_id = $request->id;
            

        BlogPostCategory::findOrFail($blogcar_id)->update([
            'blog_category_name_en' => $request->blog_category_name_en,
            'blog_category_slug_en' => strtolower(str_replace(' ', '-',$request->blog_category_name_en)),
            'created_at' => Carbon::now(),
        ]);
        $notification = array(
            'message' => 'Blog Category Updated Successfully',
            'alert-type' => 'info'
        );
        return redirect()->route('blog.category')->with($notification);
    }

    //  Blog Post ALL Methods
    public function ListBlogPost(){
        $blogpost = BlogPost::with('category')->latest()->get();
        return view('backend.blog.post.post_list',compact('blogpost'));
    }

    public function AddBlogPost(){
        $blogcategory = BlogPostCategory::latest()->get();
        $blogpost = BlogPost::latest()->get();
        return view('backend.blog.post.post_view',compact('blogpost','blogcategory'));
    }   

    public function BlogPostStore(Request $request){
        $request->validate([
            'post_title_en' => 'required',
            'post_image' => 'required',
        ],[
            'post_title_en.required' => 'Input Post Title English Name',
        ]);
        $image = $request->file('post_image');
        $name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
        Image::make($image)->resize(780,433)->save('upload/post/'.$name_gen);
        $save_url = 'upload/post/'.$name_gen;

        BlogPost::insert([
            'category_id' => $request->category_id,
            'post_title_en' => $request->post_title_en,
            'post_slug_en' => strtolower(str_replace(' ', '-',$request->post_title_en)),
            'post_image' => $save_url,
            'post_details_en' => $request->post_details_en,
            'created_at' => Carbon::now(),
        ]);
        $notification = array(
            'message' => 'Blog Post Inserted Successfully',
            'alert-type' => 'success'
        );
        return redirect()->route('list.post')->with($notification);
    }


    // ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	// Coupon Logic
	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------

    public function CouponView(){
    	$coupons = Coupon::orderBy('id','DESC')->get();
    	return view('backend.coupon.view_coupon',compact('coupons'));
    }

    public function CouponStore(Request $request){
    	$request->validate([
    		'coupon_name' => 'required',
    		'coupon_discount' => 'required',
    		'coupon_validity' => 'required',
    	]);
	    Coupon::insert([
            'coupon_name' => strtoupper($request->coupon_name),
            'coupon_discount' => $request->coupon_discount, 
            'coupon_validity' => $request->coupon_validity,
            'created_at' => Carbon::now(),
    	]);
	    $notification = array(
			'message' => 'Coupon Inserted Successfully',
			'alert-type' => 'success'
		);
		return redirect()->back()->with($notification);
    }

    public function CouponEdit($id){
        $coupons = Coupon::findOrFail($id);
    	return view('backend.coupon.edit_coupon',compact('coupons'));
    }

    public function CouponUpdate(Request $request, $id){
        Coupon::findOrFail($id)->update([
            'coupon_name' => strtoupper($request->coupon_name),
            'coupon_discount' => $request->coupon_discount, 
            'coupon_validity' => $request->coupon_validity,
            'created_at' => Carbon::now(),
    	]);
	    $notification = array(
			'message' => 'Coupon Updated Successfully',
			'alert-type' => 'info'
		);
		return redirect()->route('manage-coupon')->with($notification);
    }

    public function CouponDelete($id){
    	Coupon::findOrFail($id)->delete();
    	$notification = array(
			'message' => 'Coupon Deleted Successfully',
			'alert-type' => 'info'
		);
		return redirect()->back()->with($notification);
    }


    // ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	// Order Logic
	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
 
	public function PendingOrders(){
		$orders = Order::where('status','pending')->orderBy('id','DESC')->get();
		return view('backend.orders.pending_orders',compact('orders'));

	} 
 
	public function PendingOrdersDetails($order_id){
		$order = Order::with('division','district','state','user')->where('id',$order_id)->first();
    	$orderItem = OrderItem::with('product')->where('order_id',$order_id)->orderBy('id','DESC')->get();
    	return view('backend.orders.pending_orders_details',compact('order','orderItem'));
	}

	public function ConfirmedOrders(){
		$orders = Order::where('status','confirm')->orderBy('id','DESC')->get();
		return view('backend.orders.confirmed_orders',compact('orders'));
	}

	public function ProcessingOrders(){
		$orders = Order::where('status','processing')->orderBy('id','DESC')->get();
		return view('backend.orders.processing_orders',compact('orders'));
	}

	public function PickedOrders(){
		$orders = Order::where('status','picked')->orderBy('id','DESC')->get();
		return view('backend.orders.picked_orders',compact('orders'));
	}

	public function ShippedOrders(){
		$orders = Order::where('status','shipped')->orderBy('id','DESC')->get();
		return view('backend.orders.shipped_orders',compact('orders'));
	}

	public function DeliveredOrders(){
		$orders = Order::where('status','delivered')->orderBy('id','DESC')->get();
		return view('backend.orders.delivered_orders',compact('orders'));
	} 

	public function CancelOrders(){
		$orders = Order::where('status','cancel')->orderBy('id','DESC')->get();
		return view('backend.orders.cancel_orders',compact('orders'));
	}

	public function PendingToConfirm($order_id){
        Order::findOrFail($order_id)->update(['status' => 'confirm']);
        $notification = array(
			'message' => 'Order Confirm Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('pending-orders')->with($notification);
	}

	public function ConfirmToProcessing($order_id){
        Order::findOrFail($order_id)->update(['status' => 'processing']);
        $notification = array(
			'message' => 'Order Processing Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('confirmed-orders')->with($notification);
	}

	public function ProcessingToPicked($order_id){
        Order::findOrFail($order_id)->update(['status' => 'picked']);
        $notification = array(
			'message' => 'Order Picked Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('processing-orders')->with($notification);
	}

	public function PickedToShipped($order_id){
        Order::findOrFail($order_id)->update(['status' => 'shipped']);
        $notification = array(
			'message' => 'Order Shipped Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('picked-orders')->with($notification);
	}
    public function ShippedToDelivered($order_id){
        $product = OrderItem::where('order_id',$order_id)->get();
        foreach ($product as $item) {
            Product::where('id',$item->product_id)->update(['product_qty' => DB::raw('product_qty-'.$item->qty)]);
        }
        Order::findOrFail($order_id)->update(['status' => 'delivered']);
        $notification = array(
			'message' => 'Order Delivered Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('shipped-orders')->with($notification);
	}

	public function AdminInvoiceDownload($order_id){
		$order = Order::with('division','district','state','user')->where('id',$order_id)->first();
    	$orderItem = OrderItem::with('product')->where('order_id',$order_id)->orderBy('id','DESC')->get();
		$pdf = PDF::loadView('backend.orders.order_invoice',compact('order','orderItem'))->setPaper('a4')->setOptions([
			'tempDir' => public_path(),
			'chroot' => public_path(),
		]);
		return $pdf->download('invoice.pdf');
	}

    public function OrderCancel($order_id){
        Order::findOrFail($order_id)->update(['status' => 'cancel']);
        $notification = array(
			'message' => 'Order Cancel Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('pending-orders')->with($notification);
	}


    // ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	// Report Logic
	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------

    public function ReportView(){

        return view('backend.report.report_view');
    }

    public function ReportByDate(Request $request){
        $date = new DateTime($request->date);
        $formatDate = $date->format('d F Y');
        $orders = Order::where('order_date',$formatDate)->latest()->get();
        return view('backend.report.report_show',compact('orders'));
    }

    public function ReportByMonth(Request $request){
        $orders = Order::where('order_month',$request->month)->where('order_year',$request->year_name)->latest()->get();
        return view('backend.report.report_show',compact('orders'));
    }

    public function ReportByYear(Request $request){
        $orders = Order::where('order_year',$request->year)->latest()->get();
        return view('backend.report.report_show',compact('orders'));
    }


    // ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	// Return Logic
	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------

    public function ReturnRequest(){
    	$orders = Order::where('return_order',1)->orderBy('id','DESC')->get();
    	return view('backend.return_order.return_request',compact('orders'));
    }
  
    public function ReturnRequestApprove($order_id){
    	Order::where('id',$order_id)->update(['return_order' => 2]);
    	$notification = array(
            'message' => 'Return Order Successfully',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }

    public function ReturnAllRequest(){
    	$orders = Order::where('return_order',2)->orderBy('id','DESC')->get();
    	return view('backend.return_order.all_return_request',compact('orders'));
    }


    // ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	// Shipping Area Logic
	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------

    public function DivisionView(){
		$divisions = ShipDivision::orderBy('id','DESC')->get();
		return view('backend.ship.division.view_division',compact('divisions'));
	}

    public function DivisionStore(Request $request){
    	$request->validate([
    	    'division_name' => 'required',   	 
    	]);
	    ShipDivision::insert([
            'division_name' => $request->division_name,
            'created_at' => Carbon::now(),
    	]);
	    $notification = array(
			'message' => 'Division Inserted Successfully',
			'alert-type' => 'success'
		);
		return redirect()->back()->with($notification);
    }

    public function DivisionEdit($id){
        $divisions = ShipDivision::findOrFail($id);
        return view('backend.ship.division.edit_division',compact('divisions'));
    }

    public function DivisionUpdate(Request $request,$id){
    	ShipDivision::findOrFail($id)->update([
            'division_name' => $request->division_name,
            'created_at' => Carbon::now(),
    	]);
	    $notification = array(
			'message' => 'Division Updated Successfully',
			'alert-type' => 'info'
		);
		return redirect()->route('manage-division')->with($notification);
    }

    public function DivisionDelete($id){
    	ShipDivision::findOrFail($id)->delete();
    	$notification = array(
			'message' => 'Division Deleted Successfully',
			'alert-type' => 'info'
		);
		return redirect()->back()->with($notification);
    }

    // Start Ship District 
    public function DistrictView(){
        $division = ShipDivision::orderBy('division_name','ASC')->get();
        $district = ShipDistrict::with('division')->orderBy('id','DESC')->get();
		return view('backend.ship.district.view_district',compact('division','district'));
    }

    public function DistrictStore(Request $request){
    	$request->validate([
    		'division_id' => 'required',  
    		'district_name' => 'required',  	 
    	]);
	    ShipDistrict::insert([
            'division_id' => $request->division_id,
            'district_name' => $request->district_name,
            'created_at' => Carbon::now(),
    	]);
	    $notification = array(
			'message' => 'District Inserted Successfully',
			'alert-type' => 'success'
		);
		return redirect()->back()->with($notification);
    }

    public function DistrictEdit($id){
        $division = ShipDivision::orderBy('division_name','ASC')->get();
        $district = ShipDistrict::findOrFail($id);
        return view('backend.ship.district.edit_district',compact('district','division'));
    }

    public function DistrictUpdate(Request $request,$id){
    	ShipDistrict::findOrFail($id)->update([
            'division_id' => $request->division_id,
            'district_name' => $request->district_name,
            'created_at' => Carbon::now(),
    	]);
	    $notification = array(
			'message' => 'District Updated Successfully',
			'alert-type' => 'info'
		);
		return redirect()->route('manage-district')->with($notification);
    } 

    public function DistrictDelete($id){
        ShipDistrict::findOrFail($id)->delete();
    	$notification = array(
			'message' => 'District Deleted Successfully',
			'alert-type' => 'info'
		);
		return redirect()->back()->with($notification);
    }
 
    // Ship State
    public function StateView(){
    $division = ShipDivision::orderBy('division_name','ASC')->get();
    $district = ShipDistrict::orderBy('district_name','ASC')->get();
    $state = ShipState::with('division','district')->orderBy('id','DESC')->get();
		return view('backend.ship.state.view_state',compact('division','district','state'));
    }

    public function StateStore(Request $request){
    	$request->validate([
    		'division_id' => 'required',  
    		'district_id' => 'required', 
    		'state_name' => 'required', 	 
    	 
    	]);
	    ShipState::insert([
            'division_id' => $request->division_id,
            'district_id' => $request->district_id,
            'state_name' => $request->state_name,
            'created_at' => Carbon::now(),
    	]);
	    $notification = array(
			'message' => 'State Inserted Successfully',
			'alert-type' => 'success'
		);
		return redirect()->back()->with($notification);
    }

    public function StateEdit($id){
        $division = ShipDivision::orderBy('division_name','ASC')->get();
        $district = ShipDistrict::orderBy('district_name','ASC')->get();
        $state = ShipState::findOrFail($id);
		return view('backend.ship.state.edit_state',compact('division','district','state'));
    }

    public function StateUpdate(Request $request,$id){
    	ShipState::findOrFail($id)->update([
            'division_id' => $request->division_id,
            'district_id' => $request->district_id,
            'state_name' => $request->state_name,
            'created_at' => Carbon::now(),
    	]);
	    $notification = array(
			'message' => 'State Updated Successfully',
			'alert-type' => 'info'
		);
		return redirect()->route('manage-state')->with($notification);
    }

    public function StateDelete($id){
    	ShipState::findOrFail($id)->delete();
    	$notification = array(
			'message' => 'State Deleted Successfully',
			'alert-type' => 'info'
		);
		return redirect()->back()->with($notification);
    }


    // ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	// Shipping Area Logic
	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------

    public function SiteSetting(){
    	$setting = SiteSetting::find(1);
    	return view('backend.setting.setting_update',compact('setting'));
    }

    public function SiteSettingUpdate(Request $request){
    	$setting_id = $request->id;
    	if ($request->file('logo')) {
            $image = $request->file('logo');
            $name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
            Image::make($image)->resize(139,36)->save('upload/logo/'.$name_gen);
            $save_url = 'upload/logo/'.$name_gen;

            SiteSetting::findOrFail($setting_id)->update([
                'phone_one' => $request->phone_one,
                'phone_two' => $request->phone_two,
                'email' => $request->email,
                'company_name' => $request->company_name,
                'company_address' => $request->company_address,
                'facebook' => $request->facebook,
                'twitter' => $request->twitter,
                'linkedin' => $request->linkedin,
                'youtube' => $request->youtube,
                'logo' => $save_url,
            ]);
            $notification = array(
                'message' => 'Setting Updated with Image Successfully',
                'alert-type' => 'info'
            );
            return redirect()->back()->with($notification);
        }else{
            SiteSetting::findOrFail($setting_id)->update([
                'phone_one' => $request->phone_one,
                'phone_two' => $request->phone_two,
                'email' => $request->email,
                'company_name' => $request->company_name,
                'company_address' => $request->company_address,
                'facebook' => $request->facebook,
                'twitter' => $request->twitter,
                'linkedin' => $request->linkedin,
                'youtube' => $request->youtube,
            ]);
            $notification = array(
                'message' => 'Setting Updated Successfully',
                'alert-type' => 'info'
            );
            return redirect()->back()->with($notification);
    	}
    }

    public function SeoSetting(){
    	$seo = Seo::find(1);
    	return view('backend.setting.seo_update',compact('seo'));
    }
 
    public function SeoSettingUpdate(Request $request){
    	$seo_id = $request->id;
    	Seo::findOrFail($seo_id)->update([
            'meta_title' => $request->meta_title,
            'meta_author' => $request->meta_author,
            'meta_keyword' => $request->meta_keyword,
            'meta_description' => $request->meta_description,
            'google_analytics' => $request->google_analytics,		 
    	]);
	    $notification = array(
			'message' => 'Seo Updated Successfully',
			'alert-type' => 'info'
		);
		return redirect()->back()->with($notification);
    }
}
