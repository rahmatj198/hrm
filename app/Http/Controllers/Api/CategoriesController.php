<?php

namespace App\Http\Controllers\api;

use App\Http\Requests\StoreCategoryRequest;
use App\Http\Resources\JsonDataResource;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Traits\HttpResponses;
use App\Models\Category;

class CategoriesController extends Controller
{
    use HttpResponses;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::all();
        return new JsonDataResource(true, 'success', $categories);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCategoryRequest $request)
    {
        $request->validated();
        $aCat = Category::create([   
            'project_code'  => config('app.project_code'),          
            'category_name' => $request->category_name,
            'description'   => $request->description,
			'created_by'    =>	'api'
        ]);

        return new JsonDataResource(true, 'success', $aCat);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $aCat = Category::find($id);
        if ($aCat)
            return new JsonDataResource(true, 'success', $aCat);
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
       $aCat = Category::find($id);
       if ($aCat) {
        $aCat->category_name = $request->category_name? $request->category_name: $aCat->category_name;
        $aCat->description = $request->description? $request->description: $aCat->description;
        $aCat->updated_by = 'api';
        $aCat->save();

        return new JsonDataResource(true, 'success', $aCat);
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
        $aCat = Category::find($id);
        if ($aCat) {
         $aCat->delete();
         return new JsonDataResource(true, 'success', $aCat);
         }
        else
             return $this->error('', 'fail', 404);
    }
}
