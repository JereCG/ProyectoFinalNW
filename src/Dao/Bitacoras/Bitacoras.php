<?php
  
namespace Dao\Bitacoras; 

class Bitacoras extends \Dao\Table{
    
  private $bitacoracod;
  private $bitacorafch;
  private $bitprograma;
  private $bitdescripcion;
  private $bitobservacion;
  private $bitTipo;
  private $bitusuario;

 
  public static function getBitacora(){
	 $sqlstr= "SELECT * FROM bitacora";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}

  public static function createBitacora( $bitacorafch, $bitprograma, $bitdescripcion, $bitobservacion, $bitTipo, $bitusuario){
	
    $sqlstr = "INSERT INTO bitacora ( bitacorafch, bitprograma, bitdescripcion, bitobservacion, bitTipo, bitusuario) VALUES ( :bitacorafch , :bitprograma , :bitdescripcion , :bitobservacion , :bitTipo , :bitusuario)";
    $params = ['bitacorafch' => $bitacorafch, 'bitprograma' => $bitprograma, 'bitdescripcion' => $bitdescripcion, 'bitobservacion' => $bitobservacion, 'bitTipo' => $bitTipo, 'bitusuario' => $bitusuario];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updateBitacora($bitacoracod, $bitacorafch, $bitprograma, $bitdescripcion, $bitobservacion, $bitTipo, $bitusuario){
	
        $sqlstr = "UPDATE bitacora SET  bitacorafch = :bitacorafch, bitprograma = :bitprograma, bitdescripcion = :bitdescripcion, bitobservacion = :bitobservacion, bitTipo = :bitTipo, bitusuario = :bitusuario WHERE bitacoracod = :bitacoracod";
        $params = ['bitacoracod' => $bitacoracod, 'bitacorafch' => $bitacorafch, 'bitprograma' => $bitprograma, 'bitdescripcion' => $bitdescripcion, 'bitobservacion' => $bitobservacion, 'bitTipo' => $bitTipo, 'bitusuario' => $bitusuario];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

public static function readAllBitacoras($filter = '')
{
        $sqlstr = "SELECT * from bitacora where bitdescripcion like :filter;";
        $params = array('filter' => '%' . $filter . '%');
        return self::obtenerRegistros($sqlstr, $params);    
}

 public static function readBitacora($id){
	 $sqlstr= "SELECT * FROM bitacora WHERE bitacoracod = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deleteBitacora($id){
	$sqlstr= "DELETE  FROM bitacora WHERE bitacoracod = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}