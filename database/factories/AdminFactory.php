<?php

namespace Database\Factories;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Admin>
 */
class AdminFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            DB::table('admins')->insert([
                'name' => "Md Najib Islam",
                'email' => "admin@gmail.com",
                'type' => '1',
                'phone' => "01537500950",
                "secret_code" => "developer",
                "email_verified_at" => now(),
                'password' => Hash::make("123456789"),
                "remember_token" => Str::random(10),
            ]),
            DB::table('admins')->insert([
                'name' => "Salman Faruk",
                'email' => "salman@gmail.com",
                'type' => '2',
                'phone' => "01511967007",
                "secret_code" => "developer",
                "email_verified_at" => now(),
                'password' => Hash::make("123456789"),
                "remember_token" => Str::random(10),
            ]),
            DB::table('admins')->insert([
                'name' => "Md Foisal",
                'email' => "foisal@gmail.com",
                'type' => '2',
                'phone' => "01234567890",
                "secret_code" => "member",
                "email_verified_at" => now(),
                'password' => Hash::make("123456789"),
                "remember_token" => Str::random(10),
            ]),
            DB::table('admins')->insert([
                'name' => "Farjana Akter Ria",
                'email' => "farjana@gmail.com",
                'type' => '2',
                'phone' => "01234567890",
                "secret_code" => "member",
                "email_verified_at" => now(),
                'password' => Hash::make("123456789"),
                "remember_token" => Str::random(10),
            ]),
            DB::table('users')->insert([
                'name' => "Md Najib Islam",
                'email' => "user@gmail.com",
                'phone' => "01537500950",
                "email_verified_at" => now(),
                'password' => Hash::make("123456789"),
                "remember_token" => Str::random(10),
            ]),
            DB::table('users')->insert([
                'name' => "Salman Faruk",
                'email' => "salman@gmail.com",
                'phone' => "01511967007",
                "email_verified_at" => now(),
                'password' => Hash::make("123456789"),
                "remember_token" => Str::random(10),
            ]),
            DB::table('brands')->insert([
                "brand_name_en" => "Test Brand",
                "brand_slug_en" => "test-brand",
                "brand_image" => "no_image.jpg",
            ]),
            DB::table('brands')->insert([
                "brand_name_en" => "Test Brand 2",
                "brand_slug_en" => "test-brand 2",
                "brand_image" => "no_image.jpg",
            ]),
            DB::table('categories')->insert([
                "category_name_en" => "Test Category",
                "category_slug_en" => "test-category",
                "category_icon" => "fa fa-file-text",
            ]),
            DB::table('categories')->insert([
                "category_name_en" => "Test Category 2",
                "category_slug_en" => "test-category 2",
                "category_icon" => "fa fa-file-text",
            ]),
            DB::table('sub_categories')->insert([
                "category_id" => 1,
                "subcategory_name_en" => "Test Subcategory",
                "subcategory_slug_en" => "test-subcategory",
            ]),
            DB::table('sub_sub_categories')->insert([
                "subcategory_id" => 1,
                "category_id" => 1,
                "subsubcategory_name_en" => "Test Subsubcategory",
                "subsubcategory_slug_en" => "test-subsubcategory",
            ]),
            DB::table('products')->insert([
                "brand_id" => 1,
                "category_id" => 1,
                "subcategory_id" => 1,
                "subsubcategory_id" => 1,
                "product_name_en" => "Test Product",
                "product_slug_en" => "test-product",
                "product_code" => "test-code",
                "product_qty" => "1",
                "product_tags_en" => "test, product, tags",
                "product_size_en" => "X, XL, XXL",
                "product_color_en" => "Red, Green, Blue",
                "selling_price" => "100",
                "discount_price" => "10",
                "short_descp_en" => "Test Product Description",
                "long_descp_en" => "Test Product Specification",
                "product_thambnail" => "no_image.jpg",
                "status" => 1,
            ]),
            DB::table('products')->insert([
                "brand_id" => 1,
                "category_id" => 1,
                "subcategory_id" => 1,
                "subsubcategory_id" => 1,
                "product_name_en" => "Test Product 2",
                "product_slug_en" => "test-product 2",
                "product_code" => "test-code",
                "product_qty" => "1",
                "product_tags_en" => "test, product, tags",
                "product_size_en" => "X, XL, XXL",
                "product_color_en" => "Red, Green, Blue",
                "selling_price" => "100",
                "discount_price" => "10",
                "short_descp_en" => "Test Product Description 2",
                "long_descp_en" => "Test Product Specification 2",
                "product_thambnail" => "no_image.jpg",
                "status" => 1,
            ]),
            DB::table('site_settings')->insert([
                "company_name" => "E-Zone",
            ]),
            DB::table('seos')->insert([
                "meta_author" => "Md Najib Islam",
            ]),
        ];
    }
}
