@extends('layouts.index')

@section('title', $page->title)

@push('styles')
	<style type="text/css">
		body{
			padding-top: 54px;
		}
		.intro-header {
		  background-color: #777777;
		  background: no-repeat center center;
		  background-attachment: scroll;
		  -webkit-background-size: cover;
		  -moz-background-size: cover;
		  background-size: cover;
		  -o-background-size: cover;
		  margin-bottom: 50px;
		}
		.intro-header .site-heading,
		.intro-header .post-heading,
		.intro-header .page-heading {
		  padding: 100px 0 50px;
		  color: white;
		}

			.intro-header .site-heading .subheading,
			.intro-header .page-heading .subheading {
		  font-size: 24px;
		  line-height: 1.1;
		  display: block;
		  font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
		  font-weight: 300;
		  margin: 10px 0 0;
		}

			hr.small {
		  max-width: 100px;
		  margin: 15px auto;
		  border-width: 4px;
		  border-color: white;
		}
	</style>
@endpush()

@section('content')
	<header class="intro-header" style="background-image: url('/storage/{{ $page->image }}')">
       
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="page-heading text-center">
                        <h1>{{ $page->title }}</h1>
                        <hr class="small">
                        <span class="subheading">{{ $page->excerpt }}</span>
                    </div>
                </div>
            </div>
     
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                {!! $page->body !!}
            </div>
        </div>
    </div>

    <hr>
@endsection()