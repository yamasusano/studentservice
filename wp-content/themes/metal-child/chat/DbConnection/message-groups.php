<?php

class sendMessage
{
    private $form_id;
    private $user_id;
    private $message;
    private $dbConnect;

    public function __construct()
    {
        require_once 'db-connect.php';
        $db = new DbConnect();
        $this->dbConn = $db->connect();
    }

    /**
     * Get the value of form_id.
     */
    public function getForm_id()
    {
        return $this->form_id;
    }

    /**
     * Set the value of form_id.
     *
     * @return self
     */
    public function setForm_id($form_id)
    {
        $this->form_id = $form_id;

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
     * Get the value of message.
     */
    public function getMessage()
    {
        return $this->message;
    }

    /**
     * Set the value of message.
     *
     * @return self
     */
    public function setMessage($message)
    {
        $this->message = $message;

        return $this;
    }

    public function save_message()
    {
        $sql = 'INSERT INTO wp_chat(form_id,user_id,message) VALUES(:form_id,:sender,:message)';
        $stmt = $this->dbConn->prepare($sql);
        $stmt->bindParam(':form_id', $this->form_id);
        $stmt->bindParam(':sender', $this->user_id);
        $stmt->bindParam(':message', $this->message);
        try {
            if ($stmt->execute()) {
                return true;
            }
        } catch (Exeption $e) {
            echo $e->getMessage();
        }

        return false;
    }

    public function get_user_account()
    {
        $sql = 'SELECT user_login FROM wp_users WHERE ID = :users';
        $stmt = $this->dbConn->prepare($sql);
        $stmt->bindParam(':users', $this->user_id);
        try {
            if ($stmt->execute()) {
                $user_name = $stmt->fetch(PDO::FETCH_ASSOC);
                $user_name = $user_name['user_login'];
            }
        } catch (Exeption $e) {
            echo $e->getMessage();
        }

        return $user_name;
    }
}
