<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'PostController@index')->name('home');
Route::get('/add_post', 'PostController@create')->middleware('auth')->name('add_post_form');
Route::post('/add_post', 'PostController@store')->middleware('auth')->name('add_post');
Route::get('/post/{slug}', 'PostController@show')->where('slug', '^[a-z0-9_-]+$');

Auth::routes();
