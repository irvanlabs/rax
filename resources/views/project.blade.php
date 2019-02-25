@extends('layouts.index')

@section('title', 'Submit')

@push('styles')
	<style type="text/css">
		body {
  			padding-top: 54px;
		}


	</style>
@endpush()
@section('content')
@if (count($errors) > 0)
    <div class="alert alert-danger" style="margin-top: 2%;">
        <ul>
             @foreach ($errors->all() as $error)
              <li>{{ $error }}</li>
             @endforeach
        </ul>
    </div>
@endif
	<div class="col-xs-12">
	{!! Form::open(array('route' => 'project.submit.post','method'=>'POST','files'=>'true')) !!}
	<div class="form-group">
		{!! Form::label('nama_siswa', 'Nama Siswa', ['class'=>'control-label']) !!}
		<input type="text" name="nama_siswa" class="form-control"  value="{{ $siswa->nama_siswa }}" readonly>
	</div>
		<input type="hidden" name="no_siswa" id="no_siswa" class="form-control" value="{{ $siswa->id }}">
	<div class="form-group">
		{!! Form::label('kejuruan', 'Kejuruan') !!}
		<input type="text" name="kejuruan" id="kejuruan" class="form-control" value="{{ $siswa->kejuruan }}" readonly>
	</div>
	<div class="form-group">
		{!! Form::label('judul_project', 'Judul Project') !!}
		<input type="text" name="judul_project" id="judul_project" class="form-control"  value="{{ old('judul_project') }}" required>
	</div>
	<div class="form-group">
		{!! Form::label('kategori', 'Kategori') !!}
		<select class="form-control" name="kategori">
		@if($siswa->kejuruan == 'MM')
			@foreach(App\Kategori::all()->where('kejuruan', 'MM') as $categori)
			<option>{{ $categori->nama_kategori }}</option>
			@endforeach()
		@elseif($siswa->kejuruan == 'RPL')
			@foreach(App\Kategori::all()->where('kejuruan', 'RPL') as $categori)
			<option>{{ $categori->nama_kategori }}</option>
			@endforeach()
		@endif()
		</select>
	</div>
	<div class="form-group">
		@if($siswa->kejuruan == 'RPL')
		{!! Form::label('repo_url', 'Url Source Project') !!}
		<input type="text" name="repo_url" id="repo_url" class="form-control" value="{{ strtolower(str_replace(' ', '', $siswa->nama_siswa)) }}" readonly>
		@elseif($siswa->kejuruan == 'MM')
		{!! Form::label('repo_url', 'Link Youtube/FastSWF') !!}
		<input type="text" name="repo_url" id="repo_url" class="form-control">
		@endif
	</div>
	<div class="form-group">
		{!! Form::label('excerpt', 'Deskripsi Singkat Project') !!}
		<input type="text" name="excerpt" class="form-control" value="{{ old('excerpt') }}" required>
		</div>
	<div class="form-group">
		{!! Form::label('description', 'Deskripsi Lengkap Project') !!}
		<textarea name="description" class="form-control" rows="5" required>{{ old('description') }}</textarea>
		</div>
	<div class="form-group">
		{!! Form::label('picture', 'Gambar') !!}
		{!! form::file('image',['class'=>'form-control','placeholder'=>''])!!}
	</div>
		{!! Form::submit('KIRIM', ['class'=>'btn btn-success btn-block']) !!}
		{!! Form::close() !!}
	</div>{{-- col --}}
@endsection()
