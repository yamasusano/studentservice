<?php

class formInfo
{
    private $ID;
    private $user_id;
    private $title;
    private $description;
    private $other_skill;
    private $close_date;
    private $contact;
    private $status;
    private $semester;

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
     * Get the value of user_id.
     */
    public function getUser_id()
    {
        return $this->user_id;
    }

    /**
     * Set the value of user_id.
     *
     * @return self
     */
    public function setUser_id($user_id)
    {
        $this->user_id = $user_id;

        return $this;
    }

    /**
     * Get the value of title.
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * Set the value of title.
     *
     * @return self
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get the value of description.
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set the value of description.
     *
     * @return self
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get the value of other_skill.
     */
    public function getOther_skill()
    {
        return $this->other_skill;
    }

    /**
     * Set the value of other_skill.
     *
     * @return self
     */
    public function setOther_skill($other_skill)
    {
        $this->other_skill = $other_skill;

        return $this;
    }

    /**
     * Get the value of close_date.
     */
    public function getClose_date()
    {
        return $this->close_date;
    }

    /**
     * Set the value of close_date.
     *
     * @return self
     */
    public function setClose_date($close_date)
    {
        $this->close_date = $close_date;

        return $this;
    }

    /**
     * Get the value of contact.
     */
    public function getContact()
    {
        return $this->contact;
    }

    /**
     * Set the value of contact.
     *
     * @return self
     */
    public function setContact($contact)
    {
        $this->contact = $contact;

        return $this;
    }

    /**
     * Get the value of status.
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * Set the value of status.
     *
     * @return self
     */
    public function setStatus($status)
    {
        $this->status = $status;

        return $this;
    }

    /**
     * Get the value of semester.
     */
    public function getSemester()
    {
        return $this->semester;
    }

    /**
     * Set the value of semester.
     *
     * @return self
     */
    public function setSemester($semester)
    {
        $this->semester = $semester;

        return $this;
    }

    public function getFormInfo($ID, $user_id, $title, $description, $other_skill, $close_date, $contact, $status, $semester)
    {
        $this->ID = $ID;
        $this->user_id = $user_id;
        $this->title = $title;
        $this->description = $description;
        $this->other_skill = $other_skill;
        $this->close_date = $close_date;
        $this->contact = $contact;
        $this->status = $status;
        $this->semester = $semester;

        return $this;
    }
}
