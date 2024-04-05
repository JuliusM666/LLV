<?php
class FileWorker
{
    private $name;
    private $tmpName;
    private $imgSize;
    private $formats;
    private $path;
    private $res;

    function __construct($name, $tmpName, $imgSize, $formats, $path)
    {

        $this->name = $name;
        $this->tmpName = $tmpName;
        $this->imgSize = $imgSize;

        $this->formats = $formats;
        $this->path = $path;
        $this->res = [];
    }

    function checkFile()
    {
        $imgExtension = pathinfo($this->name, PATHINFO_EXTENSION);
        $imgExLc = strtolower($imgExtension);

        if ($this->imgSize > 1250000) {
            $this->res["Per didelis failas"] = "red";
        }


        if (in_array($imgExLc, $this->formats) == false) {
            $this->res["Netinkamas failo formatas"] = "red";
        }

        if (count($this->res) == 0) {
            return true;
        } else {
            return $this->res;
        }
    }

    function Upload()
    {






        $imgUploadPath = $this->path . $this->name;
        move_uploaded_file($this->tmpName, $imgUploadPath);
    }

    function getName()
    {

        return $this->name;
    }
}
