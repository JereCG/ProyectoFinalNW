<?php


namespace Controllers\Bitacoras;

use \Dao\Bitacoras\Bitacoras as DaoBitacoras;

const SESSION_BITACORAS_SEARCH = "bitacoras_search_data";

class Bitacoras extends \Controllers\PublicController
{
    public function run(): void
    {
        $viewData = array();
        $viewData["search"] = $this->getSessionSearchData();
        if ($this->isPostBack()) {
            $viewData["search"] = $this->getSearchData();
            $this->setSessionSearchData($viewData["search"]);
        }
        $viewData["bitacoras"] = DaoBitacoras::readAllBitacoras($viewData["search"]);
        $viewData["total"] = count($viewData["bitacoras"]);

        \Views\Renderer::render("bitacoras/lista", $viewData);
    }

    private function getSearchData()
    {
        if (isset($_POST["search"])) {
            return $_POST["search"];
        }
        return "";
    }

    private function getSessionSearchData()
    {
        if (isset($_SESSION[SESSION_BITACORAS_SEARCH])) {
            return $_SESSION[SESSION_BITACORAS_SEARCH];
        }
        return "";
    }

    private function setSessionSearchData($search)
    {
        $_SESSION[SESSION_BITACORAS_SEARCH] = $search;
    }
}
