@extends('frontend.main_master')
@section('content')
@section('title')
    E-Zone - Happy Shopping
@endsection
<div class="body-content outer-top-xs" id="top-banner-and-menu">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-3 sidebar">
                @include('frontend.common.vertical_menu')
                @include('frontend.common.hot_deals')
                <div class="sidebar-widget outer-bottom-small wow fadeInUp">
                    <h3 class="section-title">Special Offer</h3>
                    <div class="sidebar-widget-body outer-top-xs">
                        <div class="owl-carousel sidebar-carousel special-offer custom-carousel owl-theme outer-top-xs">
                            <div class="item">
                                <div class="products special-product">
                                    @foreach ($special_offer as $product)
                                        <div class="product">
                                            <div class="product-micro">
                                                <div class="row product-micro-row">
                                                    <div class="col col-xs-5">
                                                        <div class="product-image">
                                                            <div class="image"> <a
                                                                    href="{{ url('product/details/' . $product->id . '/' . $product->product_slug_en) }}">
                                                                    <img src="{{ asset($product->product_thambnail) }}"
                                                                        alt=""> </a> </div>
                                                        </div>
                                                    </div>
                                                    <div class="col col-xs-7">
                                                        <div class="product-info">
                                                            <h3 class="name"><a
                                                                    href="{{ url('product/details/' . $product->id . '/' . $product->product_slug_en) }}">
                                                                    {{ $product->product_name_en }}
                                                                </a></h3>
                                                            <div class="product-price"> <span class="price">
                                                                    ${{ $product->selling_price }} </span> </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sidebar-widget outer-bottom-small wow fadeInUp">
                    <h3 class="section-title">Special Deals</h3>
                    <div class="sidebar-widget-body outer-top-xs">
                        <div class="owl-carousel sidebar-carousel special-offer custom-carousel owl-theme outer-top-xs">
                            <div class="item">
                                <div class="products special-product">
                                    @foreach ($special_deals as $product)
                                        <div class="product">
                                            <div class="product-micro">
                                                <div class="row product-micro-row">
                                                    <div class="col col-xs-5">
                                                        <div class="product-image">
                                                            <div class="image"> <a
                                                                    href="{{ url('product/details/' . $product->id . '/' . $product->product_slug_en) }}">
                                                                    <img src="{{ asset($product->product_thambnail) }}"
                                                                        alt=""> </a> </div>
                                                        </div>
                                                    </div>
                                                    <div class="col col-xs-7">
                                                        <div class="product-info">
                                                            <h3 class="name"><a
                                                                    href="{{ url('product/details/' . $product->id . '/' . $product->product_slug_en) }}">
                                                                    {{ $product->product_name_en }}
                                                                </a></h3>
                                                            <div class="product-price"> <span class="price">
                                                                    ${{ $product->selling_price }} </span> </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-9 homebanner-holder">
                <div id="hero">
                    <div id="owl-main" class="owl-carousel owl-inner-nav owl-ui-sm">
                        @foreach ($sliders as $slider)
                            <div class="item" style="background-image: url({{ asset($slider->slider_img) }});">
                            </div>
                        @endforeach
                    </div>
                </div>
                <div id="product-tabs-slider" class="scroll-tabs outer-top-vs wow fadeInUp">
                    <div class="more-info-tab clearfix ">
                        <h3 class="new-product-title pull-left">New Products</h3>
                        <ul class="nav nav-tabs nav-tab-line pull-right" id="new-products-1">
                            <li class="active"><a data-transition-type="backSlide" href="#all"
                                    data-toggle="tab">All</a></li>
                            @foreach ($categories as $category)
                                <li><a data-transition-type="backSlide" href="#category{{ $category->id }}"
                                        data-toggle="tab">{{ $category->category_name_en }}</a></li>
                            @endforeach
                        </ul>
                    </div>
                    <div class="tab-content outer-top-xs">
                        <div class="tab-pane in active" id="all">
                            <div class="product-slider">
                                <div class="owl-carousel home-owl-carousel custom-carousel owl-theme" data-item="4">
                                    @foreach ($products as $product)
                                        <div class="item item-carousel">
                                            <div class="products">
                                                <div class="product">
                                                    <div class="product-image">
                                                        <div class="image"> <a
                                                                href="{{ url('product/details/' . $product->id . '/' . $product->product_slug_en) }}"><img
                                                                    src="{{ asset($product->product_thambnail) }}"
                                                                    alt=""></a> </div>
                                                        @php
                                                            $amount = $product->selling_price - $product->discount_price;
                                                            $discount = ($amount / $product->selling_price) * 100;
                                                        @endphp
                                                        <div>
                                                            @if ($product->discount_price == null)
                                                                <div class="tag new"><span>new</span></div>
                                                            @else
                                                                <div class="tag hot">
                                                                    <span>{{ round($discount) }}%</span>
                                                                </div>
                                                            @endif
                                                        </div>
                                                    </div>
                                                    <div class="product-info text-left">
                                                        <h3 class="name"><a
                                                                href="{{ url('product/details/' . $product->id . '/' . $product->product_slug_en) }}">
                                                                {{ $product->product_name_en }}
                                                            </a></h3>
                                                        <div class="rating rateit-small"></div>
                                                        <div class="description"></div>
                                                        @if ($product->discount_price == null)
                                                            <div class="product-price"> <span class="price">
                                                                    ${{ $product->selling_price }} </span> </div>
                                                        @else
                                                            <div class="product-price"> <span class="price">
                                                                    ${{ $product->discount_price }} </span> <span
                                                                    class="price-before-discount">$
                                                                    {{ $product->selling_price }}</span> </div>
                                                        @endif
                                                    </div>
                                                    <div class="cart clearfix animate-effect">
                                                        <div class="action">
                                                            <ul class="list-unstyled">
                                                                <li class="add-cart-button btn-group">
                                                                    <button class="btn btn-primary icon" type="button"
                                                                        title="Add Cart" data-toggle="modal"
                                                                        data-target="#exampleModal"
                                                                        id="{{ $product->id }}"
                                                                        onclick="productView(this.id)"> Add to Cart
                                                                    </button>

                                                                </li>

                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        @foreach ($categories as $category)
                            <div class="tab-pane" id="category{{ $category->id }}">
                                <div class="product-slider">
                                    <div class="owl-carousel home-owl-carousel custom-carousel owl-theme"
                                        data-item="4">
                                        @php
                                            $catwiseProduct = App\Models\Product::where('category_id', $category->id)
                                                ->orderBy('id', 'DESC')
                                                ->get();
                                        @endphp
                                        @forelse($catwiseProduct as $product)
                                            <div class="item item-carousel">
                                                <div class="products">
                                                    <div class="product">
                                                        <div class="product-image">
                                                            <div class="image"> <a
                                                                    href="{{ url('product/details/' . $product->id . '/' . $product->product_slug_en) }}"><img
                                                                        src="{{ asset($product->product_thambnail) }}"
                                                                        alt=""></a> </div>
                                                            @php
                                                                $amount = $product->selling_price - $product->discount_price;
                                                                $discount = ($amount / $product->selling_price) * 100;
                                                            @endphp
                                                            <div>
                                                                @if ($product->discount_price == null)
                                                                    <div class="tag new"><span>new</span></div>
                                                                @else
                                                                    <div class="tag hot">
                                                                        <span>{{ round($discount) }}%</span>
                                                                    </div>
                                                                @endif
                                                            </div>
                                                        </div>
                                                        <div class="product-info text-left">
                                                            <h3 class="name"><a
                                                                    href="{{ url('product/details/' . $product->id . '/' . $product->product_slug_en) }}">
                                                                    {{ $product->product_name_en }}
                                                                </a></h3>
                                                            <div class="rating rateit-small"></div>
                                                            <div class="description"></div>
                                                            @if ($product->discount_price == null)
                                                                <div class="product-price"> <span class="price">
                                                                        ${{ $product->selling_price }} </span> </div>
                                                            @else
                                                                <div class="product-price"> <span class="price">
                                                                        ${{ $product->discount_price }} </span> <span
                                                                        class="price-before-discount">$
                                                                        {{ $product->selling_price }}</span> </div>
                                                            @endif
                                                        </div>
                                                        <div class="cart clearfix animate-effect">
                                                            <div class="action">
                                                                <ul class="list-unstyled">
                                                                    <li class="add-cart-button btn-group">
                                                                        <button class="btn btn-primary icon"
                                                                            type="button" title="Add Cart"
                                                                            data-toggle="modal"
                                                                            data-target="#exampleModal"
                                                                            id="{{ $product->id }}"
                                                                            onclick="productView(this.id)"> Add to
                                                                            Cart</i>
                                                                        </button>
                                                                    </li>

                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        @empty
                                            <h5 class="text-danger">No Product Found</h5>
                                        @endforelse
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>

            <section class="products">
                <h2 class="text-center" style="margin-bottom: 50px">All Products</h2>
                <div class="row">
                    @foreach ($data as $product)
                        <div class="col-lg-2 col-md-3 col-sm-6">
                            <div style="position: absolute">
                                @if ($product->discount_price == null)
                                    <div class="tag new"><span>new</span></div>
                                @else
                                    <div class="tag hot"><span>{{ round($discount) }}%</span></div>
                                @endif
                            </div>
                            <div class="product-item">
                                <a
                                    href="{{ url('product/details/' . $product->id . '/' . $product->product_slug_en) }}"><img
                                        style="height:250px;width:95%;" src="{{ $product->product_thambnail }}"
                                        alt=""></a>

                                <div class="down-content" style="margin-bottom:30px;">
                                    <a href={{ $product->id }}>
                                        <h4>{{ $product->product_name_en }}</h4>
                                    </a>
                                    @if ($product->discount_price == null)
                                        <div class="product-price"> <span class="price">
                                                ${{ $product->selling_price }} </span> </div>
                                    @else
                                        <div class="product-price"> <span class="price">
                                                ${{ $product->discount_price }} </span> <span
                                                class="price-before-discount"><del> $
                                                    {{ $product->selling_price }}</del></span> </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </section>
        </div>
        @include('frontend.body.brands')
    </div>
</div>
@endsection
