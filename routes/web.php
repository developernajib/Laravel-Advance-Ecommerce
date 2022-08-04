<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\AdminDashboard;
use App\Http\Controllers\Frontend\UserController;
use App\Http\Controllers\Frontend\UserDashboard;

// Route::get('/', function () {
//     return view('welcome');
// });

Route::group(['prefix' => 'admin', "middleware" => ["admin:admin"]], function () {
    Route::get('/login', [AdminController::class, "loginForm"]);
    Route::post('/login', [AdminController::class, "store"])->name("admin.login");
});

Route::middleware([
    'auth:sanctum,admin',
    config('jetstream.auth_session'),
    'verified'
])->group(function () {
    Route::get('/admin/dashboard', function () {
        return view('admin.index');
    })->name('dashboard')->middleware("auth:admin");
});
Route::middleware([
    'auth:sanctum,web',
    config('jetstream.auth_session'),
    'verified'
    ])->group(function () {
        Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
});


// Admin Dashboard Routes
Route::group(['prefix' => 'admin', 'middleware' =>'auth:admin'], function () {
    Route::get('/logout', [AdminController::class, "destroy"])->name("admin.logout");
    Route::get('/profile', [AdminDashboard::class, "AdminProfile"])->name("admin.profile");
    Route::get('/profile/edit', [AdminDashboard::class, "AdminProfileEdit"])->name("admin.profile.edit");
    Route::post('/profile/store', [AdminDashboard::class, "AdminProfileStore"])->name("admin.profile.store");
    Route::get('/change-password', [AdminDashboard::class, "AdminChangePassword"])->name("admin.change-password");
    Route::post('/store-password', [AdminDashboard::class, "AdminStorePassword"])->name("admin.store-password");
});

// Frontend Routes
Route::get('/', [UserController::class, 'index'])->name("homePage");

Route::group(['prefix' => 'user'], function(){
    Route::get('/logout', [UserDashboard::class, 'UserLogout'])->name('user.logout');
    Route::get('/profile', [UserDashboard::class, 'UserProfile'])->name('user.profile');
    Route::post('/profile/store', [UserDashboard::class, 'UserProfileStore'])->name('user.profile.store');
    Route::get('/change/password', [UserDashboard::class, 'UserChangePassword'])->name('change.password');
    Route::post('/password/update', [UserDashboard::class, 'UserPasswordUpdate'])->name('user.password.update');
});

// Brand Routes
Route::prefix('admin/brand')->group(function(){
    Route::get('/view', [AdminDashboard::class, 'BrandView'])->name('all.brand');
    Route::post('/store', [AdminDashboard::class, 'BrandStore'])->name('brand.store');
    Route::get('/edit/{id}', [AdminDashboard::class, 'BrandEdit'])->name('brand.edit');
    Route::post('/update', [AdminDashboard::class, 'BrandUpdate'])->name('brand.update');
    Route::get('/delete/{id}', [AdminDashboard::class, 'BrandDelete'])->name('brand.delete');
});

// Category Routes
Route::prefix('admin/category')->group(function(){
    Route::get('/view', [AdminDashboard::class, 'CategoryView'])->name('all.category');
    Route::post('/store', [AdminDashboard::class, 'CategoryStore'])->name('category.store');
    Route::get('/edit/{id}', [AdminDashboard::class, 'CategoryEdit'])->name('category.edit');
    Route::post('/update/{id}', [AdminDashboard::class, 'CategoryUpdate'])->name('category.update');
    Route::get('/delete/{id}', [AdminDashboard::class, 'CategoryDelete'])->name('category.delete');
});

// Sub-Category Routes
Route::prefix('admin/sub-category')->group(function(){
    Route::get('/view', [AdminDashboard::class, 'SubCategoryView'])->name('all.subcategory');
    Route::post('/store', [AdminDashboard::class, 'SubCategoryStore'])->name('subcategory.store');
    Route::get('/edit/{id}', [AdminDashboard::class, 'SubCategoryEdit'])->name('subcategory.edit');
    Route::post('/update', [AdminDashboard::class, 'SubCategoryUpdate'])->name('subcategory.update');
    Route::get('/delete/{id}', [AdminDashboard::class, 'SubCategoryDelete'])->name('subcategory.delete');
});

