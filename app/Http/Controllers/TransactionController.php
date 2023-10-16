<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\myLib\Helper;
use App\Http\Controllers\myLib\ColHelper;
use App\Models\Menu;

class TransactionController extends Controller
{
    public function md_orders($mid) {

        $this->authorize('gate_entrydata');
        $navs = Helper::getMenu(0);
        $mtabid = Menu::find($mid);
        $menuid = $mtabid ? $mtabid->id : 0;         

        $prj_code = config('app.project_code');
        //dropdown
		$ddata['list_customer'] = Helper::getDropdown('mst_customers', "id", "company_name");
		$ddata['list_employee'] = Helper::getDropdown('mst_employees', "id", "last_name");
		$ddata['list_shipper'] = Helper::getDropdown('mst_shippers', "id", "company_name");	
        
        include_once(app_path() . "/Http/Controllers/phpgrid/config.php");
        include(app_path() . "/Http/Controllers/phpgrid/jqgrid_dist.php");

        $g = new \jqgrid();
        $g->table = "tr_orders";

        $opt = Helper::gridDefaultOption();
        $opt["toolbar"] = "bottom";
		$opt["caption"] = "";
		$opt["onSelectRow"] = "function(){ load_form(); }";
		$opt["detail_grid_id"] = "list2,list3";
		$opt["subgridparams"] = "id";
		$opt["multiselect"] = FALSE;
		$opt["add_options"] = array('width'=>'600');
		$opt["edit_options"] = array('width'=>'600');
		$opt["view_options"] = array('width'=>'600');
		$opt["loadComplete"] = "function() {  fdata_select(); }";   //select first data when load complete

        $act = Helper::gridDefaultAction($menuid);
        $act['rowactions'] = FALSE;

        $cols = ColHelper::loggingColl(); 
        
		$col = array();
		$col["name"] = "customer_id";
        $col["width"] = "160";
		$col["edittype"] = "lookup";
		$col["editoptions"] = array("table"=>"mst_customers", "id"=>"id", "label"=>"concat(id,'-', company_name)");        
        $cols[] = $col;  

		$col = array();
		$col["name"] = "employee_id";
        $col["width"] = "120";
		$col["edittype"] = "lookup";
		$col["editoptions"] = array("table"=>"mst_employees", "id"=>"id", "label"=>"concat(id,'-', last_name)");        
        $cols[] = $col;  

		$col = array();
		$col["name"] = "order_date";
        $col["width"] = "100";
		$col["editrules"] = array("required"=>true, "date"=>true);  
        $col["formatter"] = "date";
        $col["formatoptions"] = array("srcformat"=>'Y-m-d',"newformat"=>'d-M-Y');        
        $cols[] = $col;  

		$col = array();
		$col["name"] = "required_date";
		$col["width"] = "100";
		$col["editrules"] = array("required"=>true);
		$col["formatter"] = "date";
		$col["formatoptions"] = array("srcformat"=>'Y-m-d',"newformat"=>'d-M-Y');
		$col["editable"] = true;
		$col["show"] = array("list"=>FALSE, "add"=>TRUE, "edit"=>TRUE, "view"=>FALSE, "bulkedit"=>FALSE);
		$cols[] = $col;        

		$col = array();
		$col["name"] = "shipped_date";
		$col["width"] = "100";
		$col["editrules"] = array("required"=>true);
		$col["formatter"] = "date";
		$col["formatoptions"] = array("srcformat"=>'Y-m-d',"newformat"=>'d-M-Y');
		$col["editable"] = true;
		$col["show"] = array("list"=>FALSE, "add"=>TRUE, "edit"=>TRUE, "view"=>FALSE, "bulkedit"=>FALSE);
		$cols[] = $col; 

		$col = array();
		$col["name"] = "ship_via";
		$col["title"] = "Shipper";
		$col["editrules"] = array("required"=>true);
		$col["edittype"] = "lookup";
		$col["editoptions"]["sql"]= "SELECT id as k, company_name as v FROM mst_shippers";				
		$col["align"] = "left";		
		$col["show"] = array("list"=>FALSE, "add"=>TRUE, "edit"=>TRUE, "view"=>FALSE, "bulkedit"=>FALSE);		
		$cols[] = $col; 

		$col = array();
		$col["name"] = "status";
		$col["editable"] = true;
		$col["edittype"] = "select"; // render as select
		$col["width"] = "100";
		$col["searchoptions"] = array("value" => "created:created;in progress:in progress;completed:completed;cancelled:cancelled");
		$col["editoptions"] = array("value"=> "created:created;in progress:in progress;completed:completed;cancelled:cancelled");
		$cols[] = $col;

        $g->set_options($opt);
        $g->set_actions($act);
		$g->set_columns($cols);

        $out = $g->render("list1"); 

		/*---order details ----*/		
		$g2 = new \jqgrid();

        $id = $_GET["id"];
        $id = intval($id);
        //dd($id);

        $g2->select_command = "SELECT * FROM tr_order_details WHERE order_id = $id and project_code='$prj_code'";
        $g2->table = "tr_order_details";

        $cols = ColHelper::loggingColl(); 

		$opt = array();
		// $opt["caption"] = "Detail";
		$g2->set_options($opt);
		$g2->set_actions($act);

        $g2->set_columns($cols,true);

		$out_ordetails = $g2->render("list2");
		/*---end order details ----*/    


		/*---order files ----*/		
		$g3 = new \jqgrid();

		$opt = array();
		// $opt["caption"] = "Files";
		$opt["width"] = "550"; 
		//$opt["shrinkToFit"] = true; 
		//$opt["autowidth"] = true;
		$g3->set_options($opt);
		$g3->set_actions($act);	

        $g3->select_command = "SELECT * FROM tr_order_files WHERE project_code='$prj_code' AND order_id = $id";
        $cols = ColHelper::loggingColl(); 

        $g3->set_columns($cols,true);

		$out_ordfiles = $g3->render("list3");
		/*---end order files ----*/ 

        return view('transaction.v_md_order', [
            "title" => "Order",
            "navs" => $navs,
            "widget_icon" => "fa fa-reorder",           
            "widget_title" => "Order",
            "ddata" => $ddata,
            'phpgrid_output'=> $out,
            'order_details' => $out_ordetails,
            'order_files' => $out_ordfiles
        ]);

    } 

