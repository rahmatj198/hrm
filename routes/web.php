<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SampleController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\AdmController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\MasterController;
use App\Http\Controllers\ImportController;
use App\Http\Controllers\TransactionController;


Route::get('/', function () {
    return view('login',[
        'title' => 'MyApp - Login']);
});

/*
Route::get('/sample', function () {
    return view('layout.sample');
}); */
/*
Route::get('/login', function () {
    return view('login');
}); */

Route::get('/sample', [SampleController::class, 'testpage']);
Route::get('/sample_grid', [SampleController::class, 'index'])->middleware('auth');
Route::post('/sample_grid', [SampleController::class, 'index'])->middleware('auth');

Route::get('/login', [LoginController::class, 'index'])->name('login')->middleware('guest');
Route::post('/login', [LoginController::class, 'authenticate']);

Route::group(['middleware' => ['auth']], function (){
    Route::get('/logout', [LoginController::class, 'logout']);
    Route::get('/dashboard', [DashboardController::class, 'index']);

    Route::get('/order_detail', [ReportController::class, 'order_detail']);
    Route::get('/order_summary', [ReportController::class, 'order_summary']);
    Route::get('/sti_report/{id}/{rcond}', [ReportController::class, 'stimulsoft']);

    Route::get('/customer/{mid}', [MasterController::class, 'customer']);
    Route::post('/customer/{mid}', [MasterController::class, 'customer']);

    Route::get('/product/{mid}', [MasterController::class, 'product']);
    Route::post('/product/{mid}', [MasterController::class, 'product']);

    Route::get('/md_orders/{mid}', [TransactionController::class, 'md_orders']);
    Route::post('/md_orders/{mid}', [TransactionController::class, 'md_orders']);
    Route::get('/sv_orders/{mid}', [TransactionController::class, 'sv_orders']);
    Route::post('/sv_orders/{mid}', [TransactionController::class, 'sv_orders']);

    Route::get('/import', [ImportController::class, 'master']);
    Route::get('/import_cust', [ImportController::class, 'customer']);
    Route::post('/import_cust', [ImportController::class, 'customer']);
    Route::get('/import_prod', [ImportController::class, 'product']);
    Route::post('/import_prod', [ImportController::class, 'product']);    

});

Route::group(['middleware' => ['is_admin']], function () {
    Route::get('/appuser/{mid}', [AdmController::class, 'appuser']);
    Route::post('/appuser/{mid}', [AdmController::class, 'appuser']);

    Route::get('/appmenu/{mid}', [AdmController::class, 'appmenu']);
    Route::post('/appmenu/{mid}', [AdmController::class, 'appmenu']);

    Route::get('/applevel/{mid}', [AdmController::class, 'applevel']);
    Route::post('/applevel/{mid}', [AdmController::class, 'applevel']);

    Route::get('/appusrtab/{mid}', [AdmController::class, 'appusrtab']);
    Route::post('/appusrtab/{mid}', [AdmController::class, 'appusrtab']);
});

//drop down data in qbuilder
Route::get('/get_keyval/{tab}/{did}/{desc}', [ReportController::class, 'get_keyval']);

/*
Route::get('/appuser', [AdmController::class, 'appuser'])->middleware('is_admin');
Route::get('/appmenu', [AdmController::class, 'appmenu'])->middleware('is_admin');
Route::get('/applevel', [AdmController::class, 'applevel'])->middleware('is_admin');
Route::get('/appuser_table', [AdmController::class, 'appuser_table'])->middleware('is_admin'); */

