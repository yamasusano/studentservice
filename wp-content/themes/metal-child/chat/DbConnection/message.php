<?php

class chatmsg
{
    private $id;
    private $chat_id;
    private $sender_id;
    private $message;
    private $dbConn;

    public function __construct()
    {
        require_once 'db-connect.php';
        $db = new DbConnect();
        $this->dbConn = $db->connect();
    }

    /**
     * Get the value of id.
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set the value of id.
     *
     * @return self
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Get the value of chat_id.
     */
    public function getChat_id()
    {
        return $this->chat_id;
    }

    /**
     * Set the value of chat_id.
     *
     * @return self
     */
    public function setChat_id($chat_id)
    {
        $this->chat_id = $chat_id;

        return $this;
    }

    /**
     * Get the value of sender_id.
     */
    public function getSender_id()
    {
        return $this->sender_id;
    }

    /**
     * Set the value of sender_id.
     *
     * @return self
     */
    public function setSender_id($sender_id)
    {
        $this->sender_id = $sender_id;

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
        $sql = 'INSERT INTO wp_chat_user(chat_id,sender,message) VALUES(:chat_id,:sender,:message)';
        $stmt = $this->dbConn->prepare($sql);
        $stmt->bindParam(':chat_id', $this->chat_id);
        $stmt->bindParam(':sender', $this->sender_id);
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

    public function readed_message()
    {
        $sql = 'UPDATE wp_chat_user SET status = 0 WHERE chat_id = :chat_id';
        $stmt = $this->dbConn->prepare($sql);
        $stmt->bindParam(':chat_id', $this->chat_id);
        try {
            if ($stmt->execute()) {
                $this->save_message();

                return true;
            }
        } catch (Exeption $e) {
            echo $e->getMessage();
        }

        return false;
    }
}
