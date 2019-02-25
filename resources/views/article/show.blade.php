@extends('layouts.index')

@section('title', $article->title)

@push('styles')
	<style type="text/css">
		body {
  			padding-top: 54px;
		}

		div.padding{
			left: 25px;
		}

	</style>
@endpush()

@section('content')

<div class="container">
            <!-- Blog Post Content Column -->
            <div class="col-lg-10">

                <!-- Blog Post -->

                <!-- Title -->
                <h1>{{ $article->title }}</h1>

                
                <hr>

                <!-- Date/Time -->
                <p><span class="glyphicon glyphicon-time"></span> Dibuat pada {{ $article->created_at->format('d M, Y') }}</p>

                <hr>

                <!-- Preview Image -->
                

                <!-- Post Content -->
                
                <?php echo $article->body; ?>
                
                

                <hr>
            </div>
        </div>
@endsection