<?php
namespace Models;
use Illuminate\Database\Eloquent\Model  as Model;
class Correo extends Model
{
  protected $guarded = array();
  protected $table = 'correo';
  public $timestamps = false;

  public function carrera()
  {
    return $this->belongsToMany('Models\Carrera');
  }
  public function facultad()
  {
    return $this->belongsToMany('Models\Facultad');
  }
  public function dirprefa()
  {
    return $this->belongsToMany('Models\Dirprefa');
  }

}
