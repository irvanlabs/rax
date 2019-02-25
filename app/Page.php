<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Page extends Model
{
    protected $table = 'pages';
    public static function urlSlug($slug)
    {
    	return static::where('slug', $slug)->firstOrFail();
    }
}
