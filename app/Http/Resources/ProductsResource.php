<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductsResource extends JsonResource
{
    public $status;
    public $msg;


    public function __construct($status, $msg, $resource) {
        parent::__construct($resource);
        $this->status = $status;
        $this->msg = $msg;
    }     

    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'status' => $this->status,
            'message' => $this->msg,
            'data' => [                             
                'id'    => $this->resource->id,
                'project_code'  => $this->resource->project_code,
                'product_name'  => $this->resource->product_name,
                'supplier_id'   => $this->resource->supplier_id,
                'supplier'      => $this->resource->supplier->company_name,
                'category_id'   => $this->resource->category_id,
                'category'   => $this->resource->category->category_name,
                'quantity_per_unit'  => $this->resource->quantity_per_unit,
                'unit_price'  => $this->resource->unit_price,
                'units_in_stock'  => $this->resource->units_in_stock,
                'units_on_order'  => $this->resource->units_on_order,
                'reorder_level'  => $this->resource->reorder_level,
                'discontinued'  => $this->resource->discontinued,
                'img_path'  => $this->resource->img_path 
                ]
        ];
    }
}