    public function sv_orders($mid = 0) {

        $this->authorize('gate_entrydata');
        $navs = Helper::getMenu(0);
        $mtabid = Menu::find($mid);
        $menuid = $mtabid ? $mtabid->id : 0;  
        
        include_once(app_path() . "/Http/Controllers/phpgrid/config.php");
        include(app_path() . "/Http/Controllers/phpgrid/jqgrid_dist.php");

        $g = new \jqgrid();
        $g->table = "tr_orders";
        $opt = Helper::gridDefaultOption();
        $g->set_options($opt);
      
        $act = Helper::gridDefaultAction( $menuid);
        $g->set_actions($act);

		$cols = ColHelper::loggingColl();
        
		$col = array();
		$col["name"] = "customer_id";
        $col["width"] = "150";
		$col["edittype"] = "lookup";
		$col["editoptions"] = array("table"=>"mst_customers", "id"=>"id", "label"=>"concat(id,'-', company_name)");        
        $cols[] = $col;  

		$col = array();
		$col["name"] = "employee_id";
        $col["width"] = "120";
		$col["edittype"] = "lookup";
		$col["editoptions"] = array("table"=>"mst_employees", "id"=>"id", "label"=>"concat(id,'-', last_name)");        
        $cols[] = $col;  

		$col = array();
		$col["name"] = "order_date";
		$col["editrules"] = array("required"=>true);  
        $col["formatter"] = "date";
        $col["formatoptions"] = array("srcformat"=>'Y-m-d',"newformat"=>'d-M-Y');        
        $cols[] = $col;         

		$col = array();
		$col["name"] = "required_date";
		$col["editrules"] = array("required"=>true);  
		//$col["editrules"] = array("required"=>true, "date"=>true);  
        $col["formatter"] = "date";
        $col["formatoptions"] = array("srcformat"=>'Y-m-d',"newformat"=>'d-M-Y');        
        $cols[] = $col; 

		$col = array();
		$col["name"] = "shipped_date";
        $col["formatter"] = "date";
        $col["formatoptions"] = array("srcformat"=>'Y-m-d',"newformat"=>'d-M-Y');        
        $cols[] = $col;         

		$col = array();
		$col["name"] = "ship_via";
        $col["width"] = "120";
		$col["edittype"] = "lookup";
		$col["editoptions"] = array("table"=>"mst_shippers", "id"=>"id", "label"=>"company_name");        
        $cols[] = $col;          

        $col = array();
		$col["name"] = "status";                
        $col["editoptions"] = array("value"=>'created:created;in progress:in progress;completed:completed;cancelled:cancelled');
        $cols[] = $col; 

		$g->set_columns($cols,true);
        $out = $g->render("list1");  

        return view('transaction.v_order', [
            "title" => "Products",
            "navs" => $navs,
            "widget_icon" => "fa fa-list-alt",           
            "widget_title" => "Products",
            'phpgrid_output'=> $out
        ]);

    }     
}
