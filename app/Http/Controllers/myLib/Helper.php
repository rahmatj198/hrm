<?php

namespace App\Http\Controllers\myLib;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class Helper {
      
    public const myVar = 'myVar content';

    public static function test() {
        return "Static Function Menu : " . self::myVar;
    }

    public static function storeMenuToCache() {
        $menus = DB::table('menus')->where('enabled','Y')
                                  ->get();
        /*
        echo "<pre>";
        print_r($menus);
        echo "</pre>";
        die(0);
        foreach ($menus as $aMenu)  {
        
        }*/

    }

    public static function getMenu($parent=0) {

        $menus = DB::table('menus')->where('parent', $parent)
                                  ->where('enabled','Y')
                                  ->get();
        $cur_url = url()->current();
        $active_menu = '';      
        $str = '';

        foreach ($menus as $aMenu)  {
            $user_role = auth()->user()->role_id;
            $roles = explode(",", $aMenu->role_allowed);
            $murl = url('/') . '/' . $aMenu->url;

            if (in_array($user_role, $roles )) {
                $active_menu = strpos($cur_url, $aMenu->url)?'active':'';                
                switch ($aMenu->type) {
                    case "kategori":
                        $str .= "<li><a href=\"#\"><i class=\"" . $aMenu->icon . "\"></i> <span class=\"menu-item-parent\">" . $aMenu->nama . "</span></a>";
                        break;         
                    case "newpage":
                        $str .= "<li class=\"$active_menu\"><a href=\"$murl\" target=\"_blank\" \"><i class=\"" . $aMenu->icon . " \"></i>" . $aMenu->nama . "</a>";
                        break;
                    case "table":
                        $str .= "<li class=\"$active_menu\"><a href=\"$murl/$aMenu->id\"><i class=\"" . $aMenu->icon . " \"></i>" . $aMenu->nama . "</a>";
                        break; 
                    case "masterdetail":
                        $str .= "<li class=\"$active_menu\"><a href=\"$murl/$aMenu->id\"><i class=\"" . $aMenu->icon . " \"></i>" . $aMenu->nama . "</a>";
                        break;                                                                  
                    default:
                        $str .= "<li class=\"$active_menu\"><a href=\"$murl\"><i class=\"" . $aMenu->icon . "\"></i>" . $aMenu->nama . "</a>";
                }            
            } 

            //recursive call for retrieving all submenus
            $subchild = self::getMenu($aMenu->id);
            if($subchild != '')
                $str .= "<ul>".$subchild."</ul>"; 

            $str .= "</li>"; 
        }
              
        return $str;
    }

    public static function gridDefaultOption() {
        $opt = array();

        $opt["caption"] = "";
        $opt["multiselect"] = true;
        $opt["multiselectWidth"] = "5";
        //$opt["hoverrows"] = false;    //on mouse over on grid
        $opt["shrinkToFit"] = false;   //activate horizontal bar
        $opt["autowidth"] = false;
        $opt["altRows"] = true;
        $opt["scroll"] = true;      //autoload when scrolling down
        //$opt["toolbar"] = "bottom";

        return $opt;

    }

    public static function gridDefaultAction($mid)
    {
        $user_role = auth()->user()->role_id;
        $user_tab = DB::table('users_tabs')->where('menu_id', $mid)
                                           ->where('role_id',$user_role)
                                           ->first(); 
        $privileges = $user_tab ? $user_tab->privileges : "";                                                                      
        $priv_list = explode(',' , $privileges);
    
        $act["add"] = in_array("C",$priv_list)?TRUE:FALSE;
        $act["edit"] = in_array("U",$priv_list)?TRUE:FALSE;
        $act["delete"] = in_array("D",$priv_list)?TRUE:FALSE;
        $act["view"] = TRUE;
        $act["search"] = TRUE;
        $act["showhidecolumns"] = in_array("SH",$priv_list)?TRUE:FALSE;
        $act["bulkedit"] = in_array("B",$priv_list)?TRUE:FALSE;
        $act["export_excel"] = in_array("X",$priv_list)?TRUE:FALSE;
        //$act["export"] = in_array("X",$priv_list)?TRUE:FALSE;
    
        $act['rowactions'] = TRUE;
    
        return $act;
    
    }
    
    public static function gridImportOption(){    
  
        $opt["shrinkToFit"] = false;
        $opt["caption"] = "";
        $opt["import"]["allowreplace"] = true;
        $opt["import"]["hidefields"] = array("id","project_code");
        $opt["toolbar"] = "top";
        $opt["rowNum"] = 20;       
        $opt["viewrecords"] = TRUE;  //number of records displayed on grid
        $opt["scroll"] = true;   //autoload when scroll down
        
        return $opt;
    }

    public static function gridImportAction(){  

        $act["add"] = FALSE;
        $act["edit"] = FALSE;
        $act["delete"] = FALSE;
        //$act["view"] = FALSE;
        //$act["search"] = FALSE;
        $act["refresh"] = FALSE;
        $act['rowactions'] = FALSE;
        $act['import'] = TRUE;

        return $act;
    }

    public static function getDropdown($tab, $k, $v)
    {
        $prjcode = config('app.project_code');
        $ddsource = DB::table($tab)->where('project_code', $prjcode)->get();   

        $ddlist = "";
        foreach ($ddsource as $row)  
            $ddlist .= "<option value=\"" . $row->$k . "\">" .$row->$v. "</option>";

        return $ddlist;
    }
}