<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post as post;

class PostCon extends Controller
{
    public function index()
	{
		$articles = post::all();

		// dd($article);

		return view('article.article')->with('articles',$articles);
	}

	public function show($slug)
	{
		$article = post::where('slug', $slug)->firstOrFail();
		return view('article.show')->with('article', $article);
	}
}
