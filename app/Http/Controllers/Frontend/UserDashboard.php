<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use Gloudemans\Shoppingcart\Facades\Cart;

use App\Mail\OrderMail;
use Illuminate\Support\Facades\Mail;

use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Session;
use App\Models\Blog\BlogPostCategory;
use App\Models\SubSubCategory;
use App\Models\ShipDivision;
use App\Models\ShipDistrict;
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
use App\Models\Brand;
use App\Models\Order;
use App\Models\User;
use Carbon\Carbon;
use Storage;
use Auth;
use PDF;


class UserDashboard extends Controller{

    // ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	// User Dashboard Logic
	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------

    public function UserLogout(){
        Auth::logout();
        return redirect()->route('login');
    }
    public function UserProfile(){
        $id = Auth::user()->id;
        $user = User::find($id);
        return view('frontend.profile.user_profile', compact('user'));
    }
    public function UserProfileStore(Request $request){
        $id = Auth::user()->id;
        $user = User::find($id);
        $user->name = $request->name;
        $user->email = $request->email;
        $user->phone = $request->phone;
        $user->save();
        if($request->file('profile_photo_path')){
            $image = $request->file('profile_photo_path');
            $slug = Str::slug($request->profile_photo_path);
            $imageName = $slug .'-'. date('YmdHi') . '.' .$image->getClientOriginalExtension();
            $image->move(public_path('upload/user_images'), $imageName);
            $user['profile_photo_path'] = $imageName;
            
            if(!Storage::disk ('public')->exists('upload/user_images')){
                Storage::disk('public')->makeDirectory('upload/user_images');
            }
        }
        $user->save();
        $notification = array(
            'message' => 'Profile Updated Successfully',
            'alert-type' => 'success'
        );
        return redirect()->route('user.profile')->with($notification);
    }
    public function UserChangePassword(){
        $id = Auth::user()->id;
        $user = User::find($id);
        return view('frontend.profile.change_password', compact('user'));
    }
    public function UserPasswordUpdate(Request $request){
        $validateData = $request->validate([
            'oldpassword' => 'required',
            'password' => 'required|confirmed',
        ]);
        $hashedPassword = Auth::user()->password;
        if (Hash::check($request->oldpassword, $hashedPassword)) {
            $id = Auth::user()->id;
            $userData = User::find($id);
            $userData->password = Hash::make($request->password);
            $userData->save();
            Auth::logout();
            return redirect()->route('user.logout');
        } else {
            return redirect()->back();
        }
    }

    // ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	// All User Logic
	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
    public function MyOrders(){
    	$orders = Order::where('user_id',Auth::id())->orderBy('id','DESC')->get();
    	return view('frontend.user.order.order_view',compact('orders'));
    }

    public function OrderDetails($order_id){
    	$order = Order::with('division','district','state','user')->where('id',$order_id)->where('user_id',Auth::id())->first();
    	$orderItem = OrderItem::with('product')->where('order_id',$order_id)->orderBy('id','DESC')->get();
    	return view('frontend.user.order.order_details',compact('order','orderItem'));

    } 

    public function InvoiceDownload($order_id){
        $order = Order::with('division','district','state','user')->where('id',$order_id)->where('user_id',Auth::id())->first();
    	$orderItem = OrderItem::with('product')->where('order_id',$order_id)->orderBy('id','DESC')->get();
		$pdf = PDF::loadView('frontend.user.order.order_invoice',compact('order','orderItem'))->setPaper('a4')->setOptions([
				'tempDir' => public_path(),
				'chroot' => public_path(),
		]);
		return $pdf->download('invoice.pdf');
    }

    public function ReturnOrder(Request $request,$order_id){
        Order::findOrFail($order_id)->update([
            'return_date' => Carbon::now()->format('d F Y'),
            'return_reason' => $request->return_reason,
            'return_order' => 1,
        ]);
        $notification = array(
            'message' => 'Return Request Send Successfully',
            'alert-type' => 'success'
        );
        return redirect()->route('my.orders')->with($notification);
    }

    public function ReturnOrderList(){
        $orders = Order::where('user_id',Auth::id())->where('return_reason','!=',NULL)->orderBy('id','DESC')->get();
        return view('frontend.user.order.return_order_view',compact('orders'));
    }

    public function CancelOrders(){
        $orders = Order::where('user_id',Auth::id())->where('status','cancel')->orderBy('id','DESC')->get();
        return view('frontend.user.order.cancel_order_view',compact('orders'));
    }

    // Order Tracking
    public function OrderTraking(Request $request){
        $invoice = $request->code;
        $track = Order::where('invoice_no',$invoice)->first();
        if ($track) {
            return view('frontend.traking.track_order',compact('track'));
        }else{
            $notification = array(
                'message' => 'Invoice Code Is Invalid',
                'alert-type' => 'error'
            );
            return redirect()->back()->with($notification);
        }
    }

    // ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	// Cart Page Logic
	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------

