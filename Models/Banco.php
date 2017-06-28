<?php
namespace Models;
use Illuminate\Database\Eloquent\Model  as Model;
class Banco extends Model
{
  protected $guarded = array();
  protected $table = 'banco';
  public $timestamps = false;

}
