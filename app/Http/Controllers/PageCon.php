<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Page as page;
class PageCon extends Controller
{
    public function pageView($slug)
	{
		$page = page::urlSlug($slug) ;
		return view('page')->with('page', $page);
	}

	public function result($nama)
	{
		$siswa = \App\Siswa::where('nama_siswa', $nama)->get()->first();
		// dd($siswa->kejuruan);
		if ($siswa->kejuruan == "RPL") {
			$repoGet = \App\ProjectRpl::where('nama_siswa', $siswa->nama_siswa)->get()->first();
			// dd($repoGet);
		} elseif ($siswa->kejuruan == 'MM') {
			$repoGet = \App\ProjectMm::where('nama_siswa', $nama)->get()->first();
		} else{
			return back()->with(['error' => 'Parameter Kurang atau tidak ditemukan']);
		}

		return view('result')->with('repo', $repoGet);
	}
}
