<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class NhaCungCapSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        DB::table('NhaCungCap')->insert([
            ['MaNhaCungCap' => 'NCC01', 'TenNhaCungCap' => 'Supplier A'],
            ['MaNhaCungCap' => 'NCC02', 'TenNhaCungCap' => 'Supplier B'],
            ['MaNhaCungCap' => 'NCC03', 'TenNhaCungCap' => 'Supplier C'],
        ]);
    }
}
