<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use App\Models\Product;
use DB;

class TransactionController extends Controller
{
    /**
     * Display list product.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $product = Product::whereDate('sync_date', '=', date('Y-m-d'));

        if($product->count() == 0) {
            $response = Http::get('https://60c18de74f7e880017dbfd51.mockapi.io/api/v1/jabar-digital-services/product');
            $convert = Http::get('https://v6.exchangerate-api.com/v6/f788f13868f4d6e2e4771406/pair/USD/IDR');

            $conversion = json_decode($convert->body(), true);
            $data = json_decode($response->body(), true);

            foreach($data as $row) {
                Product::create([
                    'id' => $row['id'],
                    'createdAt' => date('Y-m-d h:i:s', strtotime($row['createdAt'])),
                    'price' => $row['price'],
                    'department' => $row['department'],
                    'product' => $row['product'],
                    'price_idr' => round($conversion['conversion_rate']*$row['price'],2),
                    'exchange_rate' => $conversion['conversion_rate'],
                    'sync_date' => date('Y-m-d'),
                ]);
            }

            $product = Product::all();
        } else {
            $product = $product->get();
        }

        return response()->json(['status' => 200, 'product' => $product]);
    }

    /**
     * Display list aggregation of department, product & price_idr.
     *
     * @return \Illuminate\Http\Response
     */
    public function summary(Request $request)
    {
        if(auth()->user()->role != 'admin') {
            return response()->json(['message', 'You don`t have authorization for access this api'], 400);
        }

        $product = Product::select('department', 'product', DB::raw('SUM(price_idr) as total_price'))->
                    orderBy('price_idr')->
                    groupBy('department', 'product')->get();

        if(!empty($product)) {
            $status = 200;
        } else {
            $status = 400;
        }

        return response()->json($product, $status);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
