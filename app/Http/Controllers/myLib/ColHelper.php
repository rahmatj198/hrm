<?php

namespace App\Http\Controllers\myLib;

class ColHelper {
    
    public static function users_gridcoll() {

        $col = array();
		$col["name"] = "id";
		$col["hidden"] = true;
		$col["hidedlg"] = true;
		$cols[] = $col;

		$col = array();
		$col["name"] = "email";
		$col["title"] = "Username";
		$col["editable"] = true;
		//$col["editrules"] = array("required"=>true, "readonly"=>true, "email"=>true);
		$col["editrules"] = array("required"=>true, "readonly"=>true);
		$col["show"] = array("list"=>true, "add"=>true, "edit"=>true, "view"=>true, "bulkedit"=>false);		
		$cols[] = $col;

		$col = array();
		$col["name"] = "name";
		$col["title"] = "Name";
		$col["editable"] = true;
		$col["editrules"] = array("required"=>true, "readonly"=>true);
		$col["show"] = array("list"=>true, "add"=>true, "edit"=>true, "view"=>true, "bulkedit"=>false);
		$cols[] = $col;

		$col = array();
		$col["name"] = "password";
		$col["title"] = "Password";
		$col["formatter"] = "password";
		$col["edittype"] = "password";
		$col["editable"] = true;
		$col["editrules"] = array("required"=>true);
		$col["show"] = array("list"=>true, "add"=>true, "edit"=>true, "view"=>false, "bulkedit"=>false);
		$cols[] = $col;	
		
		$col = array();
		$col["name"] = "role_id";
		$col["title"] = "Role";				
		$col["editable"] = true;		
		$col["editrules"] = array("required"=>true);
		//$col["search"] = true;
		$col["edittype"] = "lookup";
		$col["editoptions"] = array("table"=>"roles", "id"=>"id", "label"=>"concat(id,'-', name)");
		//$col["editoptions"]["sql"]= "select id as k, concat(id,' (' , name, ')') as v from roles";		
		$cols[] = $col;   
                
        return $cols;

    }

	public static function loggingColl() {

		$col = array();
		$col["name"] = "id";
		$col["hidden"] = true;
		$col["hidedlg"] = true;
		$cols[] = $col;		
		
		$col = array();
		$col["name"] = "project_code";
		$col["title"] = "Project Code";
		$col["editable"] = true;
		$col["editoptions"] = array("defaultValue"=>config('app.project_code'),
									"readonly"=>"readonly", 
									"style"=>"border:0");
		$col["hidden"] = true;
		$cols[] = $col; 
		
		$col = array();
		$col["name"] = "created_at";
		$col["hidden"] = true;
		$col["hidedlg"] = true;
		$cols[] = $col;
	
		$col = array();
		$col["name"] = "created_by";
		$col["hidden"] = true;
		$col["hidedlg"] = true;
		$cols[] = $col;
	
		$col = array();
		$col["name"] = "updated_at";
		$col["hidden"] = true;
		$col["hidedlg"] = true;
		$cols[] = $col;
	
		$col = array();
		$col["name"] = "updated_by";
		$col["hidden"] = true;
		$col["hidedlg"] = true;
		$cols[] = $col;

		return $cols;

	}
   
	public static function loggingCollMaster() {

		$col = array();
		$col["name"] = "id";
		$col["hidden"] = true;
		$col["hidedlg"] = true;
		$cols[] = $col;				
		
		$col = array();
		$col["name"] = "created_at";
		$col["hidden"] = true;
		$col["hidedlg"] = true;
		$cols[] = $col;
	
		$col = array();
		$col["name"] = "created_by";
		$col["hidden"] = true;
		$col["hidedlg"] = true;
		$cols[] = $col;
	
		$col = array();
		$col["name"] = "updated_at";
		$col["hidden"] = true;
		$col["hidedlg"] = true;
		$cols[] = $col;
	
		$col = array();
		$col["name"] = "updated_by";
		$col["hidden"] = true;
		$col["hidedlg"] = true;
		$cols[] = $col;

		return $cols;

	}

}