<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;

class CategoryController extends Controller
{
    function get() {     
        
        $category = Category::where('project_code', 'P001')->get();
        return response()->json([
            "message" => "Success",
            "data" => $category
        ]);
    }

    function getById($id) {     
        
        $category = Category::where('id', $id)->get();
        return response()->json([
            "message" => "Success",
            "data" => $category
        ]);
    }    

    function post(Request $request) {
        $aCat = new Category();

        $aCat->project_code = $request->project_code;
        $aCat->category_name = $request->category_name;
        $aCat->description = $request->description;
        $aCat->save();

        return response()->json([
            "message" => "Success",
            "data" => $aCat
        ]);
    }
    
    function put($id, Request $request) {

        $aCat = Category::where('id', $id)->first();
        if ($aCat) {
            $aCat->project_code = $request->project_code ? $request->project_code : $aCat->project_code;
            $aCat->category_name = $request->category_name ? $request->category_name : $aCat->category_name;
            $aCat->description = $request->description ? $request->description : $aCat->description;

            $aCat->save();
            return response()->json([
                "message" => "Success",
                "data" => $aCat
            ]);
        }
        else 
            return response()->json([
                "message" => "Category not found"
                ],400
            );
    }
    

    function delete($id) {

        $aCat = Category::find($id, 'id');
        if ($aCat) {
            $aCat->delete();
            return response()->json([
                "message" => "Success",
                "data" => $aCat                
            ]);           
        }
        else
            return response()->json([
                "message" => "Category not found"
                ],400
            );
    }   
}
