@extends('layouts.index')

@section('title', 'Reach Another eXpectation')

@push('styles')
 	<link href="{{ asset('assets/css/style.css') }}" rel="stylesheet">
@endpush()
@section('content')

<div class="coming-soon">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <h2>SISA WAKTU</h2>
                            <p></p>
                            <div class="timer">
                                
                            	<div id="deadline" data-date="{{ $deadline }}"></div>
                             
   
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Content -->
        <div class="container">
            <div class="row pb-2">
                <div class="col-sm-12 subscribe">
                	<img src="{{ asset('assets/img/rax.png') }}" width="150">
                    <h3>Segera Kumpulkan</h3>
                    <a href="{{ url('/submit') }}" class="btn btn-success btn-lg">KUMPULKAN</a>
                    <p><i>Kumpulkan sebelum waktu habis, karena sistem secara otomatis tidak menerima saat waktu habis.</i></p>                    
                        
                </div>
            </div>
        </div>
	
@endsection()

@push('scripts')
	<script src="{{ asset('assets/js/jquery.countdown.min.js') }}"></script>
    <script src="{{ asset('assets/js/scripts.js') }}"></script>
    {!! Toastr::message() !!}
@endpush()