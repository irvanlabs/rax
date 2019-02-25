@extends('layouts.index')

@section('title', 'Submit Finishing')

@push('styles')
  <style type="text/css">
    body {
        padding-top: 54px;
    }

    .red{
      border-color: green;
    }

  </style>
@endpush()
@section('content')
<div class="col-md-12">
  <label>Nama Project</label>
  <div class="well">{{ $repo->nama_project }}</div>
  <label>Repository Url</label>
  <div class="well">http://localhost:3000/raxofficial/{{ $repo->repo_url }}</div>
  <div class="well">
    <label>Akun Git</label>
    <div class="well red">{{ $repo->repo_url }}</div>
    <label>Password</label>
    <div class="well red">{{ $repo->repo_password }}</div>
    <p class="bg-success lead">Gunakan Akun diatas untuk push project anda di <a href="{{ url('http://localhost:3000') }}">Git Kami</a>, Untuk petunjuk silahkan menuju ke <a href="{{ url('/article') }}">Sini</a>. <strong>Simpan Akun diatas karena sangat penting</strong></p>
  </div>
</div>
@endsection