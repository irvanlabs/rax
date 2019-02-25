@extends('layouts.index')

@section('title', 'Explore The Project')

@push('styles')
	<style type="text/css">
		body {
  			padding-top: 54px;
		}

		div.padding{
			left: 25px;
		}
        .resize{
            max-height: 120px;
            max-width: 120px;
        }

	</style>
@endpush()
@section('content')
 <div class="row">

            {{-- <div class="col-md-3 padding">
                <p class="lead">Shop Name</p>
                <div class="list-group">
                    <a href="#" class="list-group-item">Category 1</a>
                    <a href="#" class="list-group-item">Category 2</a>
                    <a href="#" class="list-group-item">Category 3</a>
                </div>
            </div> --}}

            <div class="col-md-9">
                <div class="row">
                	@foreach($rpl as $p_rpl)
                    <div class="col-sm-3 col-lg-3 col-md-3">
                        <div class="thumbnail">
                            @if($p_rpl->picture != null)
                                <img class="resize" src="/storage/{{ $p_rpl->picture }}" alt="">
                            @else
                                <img class="resize" src="{{ asset('assets/img/no_thumb.gif') }}" alt="">
                            @endif()
                            {!! "<hr>" !!}
                            <div class="caption">
                                <h4>{{ $p_rpl->nama_project }}</h4>
                                <p>{!! $p_rpl->excerpt !!}</p>
                            <hr>
                             </div>
                            <div align="center">
                            	@if($p_rpl->verified == 'Pending')
                            	<i class="icon-time"></i>
                            	<strong>Dalam proses verifikasi</strong>
                            	@elseif($p_rpl->verified == 'Verified')
                            	<i class="icon-check"></i>
                            	<strong>Terverifikasi</strong>
                                @elseif($p_rpl->verified == 'Unverified')
                                <i class="icon-remove"></i>
                                <strong>Tidak Lulus verifikasi</strong>
                            	@endif()
                            	<br>
                                <a href="/project/detail/rpl/{{ $p_rpl->id_project }}" class="btn btn-primary btn-block">Detail</a>
                            </div>
                        </div>
                    </div>
                    @endforeach()
                </div>
            </div>
            {{-- Untuk MM --}}
            <hr>
            <div class="col-md-9">
                <div class="row">
                    @foreach($mm as $p_mm)
                    <div class="col-sm-3 col-lg-3 col-md-3">
                        <div class="thumbnail">
                            @if($p_mm->picture != null)
                                <img src="/storage/{{ $p_mm->picture }}" alt="">
                            @else
                                <img src="{{ asset('assets/img/no_thumb.gif') }}" alt="">
                            @endif()
                            {!! "<hr>" !!}
                            <div class="caption">
                                <h4>{{ $p_mm->nama_project }}</h4>
                                <p>{!! $p_mm->excerpt !!}</p>
                            <hr>
                             </div>
                            <div align="center">
                                @if($p_mm->verified == 'Pending')
                                <i class="icon-time"></i>
                                <strong>Dalam proses verifikasi</strong>
                                @elseif($p_mm->verified == 'Verified')
                                <i class="icon-check"></i>
                                <strong>Terverifikasi</strong>
                                @elseif($p_mm->verified == 'Unverified')
                                <i class="icon-remove"></i>
                                <strong>Tidak Lulus verifikasi</strong>
                                @endif()
                                <br>
                                <a href="/project/detail/mm/{{ $p_mm->id }}" class="btn btn-primary btn-block">Detail</a>
                            </div>
                        </div>
                    </div>
                    @endforeach()
                </div>
            </div>
@endsection()