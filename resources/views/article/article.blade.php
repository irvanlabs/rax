@extends('layouts.index')

@section('title', 'Coretan RAX')

@push('styles')
	<style type="text/css">
		body {
  			padding-top: 54px;
		}
		.post-title {
		  font-size: 30px;
		  margin-bottom: 10px;
		}
        /*.round {
            border: 1px solid black;
            border-radius: 1rem !important;
            padding-left: 2%;
        }*/
	</style>
@endpush()

@section('content')
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    @foreach($articles as $article)
                <div class="post-preview panel panel-success">
                    
                <div class="post-title panel-heading text-center"> 
                    <a href="/article/{{ $article->slug }}">
                        <h2>
                            {{ $article->title }}
                        </h2>
                    </a>
                </div>
                        <h4 class="post-subtitle panel-body">
                            {{ $article->excerpt }}
                        </h4>
                
                <div class="panel-footer">
                    <p>Di terbitkan pada {{ $article->created_at->format('d M, Y') }}</p>
                </div>
                </div>
                <hr>
                @endforeach()

            </div>
        </div>
@endsection