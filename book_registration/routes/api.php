<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

// Auth::routes();
Route::post('/login', 'Api\AuthController@login')->name('api.login');
Route::post('/register', 'Api\AuthController@register')->name('api.register');
// Route::post('/password/email', 'Api\AuthController@sendResetLinkEmail')->name('api.password.email');
Route::apiResource('/books', 'BookController');
