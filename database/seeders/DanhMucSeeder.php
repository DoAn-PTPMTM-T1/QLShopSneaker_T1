<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
class DanhMucSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        DB::table('DanhMuc')->insert([
            ['MaDanhMuc' => 'DM01', 'TenDanhMuc' => 'Sports'],
            ['MaDanhMuc' => 'DM02', 'TenDanhMuc' => 'Casual'],
            ['MaDanhMuc' => 'DM03', 'TenDanhMuc' => 'Formal'],
            ['MaDanhMuc' => 'DM04', 'TenDanhMuc' => 'Running'],
        ]);
    }
}