    public function MyCart(){
    	return view('frontend.wishlist.view_mycart');
    }

    public function GetCartProduct(){
        $carts = Cart::content();
    	$cartQty = Cart::count();
    	$cartTotal = Cart::total();
    	return response()->json(array(
    		'carts' => $carts,
    		'cartQty' => $cartQty,
    		'cartTotal' => round($cartTotal),
    	));
    }

    public function RemoveCartProduct($rowId){
        Cart::remove($rowId);
        if (Session::has('coupon')) {
            Session::forget('coupon');
        }
        return response()->json(['success' => 'Successfully Remove From Cart']);
    }

    // Cart Increment 
    public function CartIncrement($rowId){
        $row = Cart::get($rowId);
        Cart::update($rowId, $row->qty + 1);
        if (Session::has('coupon')) {
            $coupon_name = Session::get('coupon')['coupon_name'];
            $coupon = Coupon::where('coupon_name',$coupon_name)->first();
           Session::put('coupon',[
                'coupon_name' => $coupon->coupon_name,
                'coupon_discount' => $coupon->coupon_discount,
                'discount_amount' => round(Cart::total() * $coupon->coupon_discount/100), 
                'total_amount' => round(Cart::total() - Cart::total() * $coupon->coupon_discount/100)  
            ]);
        }
        return response()->json('increment');
    }

    // Cart Decrement  
    public function CartDecrement($rowId){
        $row = Cart::get($rowId);
        Cart::update($rowId, $row->qty - 1);
        if (Session::has('coupon')) {
            $coupon_name = Session::get('coupon')['coupon_name'];
            $coupon = Coupon::where('coupon_name',$coupon_name)->first();
            Session::put('coupon',[
                'coupon_name' => $coupon->coupon_name,
                'coupon_discount' => $coupon->coupon_discount,
                'discount_amount' => round(Cart::total() * $coupon->coupon_discount/100), 
                'total_amount' => round(Cart::total() - Cart::total() * $coupon->coupon_discount/100)  
            ]);
        }
        return response()->json('Decrement');
    }

    // ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	// Cash Logic
	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------

    public function CashOrder(Request $request){
    	if (Session::has('coupon')) {
    		$total_amount = Session::get('coupon')['total_amount'];
    	}else{
    		$total_amount = round(Cart::total());
    	}
 
        $order_id = Order::insertGetId([
            'user_id' => Auth::id(),
            'division_id' => $request->division_id,
            'district_id' => $request->district_id,
            'state_id' => $request->state_id,
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'post_code' => $request->post_code,
            'notes' => $request->notes,
            'payment_type' => 'Cash On Delivery',
            'payment_method' => 'Cash On Delivery',
            'currency' =>  'Usd',
            'amount' => $total_amount,
            'invoice_no' => 'EOS'.mt_rand(10000000,99999999),
            'order_date' => Carbon::now()->format('d F Y'),
            'order_month' => Carbon::now()->format('F'),
            'order_year' => Carbon::now()->format('Y'),
            'status' => 'pending',
            'created_at' => Carbon::now(),
        ]);
        // Start Send Email 
        $invoice = Order::findOrFail($order_id);
        $data = [
            'invoice_no' => $invoice->invoice_no,
            'amount' => $total_amount,
            'name' => $invoice->name,
            'email' => $invoice->email,
        ];
        Mail::to($request->email)->send(new OrderMail($data));

        // End Send Email 
        $carts = Cart::content();
        foreach ($carts as $cart) {
            OrderItem::insert([
                'order_id' => $order_id, 
                'product_id' => $cart->id,
                'color' => $cart->options->color,
                'size' => $cart->options->size,
                'qty' => $cart->qty,
                'price' => $cart->price,
                'created_at' => Carbon::now(),
            ]);
        }
        if (Session::has('coupon')) {
            Session::forget('coupon');
        }
        Cart::destroy();
        $notification = array(
            'message' => 'Your Order Place Successfully',
            'alert-type' => 'success'
        );
        return redirect()->route('dashboard')->with($notification);
    }


    // ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	// Checkout Logic
	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------

    public function DistrictGetAjax($division_id){
    	$ship = ShipDistrict::where('division_id',$division_id)->orderBy('district_name','ASC')->get();
    	return json_encode($ship);

    }

    public function StateGetAjax($district_id){
    	$ship = ShipState::where('district_id',$district_id)->orderBy('state_name','ASC')->get();
    	return json_encode($ship);
    } 

    public function CheckoutStore(Request $request){
    	$data = array();
    	$data['shipping_name'] = $request->shipping_name;
    	$data['shipping_email'] = $request->shipping_email;
    	$data['shipping_phone'] = $request->shipping_phone;
    	$data['post_code'] = $request->post_code;
    	$data['division_id'] = $request->division_id;
    	$data['district_id'] = $request->district_id;
    	$data['state_id'] = $request->state_id;
    	$data['notes'] = $request->notes;
    	$cartTotal = Cart::total();

    	if ($request->payment_method == 'stripe') {
    		return view('frontend.payment.stripe',compact('data','cartTotal'));
    	}elseif ($request->payment_method == 'card') {
    		return 'card';
    	}else{
            return view('frontend.payment.cash',compact('data','cartTotal'));
    	}
    }


    // ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	// Review Logic
	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------

    public function ReviewStore(Request $request){
    	$product = $request->product_id;
    	$request->validate([
    		'summary' => 'required',
    		'comment' => 'required',
    	]);
    	Review::insert([
    		'product_id' => $product,
    		'user_id' => Auth::id(),
    		'comment' => $request->comment,
    		'summary' => $request->summary,
            'rating' => $request->quality,
    		'created_at' => Carbon::now(),
    	]);
    	$notification = array(
			'message' => 'Review Will Approve By Admin',
			'alert-type' => 'success'
		);
		return redirect()->back()->with($notification);
    }

    public function PendingReview(){
    	$review = Review::where('status',0)->orderBy('id','DESC')->get();
    	return view('backend.review.pending_review',compact('review'));
    } // end method 

    public function ReviewApprove($id){
    	Review::where('id',$id)->update(['status' => 1]);
    	$notification = array(
            'message' => 'Review Approved Successfully',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }

    public function PublishReview(){
        $review = Review::where('status',1)->orderBy('id','DESC')->get();
    	return view('backend.review.publish_review',compact('review'));
    }

    public function DeleteReview($id){
    	Review::findOrFail($id)->delete();
    	$notification = array(
            'message' => 'Review Delete Successfully',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }


    // ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	// Stripe Logic
	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------

    public function StripeOrder(Request $request){
    	if (Session::has('coupon')) {
    		$total_amount = Session::get('coupon')['total_amount'];
    	}else{
    		$total_amount = round(Cart::total());
    	}
	    \Stripe\Stripe::setApiKey('sk_test_51IUTWzALc6pn5BvMjaRW9STAvY4pLiq1dNViHoh5KtqJc9Bx7d4WKlCcEdHOJdg3gCcC2F19cDxUmCBJekGSZXte00RN2Fc4vm');

        $token = $_POST['stripeToken'];
        $charge = \Stripe\Charge::create([
            'amount' => $total_amount*100,
            'currency' => 'usd',
            'description' => 'E-Zone - Happy Shopping',
            'source' => $token,
            'metadata' => ['order_id' => uniqid()],
        ]);

        $order_id = Order::insertGetId([
            'user_id' => Auth::id(),
            'division_id' => $request->division_id,
            'district_id' => $request->district_id,
            'state_id' => $request->state_id,
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'post_code' => $request->post_code,
            'notes' => $request->notes,

            'payment_type' => 'Stripe',
            'payment_method' => 'Stripe',
            'payment_type' => $charge->payment_method,
            'transaction_id' => $charge->balance_transaction,
            'currency' => $charge->currency,
            'amount' => $total_amount,
            'order_number' => $charge->metadata->order_id,

            'invoice_no' => 'EOS'.mt_rand(10000000,99999999),
            'order_date' => Carbon::now()->format('d F Y'),
            'order_month' => Carbon::now()->format('F'),
            'order_year' => Carbon::now()->format('Y'),
            'status' => 'pending',
            'created_at' => Carbon::now(),	 
        ]);

        // Start Send Email 
        $invoice = Order::findOrFail($order_id);
        $data = [
            'invoice_no' => $invoice->invoice_no,
            'amount' => $total_amount,
            'name' => $invoice->name,
            'email' => $invoice->email,
        ];
        Mail::to($request->email)->send(new OrderMail($data));

        // End Send Email 
        $carts = Cart::content();
        foreach ($carts as $cart) {
            OrderItem::insert([
                'order_id' => $order_id, 
                'product_id' => $cart->id,
                'color' => $cart->options->color,
                'size' => $cart->options->size,
                'qty' => $cart->qty,
                'price' => $cart->price,
                'created_at' => Carbon::now(),
            ]);
        }
        if (Session::has('coupon')) {
            Session::forget('coupon');
        }
        Cart::destroy();
        $notification = array(
            'message' => 'Your Order Place Successfully',
            'alert-type' => 'success'
        );
        return redirect()->route('dashboard')->with($notification);
    }


    // ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------
	// Wish List Logic
	// ---------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------------------------------------

	public function ViewWishlist(){
		return view('frontend.wishlist.view_wishlist');
	}

	public function GetWishlistProduct(){
		$wishlist = Wishlist::with('product')->where('user_id',Auth::id())->latest()->get();
		return response()->json($wishlist);
	}

	public function RemoveWishlistProduct($id){
		Wishlist::where('user_id',Auth::id())->where('id',$id)->delete();
		return response()->json(['success' => 'Successfully Product Remove']);
	}
}
