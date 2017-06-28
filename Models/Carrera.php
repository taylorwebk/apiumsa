<?php
namespace Models;
use Illuminate\Database\Eloquent\Model  as Model;
class Carrera extends Model
{
  protected $guarded = array();
  protected $table = 'carrera';
  public $timestamps = false;

  public function facultad()
  {
    return $this->belongsTo('Models\Facultad');
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
  public function ubicacion()
  {
    return $this->belongsTo('Models\Ubicacion');
  }

}
