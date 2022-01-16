<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::insert([
            [
                'name' => 'Admin 1',
                'user_name' => 'admin1',
                'password' => bcrypt('admin1'),
                'created_by' => 1,
                'updated_by' => 1,
            ],
            [
                'name' => 'Admin 2',
                'user_name' => 'admin2',
                'password' => bcrypt('admin2'),
                'created_by' => 2,
                'updated_by' => 2,
            ]
        ]);
    }
}
