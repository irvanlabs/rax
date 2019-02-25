<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
// use App\Token as token;
use App\Deadline as dl;
use App\Siswa;
use App\ProjectMm as mm;
use App\ProjectRpl as rpl;
use Toastr;
use Carbon\Carbon;
use Curl;


class FormCon extends Controller
{
	public function showSubmit()
	{
		$dl = dl::all()->first();
		$check = Carbon::now()->toDateString();
        // dd($dl->deadline);
        if ($dl->deadline > $check ) {
            return view('submit');
            
        } else{
            return redirect("/")->with(['error' => 'Anda telah melebihi batas waktu yang ditentukan']);
        }
        
        
		
	}
    public function submitToken(Request $request)
    {
    	$siswa = Siswa::where('token', $request->token)->get()->first();
        
        // dd($siswa);
        if ($siswa==null) {
            return back()->with(['error' => 'Token tidak ditemukan']);;
        } else {
        $checkMM = mm::where('nama_siswa', $siswa->nama_siswa)->get()->first();

        $checkRPL = rpl::where('nama_siswa', $siswa->nama_siswa)->get()->first();
        // dd($checkRPL);
            if ($siswa->kejuruan == "MM") {
                    switch ($checkMM) {
                    case null:
                        return view('project')->with('siswa', $siswa);
                        break;
                    
                    default:
                        return back()->with(['warning' => 'Anda telah melebihi mengumpulkan tugas anda ']);
                        break;
                }
            } else{
                switch ($checkRPL) {
                case null:
                    return view('project')->with('siswa', $siswa);
                    break;
                
                default:
                    return back()->with(['warning' => 'Anda telah mengumpulkan tugas anda ']);
                    break;
            }
            }

            // if ( $checkMM == null ) {
            //     return view('project')->with('siswa', $siswa);
            // } elseif ($checkRPL == null) {
            //     return view('project')->with('siswa', $siswa);
            // }
            // else{
            //     return redirect("/")->with(['warning' => 'Anda telah melebihi menumpulkan tugas anda ']);;
            // }
        
        }
        
        // return view('project')->with('siswa', $siswa);
    }
    public function test()
    {
    //     $random = str_random(5);
    //     // dd($random);
    //     $curl = Curl::to("http://localhost:3000/api/v1/admin/users")
    //         ->withHeader("accept: application/json")
    //         ->withHeader("Authorization: token 10414d8e4959e27f1ba3cac4eab55d916496a2df")
    //         ->withData(array('email'=>'irvannaufal@email.com','full_name'=>'irvannaufal', 'login_name' => 'irvannaufal', 'password' => '$random', 'send_notify' => 'false', 'username' => 'irvannaufal'))
    //         // ->asJson()
    //         ->post();
    //         dd($curl);
    }
    public function submitProject()
    {
    	return view('project');
    }
}
