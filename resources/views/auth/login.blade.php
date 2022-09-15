@extends('frontend.main_master')
@section('content')
    <div class="breadcrumb">
        <div class="container">
            <div class="breadcrumb-inner">
                <ul class="list-inline list-unstyled">
                    <li><a href="home.html">Home</a></li>
                    <li class='active'>Login</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="body-content">
        <div class="container">
            <div class="sign-in-page">
                <div class="row">
                    <div class="col-md-12 col-sm-12 sign-in">
                        <h4 class="">Sign in</h4>

                        <form method="POST" action="{{ isset($guard) ? url($guard . '/login') : route('login') }}">
                            @csrf
                            <div class="form-group">
                                <label class="info-title" for="exampleInputEmail1">User Email <span>*</span></label>
                                <input type="text" id="email" name="email"
                                    class="form-control unicase-form-control text-input">
                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label class="info-title" for="exampleInputPassword1">Password <span>*</span></label>
                                <input type="password" id="password" name="password"
                                    class="form-control unicase-form-control text-input" id="exampleInputPassword1">
                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            @if (isset($guard) == 'admin')
                                <label class="info-title" for="secret_code">Secrat Code <span>*</span></label>
                                <input type="password" id="password" name="secret_code"
                                    class="form-control unicase-form-control text-input" id="exampleInputPassword1"
                                    required>
                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            @endif
                            <div class="radio outer-xs">
                                <label>
                                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">Remember
                                    me!
                                </label>
                                <a href="{{ route('password.request') }}" class="forgot-password pull-right">Forgot your
                                    Password?</a>
                            </div>
                            <button type="submit" class="btn-upper btn btn-primary checkout-page-button">Login</button>
                        </form>
                        <div class="social-sign-in outer-top-xs text-center">
                            <a href="{{ route('register') }}" class="facebook-sign-in">Register</a>
                        </div>
                    </div>
                </div>
            </div>
            @include('frontend.body.brands')
        </div>
    </div>
@endsection
