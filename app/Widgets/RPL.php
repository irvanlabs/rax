<?php

namespace App\Widgets;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use Arrilot\Widgets\AbstractWidget;

class RPL extends AbstractWidget
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        $count = \App\ProjectRpl::count();
        $string = 'RPL Project';

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-file-code',
            'title'  => "{$count} {$string}",
            'text'   => __('Anda Punya '.$count.' '.$string.' pada database'),
            'button' => [
                'text' => 'Tampilkan',
                'link' => route('voyager.project-rpl.index'),
            ],
            'image' => 'assets/img/code.jpg',
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        return Auth::user()->can('browse', Voyager::model('Page'));
    }
}
