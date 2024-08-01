<?php

namespace Controllers\Bitacoras;

use \Dao\Bitacoras\Bitacoras as DaoBitacoras;
use \Utilities\Validators as Validators;
use \Utilities\Site as Site;

class Bitacora extends \Controllers\PublicController
{
    private $mode = "NAN";
    private $modeDscArr = [
        "INS" => "Nueva Bitacora",
        "UPD" => "Actualizando Bitacora %s",
        "DSP" => "Detalle de %s",
        "DEL" => "Eliminando %s"
    ];
    private $modeDsc = "";

    private $bitacoracod = 0;
    private $bitacorafch = "";
    private $bitprograma = "";
    private $bitdescripcion = "";
    private $bitobservacion = "";
    private $bitTipo = "";
    private $bitusuario = "";

    private $errors = array();

    public function run(): void
    {
        $this->obtenerDatosDelGet();
        $this->getDatosFromDB();
        if ($this->isPostBack()) {
            $this->obtenerDatosDePost();
            if (count($this->errors) === 0) {
                $this->procesarAccion();
            }
        }
        $this->showView();
    }

    private function obtenerDatosDelGet()
    {
        if (isset($_GET["mode"])) {
            $this->mode = $_GET["mode"];
        }
        if (!isset($this->modeDscArr[$this->mode])) {
            throw new \Exception("Modo no válido");
        }
        if (isset($_GET["bitacoracod"])) {
            $this->bitacoracod = intval($_GET["bitacoracod"]);
        }
        if ($this->mode != "INS" && $this->bitacoracod <= 0) {
            throw new \Exception("ID no válido");
        }
    }
    

    private function getDatosFromDB()
    {
        if (($this->bitacoracod >0)) {
            $bitacora = DaoBitacoras::readBitacora($this->bitacoracod);
            if (!$bitacora) {
                throw new \Exception("Bitacora no encontrada");
            }
            $this->bitacorafch = $bitacora["bitacorafch"];
            $this->bitprograma = $bitacora["bitprograma"];
            $this->bitdescripcion = $bitacora["bitdescripcion"];
            $this->bitobservacion = $bitacora["bitobservacion"];
            $this->bitTipo = $bitacora["bitTipo"];
            $this->bitusuario = $bitacora["bitusuario"];
        }
    }

    private function obtenerDatosDePost()
    {
        $tmpbitacorafch = $_POST["bitacorafch"] ?? "";
        $tmpbitprograma = $_POST["bitprograma"] ?? "";
        $tmpbitdescripcion = $_POST["bitdescripcion"] ?? "";
        $tmpbitobservacion = $_POST["bitobservacion"] ?? "";
        $tmpbitTipo = $_POST["bitTipo"] ?? "";
        $tmpbitusuario = $_POST["bitusuario"] ?? 0;

        $tmpMode = $_POST["mode"] ?? "";

        if (Validators::IsEmpty($tmpbitacorafch)) {
            $this->addError("bitacorafch", "La Fecha no puede estar vacia", "error");
        }
        $this->bitacorafch = $tmpbitacorafch;

        if (Validators::IsEmpty($tmpbitprograma)) {
            $this->addError("bitprograma", "El Programa no puede estar vacio", "error");
        }
        $this->bitprograma = $tmpbitprograma;

        if (Validators::IsEmpty($tmpbitdescripcion)) {
            $this->addError("bitdescripcion", "La Descripcion no puede estar vacia", "error");
        }
        $this->bitdescripcion = $tmpbitdescripcion;

        if (Validators::IsEmpty($tmpbitobservacion)) {
            $this->addError("bitobservacion", "La Observación no puede estar vacio", "error");
        }
        $this->bitobservacion = $tmpbitobservacion;

        if (Validators::IsEmpty($tmpbitTipo)) {
            $this->addError("bitTipo", "El Tipo no puede estar vacio", "error");
        }
        $this->bitTipo = $tmpbitTipo;

        if ($tmpbitusuario <= 0) {
            $this->addError("bitusuario", "El Usuario no puede estar vacio", "error");
        }
        $this->bitusuario = $tmpbitusuario;

        if (Validators::IsEmpty($tmpMode) || !in_array($tmpMode, ["INS", "UPD", "DEL"])) {
            $this->throwError("Ocurrio un error al procesar la solicitud.");
        }
    }

    private function procesarAccion()
    {
        switch ($this->mode) {
            case "INS":
                $insResult = DaoBitacoras::createBitacora(
                    $this->bitacorafch,
                    $this->bitprograma,
                    $this->bitdescripcion,
                    $this->bitobservacion,
                    $this->bitTipo,
                    $this->bitusuario
                );
                $this->validateDBOperation(
                    "Bitacora insertada correctamente",
                    "Ocurrio un error al insertar la bitacora",
                    $insResult
                );
                break;
            case "UPD":
                $updResult = DaoBitacoras::updateBitacora(
                    $this->bitacoracod,
                    $this->bitacorafch,
                    $this->bitprograma,
                    $this->bitdescripcion,
                    $this->bitobservacion,
                    $this->bitTipo,
                    $this->bitusuario
                );
                $this->validateDBOperation(
                    "Bitacora actualizada correctamente",
                    "Ocurrio un error al actualizar la bitacora",
                    $updResult
                );
                break;
            case "DEL":
                $delResult = DaoBitacoras::deleteBitacora($this->bitacoracod);
                $this->validateDBOperation(
                    "Bitacora eliminada correctamente",
                    "Ocurrio un error al eliminar la bitacora",
                    $delResult
                );
                break;
        }
    }

    private function validateDBOperation($msg, $error, $result)
    {
        if (!$result) {
            $this->errors["error_general"] = $error;
        } else {
            Site::redirectToWithMsg(
                "index.php?page=Bitacoras-Bitacoras",
                $msg
            );
        }
    }

    private function throwError($msg)
    {
        Site::redirectToWithMsg(
            "index.php?page=Bitacoras-Bitacoras",
            $msg
        );
    }

    private function addError($key, $msg, $context = "general")
    {
        if (!isset($this->errors[$context . "_" . $key])) {
            $this->errors[$context . "_" . $key] = [];
        }
        $this->errors[$context . "_" . $key][] = $msg;
    }

    private function showView()
    {
        $viewData = array();
        $viewData["mode"] = $this->mode;
        $viewData["modeDsc"] = sprintf($this->modeDscArr[$this->mode], $this->bitdescripcion);
        $viewData["bitacoracod"] = $this->bitacoracod;
        $viewData["bitacorafch"] = $this->bitacorafch;
        $viewData["bitprograma"] = $this->bitprograma;
        $viewData["bitdescripcion"] = $this->bitdescripcion;
        $viewData["bitobservacion"] = $this->bitobservacion;
        $viewData["bitTipo"] = $this->bitTipo;
        $viewData["bitusuario"] = $this->bitusuario;
        $viewData["errors"] = $this->errors;
        $viewData["isReadOnly"] = in_array($this->mode, ["DEL", "DSP"]) ? "readonly" : "";
        $viewData["isDisplay"] = $this->mode == "DSP";
        \Views\Renderer::render("bitacoras/form", $viewData);
    }
}

