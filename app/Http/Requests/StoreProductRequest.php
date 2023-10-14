<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreProductRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'product_name' => ['required', 'max:255','unique:mst_products,product_name'],
            'supplier_id' => ['required','numeric'],
            'category_id' => ['required','numeric'],
            'unit_price' => ['required','numeric'],
            'img_path' => ['required']
        ];
    }
}
