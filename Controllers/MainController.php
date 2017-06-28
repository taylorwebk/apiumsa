<?php
namespace Controllers;
use Models\Facultad as Facu;
class MainController
{

  public static function a()
  {
    $facultades = Facu::with([
      'dirprefa.ubicacion',
      'dirprefa.websites',
      'dirprefa.correos',
      'dirprefa.telefonos',
      'carreras.ubicacion',
      'carreras.websites',
      'carreras.correos',
      'carreras.telefonos'
    ])->get();
    return $facultades;
  }
}
