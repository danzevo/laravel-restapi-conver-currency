<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
// use PHPUnit\Framework\TestCase;
use App\Models\User;

class TransactionControllerTest extends TestCase
{
    /**
     * A basic feature test example.
     * @test
     * @return void
     */
    public function it_product()
    {
        $user = User::factory()->create();
        // $user = User::find(2);
        $response = $this->actingAs($user)->get('/api/product');

        $response->assertStatus(200);
    }

    /**
     * A basic feature test example.
     * @test
     * @return void
     */
    public function it_product_summary()
    {
        $user = User::factory()->create();
        // $user = User::find(2);
        $response = $this->actingAs($user)->get('/api/product-summary');

        $response->assertStatus(200);
    }
}
