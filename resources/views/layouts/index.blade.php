<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    {{-- CSRF TOKEN --}}
    <meta name="_token" content="{{ csrf_token() }}">

    <link rel="icon" href="{{ asset('assets/img/favicon.png') }}">

    <title>{{ setting('site.title') }} | @yield('title')</title>

    <!-- Bootstrap core CSS -->
    <link href="{{ asset('assets/vendor/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">

    <!-- Datatables -->
    <link href="{{ asset('assets/vendor/datatables/datatables.min.css') }}" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="{{ asset('assets/vendor/font-awesome/css/font-awesome.min.css') }}" rel="stylesheet">
    

    
    {{-- asset untuk css tambahan --}}
    {{-- <link href="{{ asset('assets/css/styles.css') }}" rel="stylesheet"> --}}
   


    <!-- Custom style -->
    {{-- <link href="{{ asset('css/app.css') }}" rel="stylesheet"> --}}

    @stack('styles')

  </head>

  <body>

 	@include('layouts._nav')

    
     @if ($message = Session::get('error'))
      <div class="alert alert-danger alert-block text-uppercase conatiner" style="margin-top: 5%;">
        <button type="button" class="close" data-dismiss="alert">×</button> 
        <center><strong>{{ $message }}</strong></center>
      </div>
    @endif

    @if ($message = Session::get('warning'))
      <div class="alert alert-warning alert-block text-uppercase container" style="margin-top: 5%;">
        <button type="button" class="close" data-dismiss="alert">×</button> 
        <center><strong>{{ $message }}</strong></center>
    </div>
    @endif
    <div class="container-fluid">
    @yield('content')
    </div>

   <!-- /container -->

    @include('layouts._modal')



    <!-- Bootstrap core JavaScript-->
    <script src="{{ asset('assets/js/jquery.min.js') }}"></script>
    
    <script src="{{ asset('assets/vendor/bootstrap/js/bootstrap.min.js') }}"></script>

    <!-- Datatables -->
    <script src="{{ asset('assets/vendor/datatables/datatables.min.js') }}"></script>

    
    <script src="{{ asset('js/app.js') }}"></script>
    
    
    @stack('scripts')

  </body>

</html>
