@extends('layouts.index')

@section('title')
{{ $detail->nama_project }}
@endsection

@push('styles')
    <link rel="stylesheet" type="text/css" href="{{ url('assets/css/style.css') }}">
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
     <div class="col-xs-5">
                    @if($detail->picture != null)
                                <img src="/storage/{{ $detail->picture }}" class="thumbnail photo-detail">
                            @else
                                <img src="{{ asset('assets/img/no_thumb.gif') }}" alt="">
                            @endif()
                </div>
                <div class="col-xs-7" style="border:0px solid gray">
                    <!-- Datos del vendedor y titulo del producto -->
                    <h3>{{ $detail->nama_project }}</h3>    
                    
                
                    <div class="list-group col-xs-7" style="padding-bottom:5px;">                  
                    <div class="list-group-item">Oleh : {{ $detail->nama_siswa }}</div>
                    <div class="list-group-item">Kejuruan : {{ $kejuruan}}</div>
                    <div class="list-group-item">Dikumpulkan Pada : {{ $detail->created_at->toDateString() }}, Pukul : {{ $detail->created_at->toTimeString() }}</div>
                    <div class="list-group-item">Status : 
                    @if($detail->verified == 'Pending')
                        <mark>
                            <strong>
                                <i class="icon-time"></i> Dalam proses verifikasi
                            </strong>
                        </mark>
                    @elseif($detail->verified == 'Verified')
                        <mark style="color: green">
                            <strong>
                            <i class="icon-check"></i> Terverifikasi
                            </strong>
                        </mark>
                    @elseif($detail->verified == 'Unverified')

                        <mark style="color: red">
                            <strong>
                            <i class="icon-remove"></i> Tidak Lulus verifikasi
                            </strong>
                        </mark>
                    @endif()

                    </div> {{-- li --}}
                    @if($kejuruan == "RPL")
                            <a href="http://localhost:3000/{{ $detail->repo_url }}" class="btn btn-lg btn-primary btn-block" style="margin-top: 2rem"><i class="icon-folder-open-alt"> </i>Kode Sumber
                         </a>                                
                    @else
                                <a href="{{ $detail->repo_url }}" class="btn btn-lg btn-primary btn-block" style="margin-top: 2rem"><i class="icon-play-circle"> </i>Lihat Media
                         </a>
                     @endif
                         
                    </div>  {{-- list group --}}
                                                                      
                </div>                              
        
                <div class="col-md-9">
                    <h4>Deskripsi</h4>
                    <div style="width:100%;border-top:1px solid silver">
                        {!! $detail->description !!} 
                    </div>
                </div>
@endsection()