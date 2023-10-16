<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\myLib\Helper;
use App\Http\Controllers\myLib\ColHelper;
use App\Models\Menu;

class AdmController extends Controller
{

    public function appuser($mid = 0) {

        $navs = Helper::getMenu(0); 
        $mtabid = Menu::find($mid);     //for privileges to grid table 
        $menuid = $mtabid ? $mtabid->id : 0;  
        
        // include_once("phpgrid\config.php"); 
        //include('phpgrid\jqgrid_dist.php');
        include_once(app_path() . "/Http/Controllers/phpgrid/config.php");
        include(app_path() . "/Http/Controllers/phpgrid/jqgrid_dist.php");

        $g = new \jqgrid();
        $g->table = "users";
        $opt = Helper::gridDefaultOption();
        $g->set_options($opt);
      
        $act = Helper::gridDefaultAction( $menuid);
        $g->set_actions($act);

		$cols = ColHelper::users_gridcoll();
		$g->set_columns($cols);

        $out = $g->render("list1");
      
        
        return view('adm.v_adm', [
            "title" => "AppUser",
            "navs" => $navs,
            "widget_icon" => "fa fa-user",            
            "widget_title" => "Users",
            'phpgrid_output'=> $out
        ]);

    }

    public function appmenu($mid = 0) {

        $navs = Helper::getMenu(0);
        $mtabid = Menu::find($mid);
        $menuid = $mtabid ? $mtabid->id : 0;  
        
        include_once("phpgrid\config.php");
        include('phpgrid\jqgrid_dist.php');

        $g = new \jqgrid();
        $g->table = "menus";
        $opt = Helper::gridDefaultOption();
        $g->set_options($opt);
      
        $act = Helper::gridDefaultAction( $menuid);
        $g->set_actions($act);

		$cols = ColHelper::loggingCollMaster();

   
		$col = array();
		$col["name"] = "type";
		$col["title"] = "Type";
		$col["width"] = "100";
		$col["editrules"] = array("required"=>true);
		$col["editable"] = true;
		$col["edittype"] = "select"; // render as select
		$col["formatter"] = "select"; // display label, not value
		$col["searchoptions"] = array("value" => "kategori:category;table:table;report:report;newpage:newpage;summary:summary;masterdetail:masterdetail;link:link");
		$col["editoptions"] = array("value"=>"kategori:category;table:table;report:report;newpage:newpage;summary:summary;masterdetail:masterdetail;link:link");
		$cols[] = $col;


		$col = array();
		$col["name"] = "nama";
		$col["editrules"] = array("required"=>true, "minValue"=>5, "maxValue"=>100);  
        $cols[] = $col;       
        
		$col = array();
		$col["name"] = "parent";
        $col["align"] = "left";
		$col["editrules"] = array("required"=>true);  
		$col["edittype"] = "lookup";
		$col["editoptions"] = array("table"=>"menus", "id"=>"id", "label"=>"concat(id,'-', nama)");        
        $cols[] = $col; 
        
		$col = array();
		$col["name"] = "url";
		$col["editrules"] = array("required"=>true);  
        $cols[] = $col;        

		$col = array();
		$col["name"] = "role_allowed";
		$col["editrules"] = array("required"=>true);  
		$col["edittype"] = "lookup";
		$col["editoptions"]["sql"]= "SELECT id as k, name as v FROM roles";
		$col["editoptions"]["multiple"] = true;        
        $cols[] = $col; 
        
		$col = array();
		$col["name"] = "aclass";
		$col["editrules"] = array("required"=>true);  
        $cols[] = $col;        

		$g->set_columns($cols,true);
        $out = $g->render("list1");  

        return view('adm.v_adm', [
            "title" => "AppMenu",
            "navs" => $navs,
            "widget_icon" => "fa fa-align-justify",
            "widget_title" => "Menus",
            'phpgrid_output'=> $out
        ]);

    }

    public function applevel($mid = 0) {
 
        $navs = Helper::getMenu(0);
        $mtabid = Menu::find($mid);
        $menuid = $mtabid ? $mtabid->id : 0;  
        
        include_once("phpgrid\config.php");
        include('phpgrid\jqgrid_dist.php');

        $g = new \jqgrid();
        $g->table = "roles";
        $opt = Helper::gridDefaultOption();
        $g->set_options($opt);
      
        $act = Helper::gridDefaultAction( $menuid);
        $g->set_actions($act);

		$cols = ColHelper::loggingCollMaster();  
		$col = array();
		$col["name"] = "id";
        $col["title"] = "Level";
        $col["width"] = "80" ;
		$col["hidden"] = false ;
		$col["hidedlg"] = false;
        $col["editrules"] = array("required"=>true); 
		$cols[] = $col;	   
        
		$col = array();
		$col["name"] = "name";
		$col["editrules"] = array("required"=>true, "minValue"=>5, "maxValue"=>100);  
        $cols[] = $col;        
        
		$g->set_columns($cols,true);
        $out = $g->render("list1");  

        return view('adm.v_adm', [
            "title" => "AppRoles",
            "navs" => $navs,
            "widget_icon" => "fa fa-level-up",                      
            "widget_title" => "Roles",
            'phpgrid_output'=> $out
        ]);
       
    }    

    public function appusrtab($mid = 0) {
 
        $navs = Helper::getMenu(0);
        $mtabid = Menu::find($mid);
        $menuid = $mtabid ? $mtabid->id : 0;  
        
        include_once("phpgrid\config.php");
        include('phpgrid\jqgrid_dist.php');

        $g = new \jqgrid();
        $g->table = "users_tabs";
        $opt = Helper::gridDefaultOption();
        $g->set_options($opt);
      
        $act = Helper::gridDefaultAction( $menuid);
        $g->set_actions($act);

		$cols = ColHelper::loggingCollMaster();       

		$col = array();
		$col["name"] = "menu_id";
        $col["width"] = "200";
		$col["edittype"] = "lookup";
		$col["editoptions"] = array("table"=>"menus", "id"=>"id", "label"=>"concat(id,'-', nama)");        
        $cols[] = $col;         

		$col = array();
		$col["name"] = "role_id";
        $col["width"] = "200";
		$col["edittype"] = "lookup";
		$col["editoptions"] = array("table"=>"roles", "id"=>"id", "label"=>"concat(id,'-', name)");        
        $cols[] = $col;   

		$col = array();
		$col["name"] = "privileges";
        $col["width"] = "400"; 
        $col["editrules"] = array("required"=>true);  
		$col["edittype"] = "lookup";
		$col["editoptions"]["sql"]= "SELECT code as k, description as v FROM users_privileges";
		$col["editoptions"]["multiple"] = true;        
        $cols[] = $col;         

		$g->set_columns($cols,true);
        $out = $g->render("list1"); 

        return view('adm.v_adm', [
            "title" => "User Table Privileges",
            "navs" => $navs,
            "breadcrumb" => "<li>Admin</li><li>AppUserTable Management</li>",   
            "widget_icon" => "fa fa-database",       
            "widget_title" => "User Table Privileges",
            'phpgrid_output'=> $out
        ]);
       
    }
}
