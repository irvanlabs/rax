<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Article as article;

class ArticleCon extends Controller
{
	public function index()
	{
		$articles = article::all();

		// dd($article);

		return view('article.article')->with('articles',$articles);
	}

	public function show($slug)
	{
		$article = article::where('slug', $slug)->firstOrFail();
		return view('article.show')->with('article', $article);
	}
}
