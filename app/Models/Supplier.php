<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'mst_suppliers';  

    protected $fillable = ['project_code','company_name','contact_name','contact_title','address',
                        'city','region','postal_code','country','phone','fax','homepage',
                        'created_by','updated_by'];

    protected $hidden = ['created_at','created_by','updated_at','updated_by'];    
}
