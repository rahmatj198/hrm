<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\myLib\Helper;
use App\Http\Controllers\myLib\ColHelper;
use App\Models\Menu;

class MasterController extends Controller
{
    public function customer($mid = 0) {

        $this->authorize('gate_entrydata');
        $navs = Helper::getMenu(0);
        $mtabid = Menu::find($mid);
        $menuid = $mtabid ? $mtabid->id : 0;  
        
        include_once(app_path() . "/Http/Controllers/phpgrid/config.php");
        include(app_path() . "/Http/Controllers/phpgrid/jqgrid_dist.php");

        $g = new \jqgrid();
        $g->table = "mst_customers";
        $opt = Helper::gridDefaultOption();
        $opt["export"] = array("format"=>"xls", 
						"filename"=>"my-file", 
						"heading"=>"Export to Excel", 
						"range"=>"filtered");
        $g->set_options($opt);
      
        $act = Helper::gridDefaultAction( $menuid);
        $g->set_actions($act);

		$cols = ColHelper::loggingColl();  
		$col = array();
		$col["name"] = "import_fname";
		$col["hidden"] = true;
		$col["hidedlg"] = true;
		$cols[] = $col;

		$col = array();
		$col["name"] = "company_name";
		$col["editrules"] = array("required"=>true);  
        $cols[] = $col;            

		$col = array();
		$col["name"] = "contact_name";
		$col["editrules"] = array("required"=>true);  
        $cols[] = $col;    
        
		$col = array();
		$col["name"] = "address";
		$col["editrules"] = array("required"=>true);  
        $cols[] = $col;        

		$g->set_columns($cols,true);
        $out = $g->render("list1"); 

        return view('master.v_master', [
            "title" => "Customers",
            "navs" => $navs,
            "breadcrumb" => "<li>Master</li><li>Customer</li>", 
            "widget_icon" => "fa fa-male",           
            "widget_title" => "Customers",
            'phpgrid_output'=> $out
        ]);

    } 

    public function product($mid = 0) {

        $this->authorize('gate_entrydata');
        $navs = Helper::getMenu(0);
        $mtabid = Menu::find($mid);
        $menuid = $mtabid ? $mtabid->id : 0;  
        
        include_once(app_path() . "/Http/Controllers/phpgrid/config.php");
        include(app_path() . "/Http/Controllers/phpgrid/jqgrid_dist.php");

        $g = new \jqgrid();
        $g->table = "mst_products";
        $opt = Helper::gridDefaultOption();
        $g->set_options($opt);
      
        $act = Helper::gridDefaultAction( $menuid);
        $g->set_actions($act);

		$cols = ColHelper::loggingColl();  
		$col = array();
		$col["name"] = "import_fname";
		$col["hidden"] = true;
		$col["hidedlg"] = true;
		$cols[] = $col;

		$col = array();
		$col["name"] = "product_name";
		$col["editrules"] = array("required"=>true);  
        $cols[] = $col;    
        
		$col = array();
		$col["name"] = "supplier_id";
        $col["width"] = "150";
		$col["edittype"] = "lookup";
		$col["editoptions"] = array("table"=>"mst_suppliers", "id"=>"id", "label"=>"concat(id,'-', company_name)");        
        $cols[] = $col;           
  
		$col = array();
		$col["name"] = "category_id";
        $col["width"] = "150";
		$col["edittype"] = "lookup";
		$col["editoptions"] = array("table"=>"mst_categories", "id"=>"id", "label"=>"concat(id,'-', category_name)");        
        $cols[] = $col;           
        
		$col = array();
		$col["name"] = "unit_price";
		$col["editrules"] = array("required"=>true, "number"=>true);  
        $cols[] = $col;        

		$g->set_columns($cols,true);
        $out = $g->render("list1");  

        return view('master.v_master', [
            "title" => "Products",
            "navs" => $navs,
            "widget_icon" => "fa fa-list-alt",           
            "widget_title" => "Products",
            'phpgrid_output'=> $out
        ]);

    } 
}
