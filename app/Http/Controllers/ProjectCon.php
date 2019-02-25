<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ProjectMm as mm;
use App\ProjectRpl as rpl;
use App\Siswa;
use Curl;

class ProjectCon extends Controller
{
    public function insert(Request $request)
    {
    	// dd($request->judul_project);
    	$this->validate($request,[
    			'excerpt' => 'required|min:10|max:100',
    			'description' => 'required|max:700',
    			'image' => 'required'
    		],[
    			'excerpt.required' => ' Deskripsi singkat harus diisi',
    			'excerpt.min' => ' Deskripsi singkat minimal 5 karakter',
    			'excerpt.max' => ' Deskripsi singkat maksimal 100 karakter',
    			'description.required' => ' Deskripsi Harus diisi',
    			'description.max' => ' The description may not be greater than 700 characters.',
    		]);


    	// dd('You are successfully added all fields.');

    	// dd($request);
    		// dd($input['nama_siswa']);
        	if ($request->kejuruan == 'RPL') {
        	$genPass = str_random(8);
        	$projectName = str_slug($request->judul_project);
    		$project = new rpl;
    		$project->nama_siswa = $nama_siswa =  $request->nama_siswa;
            $repo_uri = strtolower($request->nama_siswa);
            $repo_uname = str_replace(' ', '', $repo_uri);
    		$project->nama_project =  title_case($request->judul_project);
    		$project->excerpt = $excerpt = $request->excerpt;
    		$project->description = $description = $request->description;
	    		$file = $request->file('image');
		        $name = $file->getClientOriginalName();
		        $path = $file->store('project');
		        $project->picture = $path;
            // dd($request->image);
    		$project->repo_url = $repo_url =  "$request->repo_url"."/"."$projectName";
    		// dd($repo_url);
    		$project->repo_password = $genPass;
    		$project->verified = "Pending";
    		$project->save();

    		
    		
    		    $curl = Curl::to("http://localhost:8080/api/v1/admin/users")
		            ->withHeader("accept: application/json")
		            ->withHeader("Authorization: token 5d559eaad6bdc6676d1096efec66e089265de577")
		            ->withData(array('email'=>"$repo_uname".'@email.com','full_name'=>"$nama_siswa", 'login_name' => "$repo_uname", 'password' => "$genPass", 'send_notify' => 'false', 'username' => "$repo_uname"))
		            ->post();

		           // dd($curl);
		          $createRepo = Curl::to("http://localhost:8080/api/v1/admin/users/$repo_uname/repos")
		            ->withHeader("accept: application/json")
		            ->withHeader("Authorization: token 5d559eaad6bdc6676d1096efec66e089265de577")
		            ->withData(array("auto_init" => "false", "description" => "$excerpt", "gitignore" => "", "license" => "MIT", "name" => "$projectName", "private" => "false", "readme" => "$description"))
		            ->post();
		            // dd($createRepo);
    		return redirect()->route('result', $request->nama_siswa);
    	} elseif ($request->kejuruan == 'MM') {
    		$project = new mm;
    		$project->nama_siswa = $nama_siswa =  $request->nama_siswa;
    		$project->nama_project =  title_case($request->judul_project);
    		$project->excerpt = $request->excerpt;
    		$project->description = $description = $request->description;
	    		$file = $request->file('image');
		        $name = $file->getClientOriginalName();
		        $path = $file->store('project');
		        $project->picture = $path;
            // dd($request->image);
    		$project->repo_url = $repo_url =  $request->repo_url;
    		// dd($repo_url);
    		$project->verified = "Pending";
    		$project->save();

    		return redirect()->route('result', $request->nama_siswa)->with('project', $request)->with('pass', $genPass);
    	} else{
    		return back();
    	}
    	
    }

    public function result()
    {
    	return view('result');
    }
}

