<?php

namespace App\Http\Controllers\api;

use Illuminate\Support\Facades\DB;
use App\Http\Requests\StoreProductRequest;
use App\Http\Resources\JsonDataResource;
use App\Http\Resources\ProductsResource;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Traits\HttpResponses;
use App\Models\Product;

class ProductsController extends Controller
{
    use HttpResponses;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        /*  
            $products = Product::paginate(10);   
            $products = Product::all();
            $products = DB::table('v_products')->paginate(10);
        */
        $products = DB::table('v_products')->get();
        return new JsonDataResource(true, 'success', $products);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreProductRequest $request)
    {
        $request->validated();
        $aProduct = Product::create([   
            'project_code'  => config('app.project_code'),          
            'product_name'  => $request->product_name,
            'supplier_id'   => $request->supplier_id,
            'category_id'   => $request->category_id,
            'unit_price'    => $request->unit_price,
            'img_path'      => $request->img_path,
			'created_by'    =>	'api'
        ]);

        return new JsonDataResource(true, 'success', $aProduct);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //$aProduct = Product::find($id);
        $aProduct = Product::with(['supplier','category'])->find($id);   //eager loading
        
        if ($aProduct)
            return new ProductsResource(true, 'success', $aProduct);
        else
            return $this->error('', 'fail', 404); 

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
        //use x-www-fom-urlencoded on postman
        $aProduct = Product::find($id);
        if ($aProduct) {
         $aProduct->product_name = $request->product_name? $request->product_name: $aProduct->product_name;
         $aProduct->supplier_id = $request->supplier_id? $request->supplier_id: $aProduct->supplier_id;
         $aProduct->category_id = $request->category_id? $request->category_id: $aProduct->category_id;
         $aProduct->unit_price = $request->unit_price? $request->unit_price: $aProduct->unit_price;
         $aProduct->img_path = $request->img_path? $request->img_path: $aProduct->img_path;
         $aProduct->updated_by = 'api';
         $aProduct->save();
 
         return new JsonDataResource(true, 'success', $aProduct);
         }
        else
             return $this->error('', 'fail', 404);
        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $aProduct = Product::find($id);
        if ($aProduct) {
         $aProduct->delete();
         return new JsonDataResource(true, 'success', $aProduct);
         }
        else
             return $this->error('', 'fail', 404);
    }
}