// Sub-Sub-Category Routes
Route::prefix('admin/sub')->group(function(){
    Route::get('/sub-category/view', [AdminDashboard::class, 'SubSubCategoryView'])->name('all.subsubcategory');
    Route::post('/sub-category/store', [AdminDashboard::class, 'SubSubCategoryStore'])->name('subsubcategory.store');
    Route::get('/sub-category/edit/{id}', [AdminDashboard::class, 'SubSubCategoryEdit'])->name('subsubcategory.edit');
    Route::post('/update', [AdminDashboard::class, 'SubSubCategoryUpdate'])->name('subsubcategory.update');
    Route::get('/sub-category/delete/{id}', [AdminDashboard::class, 'SubSubCategoryDelete'])->name('subsubcategory.delete');
});

// Auto Category select route by jQuery
Route::get('/category/subcategory/ajax/{category_id}', [AdminDashboard::class, 'GetSubCategory']);
Route::get('/category/sub-subcategory/ajax/{subcategory_id}', [AdminDashboard::class, 'GetSubSubCategory']);

// Product Routes
Route::prefix('admin/product')->group(function(){
    Route::get('/add', [AdminDashboard::class, 'AddProduct'])->name('add-product');
    Route::post('/store', [AdminDashboard::class, 'StoreProduct'])->name('product-store');
    Route::get('/manage', [AdminDashboard::class, 'ManageProduct'])->name('manage-product');
    Route::get('/edit/{id}', [AdminDashboard::class, 'EditProduct'])->name('product.edit');
    Route::post('/data/update', [AdminDashboard::class, 'ProductDataUpdate'])->name('product-update');
    Route::post('/image/update', [AdminDashboard::class, 'MultiImageUpdate'])->name('update-product-image');
    Route::post('/thambnail/update', [AdminDashboard::class, 'ThambnailImageUpdate'])->name('update-product-thambnail');
    Route::get('/multiimg/delete/{id}', [AdminDashboard::class, 'MultiImageDelete'])->name('product.multiimg.delete');
    Route::get('/inactive/{id}', [AdminDashboard::class, 'ProductInactive'])->name('product.inactive');
    Route::get('/active/{id}', [AdminDashboard::class, 'ProductActive'])->name('product.active');
    Route::get('/delete/{id}', [AdminDashboard::class, 'ProductDelete'])->name('product.delete');

});

// Slider Routes
Route::prefix('admin/slider')->group(function(){
    Route::get('/view', [AdminDashboard::class, 'SliderView'])->name('manage-slider');
    Route::post('/store', [AdminDashboard::class, 'SliderStore'])->name('slider.store');
    Route::get('/edit/{id}', [AdminDashboard::class, 'SliderEdit'])->name('slider.edit');
    Route::post('/update', [AdminDashboard::class, 'SliderUpdate'])->name('slider.update');
    Route::get('/delete/{id}', [AdminDashboard::class, 'SliderDelete'])->name('slider.delete');
    Route::get('/inactive/{id}', [AdminDashboard::class, 'SliderInactive'])->name('slider.inactive');
    Route::get('/active/{id}', [AdminDashboard::class, 'SliderActive'])->name('slider.active');
});



Route::get('/product/details/{id}/{slug}', [UserController::class, 'ProductDetails']); // Product Details Route
Route::get('/product/tag/{tag}', [UserController::class, 'TagWiseProduct']); // Frontend Product Tags Page
Route::get('/subcategory/product/{subcat_id}/{slug}', [UserController::class, 'SubCatWiseProduct']); // Frontend SubCategory wise Data
Route::get('/subsubcategory/product/{subsubcat_id}/{slug}', [UserController::class, 'SubSubCatWiseProduct']); // Frontend Sub-SubCategory wise Data
Route::get('/product/view/modal/{id}', [UserController::class, 'ProductViewAjax']); // Product View Modal with Ajax
Route::post('/cart/data/store/{id}', [UserController::class, 'AddToCart']); // Add to Cart Store Data
Route::get('/product/mini/cart/', [UserController::class, 'AddMiniCart']); // Get Data from mini cart
Route::get('/minicart/product-remove/{rowId}', [UserController::class, 'RemoveMiniCart']); // Remove mini cart
Route::post('/add-to-wishlist/{product_id}', [UserController::class, 'AddToWishlist']); // Add to Wishlist

