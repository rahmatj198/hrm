<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'mst_categories';

    protected $fillable = ['project_code','category_name','description','created_by','updated_by'];

    protected $hidden = ['created_at','created_by','updated_at','updated_by','import_fname'];
}
