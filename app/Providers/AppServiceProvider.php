<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Models\User;
use App\Models\Role;
use Illuminate\Support\Facades\Gate;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //error_reporting(E_ALL & ~E_NOTICE);
        
        /*
        Gate::define('gate_admin', function(User $user) {
            return $user->role_id == Role::IS_ADMIN;
        }); 
        */

        Gate::define('gate_admin', fn(User $user) => $user->role_id == Role::IS_ADMIN );       
        Gate::define('gate_entrydata', fn(User $user) => in_array($user->role_id, Role::IS_ENTRYDATA ));
    
    }
}