// Frontend Coupon Option Routes
Route::post('/coupon-apply', [UserController::class, 'CouponApply']);
Route::get('/coupon-calculation', [UserController::class, 'CouponCalculation']);
Route::get('/coupon-remove', [UserController::class, 'CouponRemove']);


// User Must Login
Route::group(['prefix'=>'user','middleware' =>'auth:web','namespace'=>'User'],function(){
    
    // Wishlist Routes
    Route::get('/wishlist', [UserDashboard::class, 'ViewWishlist'])->name('wishlist');
    Route::get('/get-wishlist-product', [UserDashboard::class, 'GetWishlistProduct']);
    Route::get('/wishlist-remove/{id}', [UserDashboard::class, 'RemoveWishlistProduct']);
    Route::post('/stripe/order', [UserDashboard::class, 'StripeOrder'])->name('stripe.order');
    Route::post('/cash/order', [UserDashboard::class, 'CashOrder'])->name('cash.order');
    Route::get('/my/orders', [UserDashboard::class, 'MyOrders'])->name('my.orders');
    Route::get('/order_details/{order_id}', [UserDashboard::class, 'OrderDetails']);
    Route::get('/invoice_download/{order_id}', [UserDashboard::class, 'InvoiceDownload']);
    Route::post('/return/order/{order_id}', [UserDashboard::class, 'ReturnOrder'])->name('return.order');
    Route::get('/return/order/list', [UserDashboard::class, 'ReturnOrderList'])->name('return.order.list');
    Route::get('/cancel/orders', [UserDashboard::class, 'CancelOrders'])->name('cancel.orders');
    // Order Tracking Route
    Route::post('/order/tracking', [UserDashboard::class, 'OrderTraking'])->name('order.tracking');  
     
});


// My Cart Page All Routes
Route::get('/mycart', [UserDashboard::class, 'MyCart'])->name('mycart');
Route::get('/user/get-cart-product', [UserDashboard::class, 'GetCartProduct']);
Route::get('/user/cart-remove/{rowId}', [UserDashboard::class, 'RemoveCartProduct']);
Route::get('/cart-increment/{rowId}', [UserDashboard::class, 'CartIncrement']);
Route::get('/cart-decrement/{rowId}', [UserDashboard::class, 'CartDecrement']);


// Admin Coupons All Routes 
Route::prefix('coupons')->group(function(){
    Route::get('/view', [AdminDashboard::class, 'CouponView'])->name('manage-coupon');
    Route::post('/store', [AdminDashboard::class, 'CouponStore'])->name('coupon.store');
    Route::get('/edit/{id}', [AdminDashboard::class, 'CouponEdit'])->name('coupon.edit');
    Route::post('/update/{id}', [AdminDashboard::class, 'CouponUpdate'])->name('coupon.update');
    Route::get('/delete/{id}', [AdminDashboard::class, 'CouponDelete'])->name('coupon.delete');
});


