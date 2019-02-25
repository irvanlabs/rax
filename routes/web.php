<?php

Route::group(['prefix' => 'ngadimin'], function () {
    Voyager::routes();
});

Route::get('/', 'DeadlineCon@index');

Route::get('/article', 'PostCon@index');
Route::get('/result', 'ProjectCon@result');

Route::get('/article/{slug}', 'PostCon@show');

Route::get('/explore', 'ExploreCon@index');

Route::get('/submit', 'FormCon@showSubmit');


Route::get('/page/{slug}', 'PageCon@pageView');

// Route::resource('/submit/project', 'ProjectCon@');
Route::get('/submit/token/', 'FormCon@submitToken')->name('submit.token');

Route::get('/submit/project/{token}', 'ProjectCon@insert')->name('project.submit');

Route::post('/submit/project/', 'ProjectCon@insert')->name('project.submit.post');

Route::get('/submit/project/result/{nama}', 'PageCon@result')->name('result');

Route::get('/project/detail/{kj}/{id}', 'ExploreCon@detail')->name('detail');

// Route::post('/submit/project/{kejuruan}', 'Project@show');
// Route::get('/test', 'FormCon@test');

