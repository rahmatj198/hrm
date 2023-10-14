<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\myLib\Helper;

class DashboardController extends Controller
{
    public function index() {
         
        $order_by_employee = DB::table('v_order_summary_by_employee')->where('project_code', config('app.project_code'))->get();
        $order_by_shipper = DB::table('v_order_summary_by_shipper')->where('project_code', config('app.project_code'))->get();
        $order_by_country = DB::table('v_order_summary_by_country')->where('project_code', config('app.project_code'))->get();

		//Chart Order by Employee        
        foreach ($order_by_employee as $anEmp)
		{			
			$emps_labels[] = $anEmp->last_name;

			$created[] = $anEmp->Created;
			$progress[] = $anEmp->Progress;
			$completed[] = $anEmp->Completed;
			$cancelled[] = $anEmp->Cancelled;
		}	
		$datasets_obe[] = array('label' => 'Created',
							    'backgroundColor'=> '#3149CE', //biru
							    'data'=>$created);

		$datasets_obe[] = array('label' => 'Progress',
								'backgroundColor'=> '#E1EA42', //kuning
								'data'=>$progress);							  

		$datasets_obe[] = array('label' => 'Completed',
								'backgroundColor'=> '#09BD30', //hijau
								'data'=>$completed);

		$datasets_obe[] = array('label' => 'Cancelled',
								'backgroundColor'=> '#C81D1D', //merah
								'data'=>$cancelled);								

		$bar_orderby_emp = array('labels' => $emps_labels,
								 'datasets' => $datasets_obe);


		//Chart Order by Shipper
        foreach ($order_by_shipper as $aShipper)
		{	
			$shipper_labels[] = $aShipper->company_name;
			$progress_order[] = $aShipper->Progress;
		}	

		$datasets_shipper[] = array('data'=>$progress_order,
									'backgroundColor'=>["#F7464A","#4D5360","#FDB45C"]);
		$pie_orderby_shipper = array('labels' => $shipper_labels,
									 'datasets' => $datasets_shipper);
        
		//Chart Order by Country
        foreach ($order_by_country as $aCountry)
		{	
			$country_labels[] = $aCountry->ship_country;

			$created2[] = $aCountry->Created;
			$progress2[] = $aCountry->Progress;
			$completed2[] = $aCountry->Completed;
			$cancelled2[] = $aCountry->Cancelled;

		}	
		$datasets_obc[] = array('label' => 'Created',
							    'borderColor'=> '#3149CE', //biru
							    'data'=>$created2);

		$datasets_obc[] = array('label' => 'Progress',
								'borderColor'=> '#E1EA42', //kuning
								'data'=>$progress2);							  

		$datasets_obc[] = array('label' => 'Completed',
								'borderColor'=> '#09BD30', //hijau
								'data'=>$completed2);

		$datasets_obc[] = array('label' => 'Cancelled',
								'borderColor'=> '#C81D1D', //merah
								'data'=>$cancelled2);								

		$line_orderby_country = array('labels' => $country_labels,
								 'datasets' => $datasets_obc);


		$navs = Helper::getMenu(0);
        return view('dashboard', [
            "title" => "Dashboard",
			"navs" => $navs,
            "out_orderby_emp" => json_encode($bar_orderby_emp),
            "out_orderby_shipper" => json_encode($pie_orderby_shipper),
            "out_orderby_country" => json_encode($line_orderby_country)
        ]);

    }


	
	public function chart4php() {

		//Chart4php
		include_once("chart4php\inc\chartphp_dist.php");
          
        $order_by_employee = DB::table('v_order_summary_by_employee')->where('project_code', config('app.project_code'))->get();
        $order_by_shipper = DB::table('v_order_summary_by_shipper')->where('project_code', config('app.project_code'))->get();
        $order_by_country = DB::table('v_order_summary_by_country')->where('project_code', config('app.project_code'))->get();

		//Chart Order by Employee        
        foreach ($order_by_employee as $anEmp)
		{			
			$created[] = array($anEmp->last_name, $anEmp->Created);
			$progress[] = array($anEmp->last_name, $anEmp->Progress);
			$completed[] = array($anEmp->last_name, $anEmp->Completed);
			$cancelled[] = array($anEmp->last_name, $anEmp->Cancelled);
		}	
		$bar_orderby_emp = array($created, $progress, $completed, $cancelled);

        /*
		$p = new \chartphp();
		$p->data = $bar_orderby_emp;
		$p->chart_type = "bar-stacked";
		$p->legend = true;
		$p->height = "300px";
		$p->xlabel = "Employee";
		$p->ylabel = "Order";
		$p->export = false;

		//label pada barchart
		$p->color = array('#09a49f','#d2ac11','#0aab01','#bb0400'); 
		$p->series_label = array('Created','Progress','Completed', 'Cancelled');

		$out_orderby_emp = $p->render('chart_orderby_emp');
		$data['out_orderby_emp'] = $out_orderby_emp;
        */

		//Chart Order by Shipper
        foreach ($order_by_shipper as $aShipper)
		{	
            $created1[] = array($aShipper->company_name, $aShipper->Created);
			$progress1[] = array($aShipper->company_name, $aShipper->Progress);
			$completed1[] = array($aShipper->company_name, $aShipper->Completed);
			$cancelled1[] = array($aShipper->company_name, $aShipper->Cancelled);
		}	
		$bar_orderby_shipper = array($created1, $progress1, $completed1, $cancelled1); 
        
        /*
		$p = new \chartphp();
		$p->data = $bar_orderby_shipper;
		$p->chart_type = "bar-grouped";
		$p->legend = false;
		$p->height = "300px";
		$p->color = array('#09a49f','#d2ac11','#0aab01','#bb0400'); 
		$p->series_label = array('Created','Progress','Completed', 'Cancelled');

		$out_orderby_shipper = $p->render('chart_orderby_shipper');
		$data['out_orderby_shipper'] = $out_orderby_shipper;
        */
		//Chart Order by Country
        foreach ($order_by_country as $aCountry)
		{	
            $created2[] = array($aCountry->ship_country, $aCountry->Created);
			$progress2[] = array($aCountry->ship_country, $aCountry->Progress);
			$completed2[] = array($aCountry->ship_country, $aCountry->Completed);
			$cancelled2[] = array($aCountry->ship_country, $aCountry->Cancelled);
		}	
		$line_orderby_country = array($created2, $progress2, $completed2, $cancelled2); 

        /*
		$p = new \chartphp();
		$p->data = $line_orderby_country;

		$p->chart_type = "line";
		$p->legend = true;
		$p->height = "300px";
		$p->xlabel = "Country";
		$p->ylabel = "Order";		
		$p->color = array('#09a49f','#d2ac11','#0aab01','#bb0400'); 
		$p->series_label = array('Created','Progress','Completed', 'Cancelled');

		$out_orderby_country = $p->render('chart_orderby_country');
		$data['out_orderby_country'] = $out_orderby_country;        
        */

		$navs = Helper::getMenu(0);
        return view('dashboard', [
            "title" => "Dashboard",
			"navs" => $navs,
            "out_orderby_emp" => json_encode($bar_orderby_emp),
            "out_orderby_shipper" => json_encode($bar_orderby_shipper),
            "out_orderby_country" => json_encode($line_orderby_country)
        ]);

    }	

}