// Admin Shipping All Routes 
Route::prefix('shipping')->group(function(){

    // Ship Division 
    Route::get('/division/view', [AdminDashboard::class, 'DivisionView'])->name('manage-division');
    Route::post('/division/store', [AdminDashboard::class, 'DivisionStore'])->name('division.store');
    Route::get('/division/edit/{id}', [AdminDashboard::class, 'DivisionEdit'])->name('division.edit');
    Route::post('/division/update/{id}', [AdminDashboard::class, 'DivisionUpdate'])->name('division.update');
    Route::get('/division/delete/{id}', [AdminDashboard::class, 'DivisionDelete'])->name('division.delete');

    // Ship District 
    Route::get('/district/view', [AdminDashboard::class, 'DistrictView'])->name('manage-district');
    Route::post('/district/store', [AdminDashboard::class, 'DistrictStore'])->name('district.store');
    Route::get('/district/edit/{id}', [AdminDashboard::class, 'DistrictEdit'])->name('district.edit');
    Route::post('/district/update/{id}', [AdminDashboard::class, 'DistrictUpdate'])->name('district.update');
    Route::get('/district/delete/{id}', [AdminDashboard::class, 'DistrictDelete'])->name('district.delete');

    // Ship State 
    Route::get('/state/view', [AdminDashboard::class, 'StateView'])->name('manage-state');
    Route::post('/state/store', [AdminDashboard::class, 'StateStore'])->name('state.store');
    Route::get('/state/edit/{id}', [AdminDashboard::class, 'StateEdit'])->name('state.edit');
    Route::post('/state/update/{id}', [AdminDashboard::class, 'StateUpdate'])->name('state.update');
    Route::get('/state/delete/{id}', [AdminDashboard::class, 'StateDelete'])->name('state.delete');
});

// Checkout Routes 
Route::get('/checkout', [UserController::class, 'CheckoutCreate'])->name('checkout');
Route::get('/district-get/ajax/{division_id}', [UserDashboard::class, 'DistrictGetAjax']);
Route::get('/state-get/ajax/{district_id}', [UserDashboard::class, 'StateGetAjax']);
Route::post('/checkout/store', [UserDashboard::class, 'CheckoutStore'])->name('checkout.store');

// Admin Order All Routes 
Route::prefix('orders')->group(function(){
    Route::get('/pending/orders', [AdminDashboard::class, 'PendingOrders'])->name('pending-orders');
    Route::get('/pending/orders/details/{order_id}', [AdminDashboard::class, 'PendingOrdersDetails'])->name('pending.order.details');
    Route::get('/confirmed/orders', [AdminDashboard::class, 'ConfirmedOrders'])->name('confirmed-orders');
    Route::get('/processing/orders', [AdminDashboard::class, 'ProcessingOrders'])->name('processing-orders');
    Route::get('/picked/orders', [AdminDashboard::class, 'PickedOrders'])->name('picked-orders');
    Route::get('/shipped/orders', [AdminDashboard::class, 'ShippedOrders'])->name('shipped-orders');
    Route::get('/delivered/orders', [AdminDashboard::class, 'DeliveredOrders'])->name('delivered-orders');
    Route::get('/cancel/orders', [AdminDashboard::class, 'CancelOrders'])->name('cancel-orders');
    
    // Update Status 
    Route::get('/pending/confirm/{order_id}', [AdminDashboard::class, 'PendingToConfirm'])->name('pending-confirm');
    Route::get('/confirm/processing/{order_id}', [AdminDashboard::class, 'ConfirmToProcessing'])->name('confirm.processing');
    Route::get('/processing/picked/{order_id}', [AdminDashboard::class, 'ProcessingToPicked'])->name('processing.picked');
    Route::get('/picked/shipped/{order_id}', [AdminDashboard::class, 'PickedToShipped'])->name('picked.shipped');
    Route::get('/shipped/delivered/{order_id}', [AdminDashboard::class, 'ShippedToDelivered'])->name('shipped.delivered');
    Route::get('/invoice/download/{order_id}', [AdminDashboard::class, 'AdminInvoiceDownload'])->name('invoice.download');
    Route::get('/cancel/order/{order_id}', [AdminDashboard::class, 'OrderCancel'])->name('order-cancel');
});

// Admin Reports Routes 
Route::prefix('reports')->group(function(){
    Route::get('/view', [AdminDashboard::class, 'ReportView'])->name('all-reports');
    Route::post('/search/by/date', [AdminDashboard::class, 'ReportByDate'])->name('search-by-date');
    Route::post('/search/by/month', [AdminDashboard::class, 'ReportByMonth'])->name('search-by-month');
    Route::post('/search/by/year', [AdminDashboard::class, 'ReportByYear'])->name('search-by-year');
});



// Admin Get All User Routes 
Route::prefix('alluser')->group(function(){
    Route::get('/view', [AdminDashboard::class, 'AllUsers'])->name('all-users');
});


