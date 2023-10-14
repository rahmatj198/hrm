<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\TasksController;
use App\Http\Controllers\Api\CategoriesController;
use App\Http\Controllers\Api\CustomersController;
use App\Http\Controllers\Api\OrdersController;
use App\Http\Controllers\Api\ProductsController;
use App\Http\Controllers\Api\SuppliersController;


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Public routes
Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);
//Route::post('/logout', [AuthController::class, 'logout']);
//Route::resource('/tasks', TasksController::class);

// Protected routes
Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::resource('/tasks', TasksController::class);
});

Route::apiResource('/customers', CustomersController::class);
Route::apiResource('/orders', OrdersController::class);
Route::apiResource('/products', ProductsController::class);
Route::apiResource('/categories', CategoriesController::class);
Route::apiResource('/suppliers', SuppliersController::class);

//manual route
Route::get('/category',[CategoryController::class, 'get']);
Route::get('/category/{id}',[CategoryController::class, 'getById']);
Route::post('/category',[CategoryController::class, 'post']);
Route::put('/category/{id}',[CategoryController::class, 'put']);
Route::delete('/category/{id}',[CategoryController::class, 'delete']);

