<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Customer;
use App\Models\Employee;
use App\Models\Order;
use App\Models\Menu;
use App\Http\Controllers\myLib\Helper;

class ReportController extends Controller
{
    public function index() {

        $navs = Helper::getMenu(0);
        return view('report.v_order_detail', [
            "title" => "Order Detail",
            "navs" => $navs,
            "breadcrumb" => "<li>Report</li><li>Order Detail</li>", 
            "widget_icon" => "fa fa-file-pdf-o",           
            "widget_title" => "Order Detail",
            "widget_content" => "Qbuilder Order Detail "
        ]);

    }

    public function order_detail() {

        $navs = Helper::getMenu(0);
        return view('report.v_order_detail', [
            "title" => "Order Detail",
            "navs" => $navs,
            "breadcrumb" => "<li>Report</li><li>Order Detail</li>", 
            "widget_icon" => "fa fa-file-pdf-o",           
            "widget_title" => "Order Detail",
            "widget_content" => "Qbuilder Order Detail "
        ]);

    } 
    
    public function order_summary() {

        $navs = Helper::getMenu(0);
        return view('report.v_order_summary', [
            "title" => "Order Summary",
            "navs" => $navs,
            "breadcrumb" => "<li>Report</li><li>Order Summary</li>", 
            "widget_icon" => "fa fa-file-pdf-o",           
            "widget_title" => "Order Summary",
            "widget_content" => "Qbuilder Order Summary "
        ]);

    }       

	public function get_keyval($tab, $did, $desc)
	{

        $retVal = array();
        if ($tab == 'orders') {
            //Order::all();
            $orders = Order::where('project_code', 'P001')->get();      
            foreach ($orders as $anOrder)
                $retVal[] = array("key"=>$anOrder->id, 
                                  "value"=>$anOrder->id . 
                                            ' ' . $anOrder->customer_id .
                                            ' ' . $anOrder->status);              
        }

        else if ($tab == 'customers')  {
            $customers = Customer::where('project_code', 'P001')->get();      
            foreach ($customers as $aCustomer)
                $retVal[] = array("key"=>$aCustomer->id, 
                                  "value"=>$aCustomer->contact_name . ' ' . $aCustomer->country);

        }
        
        else {
            $employees = Employee::where('project_code', 'P001')->get();      
            foreach ($employees as $anEmp)
                $retVal[] = array("key"=>$anEmp->id, 
                                  "value"=>$anEmp->last_name . ' ' . $anEmp->country);                    
        }        

    	return json_encode($retVal);
	} 
    
    public function stimulsoft($rid = 1, $cond) {

        //require_once asset('/') . 'report/stimulsoft/helper.php';
        require_once('stimulsoft\helper.php');

        $repd = Menu::find($rid);
        $report_name = $repd->report_name ? $repd->report_name : "";
        $condition = $cond ? $cond : "1";
        $img1 = config('app.logo1');
        $img2 = config('app.logo2');


        return view('report.stimulsoft_report', [
            "title" => "Report Template",
            "report_name" => $report_name,           
            "condition" => $condition,
            "img1" => $img1,
            "img2" => $img2
        ]);

    }       

}