// Admin Blog  Routes 
Route::prefix('blog')->group(function(){
    Route::get('/category', [AdminDashboard::class, 'BlogCategory'])->name('blog.category');
    Route::post('/store', [AdminDashboard::class, 'BlogCategoryStore'])->name('blogcategory.store');
    Route::get('/category/edit/{id}', [AdminDashboard::class, 'BlogCategoryEdit'])->name('blog.category.edit');
    Route::post('/update', [AdminDashboard::class, 'BlogCategoryUpdate'])->name('blogcategory.update');

    // Admin View Blog Post Routes 
    Route::get('/list/post', [AdminDashboard::class, 'ListBlogPost'])->name('list.post');
    Route::get('/add/post', [AdminDashboard::class, 'AddBlogPost'])->name('add.post');
    Route::post('/post/store', [AdminDashboard::class, 'BlogPostStore'])->name('post-store');
});

//  Frontend Blog Show Routes 
Route::get('/blog', [AdminDashboard::class, 'AddBlogPost'])->name('home.blog');
Route::get('/post/details/{id}', [AdminDashboard::class, 'DetailsBlogPost'])->name('post.details');
Route::get('/blog/category/post/{category_id}', [AdminDashboard::class, 'HomeBlogCatPost']);

// Admin Site Setting Routes 
Route::prefix('setting')->group(function(){
    Route::get('/site', [AdminDashboard::class, 'SiteSetting'])->name('site.setting');
    Route::post('/site/update', [AdminDashboard::class, 'SiteSettingUpdate'])->name('update.sitesetting');
    Route::get('/seo', [AdminDashboard::class, 'SeoSetting'])->name('seo.setting'); 
    Route::post('/seo/update', [AdminDashboard::class, 'SeoSettingUpdate'])->name('update.seosetting');
});

// Admin Return Order Routes 
Route::prefix('return')->group(function(){
    Route::get('/admin/request', [AdminDashboard::class, 'ReturnRequest'])->name('return.request');
    Route::get('/admin/return/approve/{order_id}', [AdminDashboard::class, 'ReturnRequestApprove'])->name('return.approve');
    Route::get('/admin/all/request', [AdminDashboard::class, 'ReturnAllRequest'])->name('all.request');
});

// Frontend Product Review Routes
Route::post('/review/store', [UserDashboard::class, 'ReviewStore'])->name('review.store');

// Admin Manage Review Routes 
Route::prefix('review')->group(function(){
    Route::get('/pending', [UserDashboard::class, 'PendingReview'])->name('pending.review');
    Route::get('/admin/approve/{id}', [UserDashboard::class, 'ReviewApprove'])->name('review.approve');
    Route::get('/publish', [UserDashboard::class, 'PublishReview'])->name('publish.review');
    Route::get('/delete/{id}', [UserDashboard::class, 'DeleteReview'])->name('delete.review');
});

// Admin Manage Stock Routes 
Route::prefix('stock')->group(function(){
    Route::get('/product', [AdminDashboard::class, 'ProductStock'])->name('product.stock');
});


// Admin User Role Routes 
Route::prefix('admin/user-role')->group(function(){
    Route::get('/all', [AdminDashboard::class, 'AllAdminRole'])->name('all.admin.user');
    Route::get('/add', [AdminDashboard::class, 'AddAdminRole'])->name('add.admin');
    Route::post('/store', [AdminDashboard::class, 'StoreAdminRole'])->name('admin.user.store');
    Route::get('/edit/{id}', [AdminDashboard::class, 'EditAdminRole'])->name('edit.admin.user');
    Route::post('/update', [AdminDashboard::class, 'UpdateAdminRole'])->name('admin.user.update');
    Route::get('/delete/{id}', [AdminDashboard::class, 'DeleteAdminRole'])->name('delete.admin.user');
});

/// Product Search Route 
Route::post('/search', [UserController::class, 'ProductSearch'])->name('product.search');

// Advance Search Routes 
Route::post('search-product', [UserController::class, 'SearchProduct']);

// Shop Page Route 
Route::get('/shop', [UserController::class, 'ShopPage'])->name('shop.page');
Route::post('/shop/filter', [UserController::class, 'ShopFilter'])->name('shop.filter');