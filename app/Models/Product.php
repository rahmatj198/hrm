<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'mst_products';  

    protected $fillable = ['project_code','product_name','supplier_id','category_id','quantity_per_unit',
    'unit_price','units_in_stock','units_on_order','reorder_level','discontinued','img_path',
    'import_fname','created_by','updated_by'];

    protected $hidden = ['created_at','created_by','updated_at','updated_by','import_fname'];


    public function supplier()
    {
        return $this->belongsTo(Supplier::class,'supplier_id','id');
    }  

    public function category()
    {
        return $this->belongsTo(Category::class,'category_id','id');
    }
      
}
