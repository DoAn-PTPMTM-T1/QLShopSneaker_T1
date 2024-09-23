<?php

use App\Http\Controllers\SanPhamController;
use Illuminate\Support\Facades\Route;

Route::get('/',[SanPhamController::class,'index'])->name('index');
