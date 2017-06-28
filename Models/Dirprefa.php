<?php
namespace Models;
use Illuminate\Database\Eloquent\Model  as Model;
class Dirprefa extends Model
{
  protected $guarded = array();
  protected $table = 'dirprefa';
  public $timestamps = false;

  public function facultad()
  {
    return $this->belongsTo('Models\Facultad');
  }
  public function ubicacion()
  {
    return $this->belongsTo('Models\Ubicacion');
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
