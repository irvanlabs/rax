@extends('layouts.index')

@section('title', 'Submit')

@push('styles')
 	<link href="{{ asset('assets/css/submit.css') }}" rel="stylesheet">
@endpush()

@section('content')

    
<div id="h">
    <div class="col-md-6 col-md-offset-3">
        <div class="row">
            <div id="logo" class="text-center">
                <img src="{{ asset('assets/img/rax.png') }}" style="width: 200px;">
                <hr>
                <p><i>Masukkan Token yang telah diberikan sebagai validasi</i></p>
            </div>
            <form action="{{ route('submit.token') }}">
              {{-- @method('POST') --}}
                  <div class="form-group">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="25f17a2e19f000" style="text-transform: uppercase;" name="token">
                        <span class="input-group-btn">
                          <button class="btn btn-success" type="submit">Kirim</button>
                        </span>
                    </div>
                </div>
              </form>
          </div>
    </div>
</div>
  <!--/H-->
@endsection()

@push('scripts')
{!! Toastr::message() !!}
@endpush()