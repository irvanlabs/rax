<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ProjectMm as mm;
use App\ProjectRpl as rpl;
class ExploreCon extends Controller
{
   public function index()
    {
    	$mm = mm::all();
    	$rpl = rpl::all();
    	// dd($rpl);
    	return view('explore')->with('mm', $mm)->with('rpl', $rpl);
    }

    public function detail($kj, $id)
    {
    	if ($kj == "rpl") {
    		$detail = rpl::where('id_project', $id)->get()->first();
    		$kejuruan = "RPL";
    		// dd($detail);
    	} elseif ($kj == "mm") {
    		$detail = mm::where('id', $id)->get()->first();
    		$kejuruan = "MM";
    		dd($detail);
    	}
    	return view('detail')->with('detail', $detail)->with('kejuruan', $kejuruan);
    }
}
