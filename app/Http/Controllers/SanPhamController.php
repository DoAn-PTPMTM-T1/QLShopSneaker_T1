<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SanPham;
class SanPhamController extends Controller
{
    //
    public function index()
    {
        $sanpham = SanPham::all();

        return view('home.index',compact('sanpham'));
    }
}
