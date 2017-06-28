<?php
namespace Models;
use Illuminate\Database\Eloquent\Model  as Model;
class Ubicacion extends Model
{
  protected $guarded = array();
  protected $table = 'ubicacion';
  public $timestamps = false;

  public function carrera()
  {
    return $this->hasOne('Models\Carrera');
  }
  public function dirprefa()
  {
    return $this->hasOne('Models\Dirprefa');
  }

}
