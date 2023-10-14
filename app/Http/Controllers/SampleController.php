<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\myLib\Helper;

class SampleController extends Controller
{
           
    public function index() {

        $this->authorize('gate_entrydata');
        $navs = Helper::getMenu(0);                        
        //include(app_path(). '\Http\Controllers\phpgrid\jqgrid_dist.php');
        include_once("phpgrid\config.php");
        include('phpgrid\jqgrid_dist.php');
        
        try {
            $g = new \jqgrid();
            $opt["caption"] = "";
            $opt["multiselect"] = true;
            $opt["multiselectWidth"] = "5";
            //$opt["hoverrows"] = false;    
            $opt["shrinkToFit"] = false;
            $opt["autowidth"] = false;
            $opt["altRows"] = true;
            $g->set_options($opt);

            $g->table = "mst_customers";
            $out = $g->render("list1");
        }
        catch (Exception $error) {
            echo "Error: {$error->getMessage()}";
            die(0);
        } 

        return view('phpgrid_sample', [
            "title" => "Sample Grid Title",
            "navs" => $navs,
            "breadcrumb" => "Sample Grid Breadcrumb",
            "widget_title" => "Sample Grid Widget Title",
            "widget_content" => "Sample Grid Widget Content",
            'phpgrid_output'=> $out
        ]);
    }

    public function testpage() {

        $navs = Helper::getMenu(0);

        return view('sample', [
            "title" => "Sample Page Title",
            "navs" => $navs,
            "breadcrumb" => "Sample Breadcrumb",            
            "widget_title" => "Sample Widget Title",
            "widget_content" => "Sample Widget Content"
        ]);
    }    
}
