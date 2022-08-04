@extends('frontend.main_master')
@section('content')

<div class="breadcrumb">
    <div class="container">
        <div class="breadcrumb-inner">
            <ul class="list-inline list-unstyled">
                <li><a href="home.html">Home</a></li>
                <li class='active'>Forget Password</li>
            </ul>
        </div>
    </div>
</div>

<div class="body-content">
    <div class="container">
        <div class="sign-in-page">
            <div class="row">
<div class="col-md-6 col-sm-6 sign-in">
    <h4 class="">Forget Password</h4>
     
   

    <form method="POST" action="{{ route('password.email') }}">
            @csrf


        <div class="form-group">
            <label class="info-title" for="exampleInputEmail1">Email Address <span>*</span></label>
            <input type="email" id="email" name="email" class="form-control unicase-form-control text-input">
        </div>
        
        
        <button type="submit" class="btn-upper btn btn-primary checkout-page-button">Email Password Reset Link</button>
    </form>
</div> 
</div>
</div>
@include('frontend.body.brands')
</div>
@endsection




