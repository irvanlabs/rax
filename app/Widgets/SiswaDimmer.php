<?php

namespace App\Widgets;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Arrilot\Widgets\AbstractWidget;
use TCG\Voyager\Facades\Voyager;

class SiswaDimmer extends AbstractWidget
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
        $count = \App\Siswa::count();
        $string = 'Siswa';

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-study',
            'title'  => "{$count} {$string}",
            'text'   => __('Anda Punya '.$count.' '.$string.' pada database'),
            'button' => [
                'text' => 'Tampilkan',
                'link' => route('voyager.siswa.index'),
            ],
            'image' => 'assets/img/student.jpg',
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
