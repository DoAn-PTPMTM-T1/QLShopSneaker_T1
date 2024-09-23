<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
class SanPhamSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        $faker = Faker::create();
        $imageUrls = [
            'https://example.com/shoe1.jpg',
            'https://example.com/shoe2.jpg',
            'https://example.com/shoe3.jpg',
            'https://example.com/shoe4.jpg',
            'https://example.com/shoe5.jpg',
        ];

        for ($i = 0; $i < 10; $i++) {
            DB::table('SanPham')->insert([
                'MaSanPham'   => 'SP' . str_pad($i + 1, 2, '0', STR_PAD_LEFT),
                'MaDanhMuc'   => 'DM0' . rand(1, 4),
                'MaNhaCungCap' => 'NCC0' . rand(1, 3),
                'MaThuongHieu' => 'TH0' . rand(1, 4),
                'TenSanPham'  => $faker->word . ' Shoes',
                'MoTa'        => $faker->sentence,
                'Gia'         => $faker->randomFloat(2, 20, 500),
                'TonKho'      => $faker->numberBetween(0, 100),
                'Size'        => $faker->randomFloat(1, 5, 13),
                'MauSac'      => $faker->colorName,
                'HinhAnh'     => $faker->imageUrl(),
            ]);
    }
}
}
