<?php

class major
{
    public $ID;
    public $code;
    public $name;

    /**
     * Get the value of ID.
     */
    public function getID()
    {
        return $this->ID;
    }

    /**
     * Set the value of ID.
     *
     * @return self
     */
    public function setID($ID)
    {
        $this->ID = $ID;

        return $this;
    }

    /**
     * Get the value of code.
     */
    public function getCode()
    {
        return $this->code;
    }

    /**
     * Set the value of code.
     *
     * @return self
     */
    public function setCode($code)
    {
        $this->code = $code;

        return $this;
    }

    /**
     * Get the value of name.
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set the value of name.
     *
     * @return self
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    public function majorInfo($ID, $code, $name)
    {
        $this->ID = $ID;
        $this->code = $code;
        $this->name = $name;

        return $this;
    }
}
