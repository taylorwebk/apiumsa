<?php
namespace Models;
use Illuminate\Database\Eloquent\Model  as Model;
class Facultad extends Model
{
  protected $guarded = array();
  protected $table = 'facultad';
  public $timestamps = false;

  public function dirprefa()
  {
    return $this->hasOne('Models\Dirprefa');
  }
  public function carreras()
  {
    return $this->hasMany('Models\Carrera');
  }
  public function correos()
  {
    return $this->belongsToMany('Models\Correo');
  }
  public function telefonos()
  {
    return $this->belongsToMany('Models\Telefono');
  }
  public function websites()
  {
    return $this->belongsToMany('Models\Website');
  }

}
