<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'mst_customers';


    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';  

    protected $fillable = ['project_code','company_name','contact_name','contact_title','address',
                    'city','region','postal_code','country','phone','fax','import_fname',
                    'created_by','updated_by'];


    protected $hidden = ['created_at','created_by','updated_at','updated_by','import_fname'];
    
    

    /**
     * Indicates if the model's ID is auto-incrementing.
     *
     * @var bool
     */
    public $incrementing = false;    

}
