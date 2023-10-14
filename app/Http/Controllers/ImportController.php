<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\myLib\Helper;
use App\Http\Controllers\myLib\ColHelper;

class ImportController extends Controller
{
    public function master() {

        $this->authorize('gate_admin');
        $navs = Helper::getMenu(0);
        return view('import.v_import', [
            "title" => "Import Master Data",
            "navs" => $navs,
            "widget_icon" => "fa fa-file-excel-o",           
            "widget_title" => "Import Master Data",
            "widget_content" => "Import Master Data"
        ]);

    } 

    public function customer() {

        $this->authorize('gate_admin');
        $navs = Helper::getMenu(0);
        
        include_once("phpgrid\config.php");
        include('phpgrid\jqgrid_dist.php');

        $g = new \jqgrid();
        $g->table = "mst_customers";
        $opt = Helper::gridImportOption();
        $g->set_options($opt);
      
        $act = Helper::gridImportAction();
        $g->set_actions($act);

		$cols = ColHelper::loggingColl();  
		$col = array();
		$col["name"] = "import_fname";        
		$cols[] = $col;

		$g->set_columns($cols,true);
        $out = $g->render("list1"); 

		/*---import history ----*/		
		$g2 = new \jqgrid();

		$act['import'] = FALSE;
		$g2->set_options($opt);
		$g2->set_actions($act);
		
        $prj_code = config('app.project_code');
        $g2->select_command = "SELECT import_fname, created_at, created_by FROM imports_histories WHERE project_code='$prj_code' AND table_name='mst_customers'";
		
        $cols = ColHelper::loggingColl();  
        $col = array();
		$col["name"] = "import_fname";
        $col["title"] = "Filename"; 		
		$cols[] = $col;

		$col = array();
		$col["name"] = "created_at";
		$col["title"] = "Date";	
        $col["hidden"] = false;	
		$cols[] = $col;

		$g2->set_columns($cols,true);
		
		$outhis = $g2->render("list2");
		/*---end import history ----*/        

        return view('import.v_import_data', [
            "title" => "Import Customers",
            "navs" => $navs,
            "widget_icon" => "fa fa-user",           
            "widget_title" => "Import Customers",
            'phpgrid_output'=> $out,
            'out_history' => $outhis
        ]);        
    }

    public function product() {

        $this->authorize('gate_admin');
        $navs = Helper::getMenu(0);
        
        include_once("phpgrid\config.php");
        include('phpgrid\jqgrid_dist.php');

        $g = new \jqgrid();
        $g->table = "mst_products";
        $opt = Helper::gridImportOption();
        $g->set_options($opt);
      
        $act = Helper::gridImportAction();
        $g->set_actions($act);

		$cols = ColHelper::loggingColl();  
		$col = array();
		$col["name"] = "import_fname";  
              
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

		$g->set_columns($cols,true);
        $out = $g->render("list1"); 

		/*---import history ----*/		
		$g2 = new \jqgrid();

		$opt["toolbar"] = "top";
		$opt["shrinkToFit"] = TRUE;
		$act['import'] = FALSE;

		$g2->set_options($opt);
		$g2->set_actions($act);
		
        $prj_code = config('app.project_code');
        $g2->select_command = "SELECT import_fname, created_at, created_by FROM imports_histories WHERE project_code='$prj_code' and table_name='mst_products'";
		
        $cols = ColHelper::loggingColl(); 
        $col = array();
		$col["name"] = "import_fname";
        $col["title"] = "Filename"; 		
		$cols[] = $col;

		$col = array();
		$col["name"] = "created_at";
		$col["title"] = "Date";	
        $col["hidden"] = false;	
		$cols[] = $col;

		$g2->set_columns($cols,true);
		
		$outhis = $g2->render("list2");
		/*---end import history ----*/  

        return view('import.v_import_data', [
            "title" => "Import Products",
            "navs" => $navs,
            "widget_icon" => "fa fa-list-alt",           
            "widget_title" => "Import Products",
            'phpgrid_output'=> $out,
            'out_history' => $outhis
        ]);        
    }    
}
