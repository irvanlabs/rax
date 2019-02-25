<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Deadline as dl;
class DeadlineCon extends Controller
{
	public function index()
	    {
	    	$deadline = dl::all();

	    	foreach ($deadline as $key) {
	    		$str = $key->deadline;
	    		$deadline = str_replace('-', '/', $str);
	    		return view('home')->with('deadline',$deadline);
	    	}


	    	
	    }    
}
