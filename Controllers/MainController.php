<?php
namespace Controllers;
use Models\Facultad as Facu;
use Models\R as R;
class MainController
{

  public static function getMain()
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
    $facultades = $facultades->toArray();
    $respuesta = array_map(function ($facu)
    {
      return [
        'id' => $facu['id'],
        'nombre' => $facu['nombre'],
        'mision' => $facu['mision'],
        'vision' => $facu['vision'],
        'Dirprefa' => self::handleDirprefa($facu['dirprefa']),
        'Carreras' => self::handleCarreras($facu['carreras'])
      ];
    }, $facultades);
    // var_dump($facultades);
    return R::successF($respuesta);
  }
  private static function handleCarreras($carreras) {
    return array_map(function ($carrera)
    {
      return [
        'id' => $carrera['id'],
        'nombre' => $carrera['nombre'],
        'mision' => $carrera['mision'],
        'vision' => $carrera['vision'],
        'urlimg' => IP.'/apiumsa'.$carrera['urlImg'],
        'Ubicacion' => ['des' => $carrera['ubicacion']['des'],
                        'lat' => $carrera['ubicacion']['lat'],
                        'lon' => $carrera['ubicacion']['lon']],
        'Websites' => array_map(function ($website) {
                        return [
                          'url' => $website['url'],
                          'des' => $website['des']
                        ];
                      }, $carrera['websites']),
        'Correos' => array_map(function ($correo) {
                        return [
                          'correo' => $correo['correo'],
                          'des' => $correo['des']
                        ];
                      }, $carrera['correos']),
        'Telefonos' => array_map(function ($telefono) {
                        return [
                          'nro' => $telefono['nro'],
                          'des' => $telefono['des']
                        ];
                      }, $carrera['telefonos'])
      ];
    }, $carreras);
  }
  private static function handleDirprefa($dirprefa) {
    return [
      'id' => $dirprefa['id'],
      'nombre' => $dirprefa['nombre'],
      'urlimg' => IP.'/apiumsa'.$dirprefa['urlImg'],
      'Ubicacion' => ['des' => $dirprefa['ubicacion']['des'],
                      'lat' => $dirprefa['ubicacion']['lat'],
                      'lon' => $dirprefa['ubicacion']['lon']],
      'Websites' => array_map(function ($website) {
                      return [
                        'url' => $website['url'],
                        'des' => $website['des']
                      ];
                    }, $dirprefa['websites']),
      'Correos' => array_map(function ($correo) {
                      return [
                        'correo' => $correo['correo'],
                        'des' => $correo['des']
                      ];
                    }, $dirprefa['correos']),
      'Telefonos' => array_map(function ($telefono) {
                      return [
                        'nro' => $telefono['nro'],
                        'des' => $telefono['des']
                      ];
                    }, $dirprefa['telefonos'])
    ];
  }
}
