<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory;

    protected $table = 'roles'; 
    protected $fillable = ['name'];

    public const IS_ADMIN = 1;
    public const IS_USER = 2;
    public const IS_MANAGER = 3;
    public const IS_ENTRYDATA = [1,2];
}
