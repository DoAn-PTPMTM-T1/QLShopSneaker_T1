<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
class ThuongHieuSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        DB::table('ThuongHieu')->insert([
            ['MaThuongHieu' => 'TH01', 'TenThuongHieu' => 'Nike'],
            ['MaThuongHieu' => 'TH02', 'TenThuongHieu' => 'Adidas'],
            ['MaThuongHieu' => 'TH03', 'TenThuongHieu' => 'Puma'],
            ['MaThuongHieu' => 'TH04', 'TenThuongHieu' => 'Reebok'],
        ]);
    }
}
