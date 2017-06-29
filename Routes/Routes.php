<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use Controllers\MainController as MC;
$app->get('/', function (Request $req, Response $res)
{
  $f = MC::getMain();
  return $res->withJson($f);
});
