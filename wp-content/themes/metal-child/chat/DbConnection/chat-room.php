<?php

class chatrooms
{
    private $id;
    private $sender;
    private $recevicer;
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
     * Get the value of sender.
     */
    public function getSender()
    {
        return $this->sender;
    }

    /**
     * Set the value of sender.
     *
     * @return self
     */
    public function setSender($sender)
    {
        $this->sender = $sender;

        return $this;
    }

    /**
     * Get the value of recevicer.
     */
    public function getRecevicer()
    {
        return $this->recevicer;
    }

    /**
     * Set the value of recevicer.
     *
     * @return self
     */
    public function setRecevicer($recevicer)
    {
        $this->recevicer = $recevicer;

        return $this;
    }

    public function get_chat_id()
    {
        $sql = 'SELECT ID FROM wp_user_chat WHERE user_send = :u_send AND user_recevive = :u_receive';
        $stmt = $this->dbConn->prepare($sql);
        $stmt->bindParam(':u_send', $this->sender);
        $stmt->bindParam(':u_receive', $this->recevicer);

        $sql2 = 'SELECT ID FROM wp_user_chat WHERE user_send = :u_receive AND user_recevive = :u_send';
        $stmt2 = $this->dbConn->prepare($sql2);
        $stmt2->bindParam(':u_send', $this->sender);
        $stmt2->bindParam(':u_receive', $this->recevicer);
        try {
            if ($stmt->execute()) {
                $chat_id = $stmt->fetch(PDO::FETCH_ASSOC);
                $chat_id = $chat_id['ID'];
                if (!$chat_id) {
                    if ($stmt2->execute()) {
                        $chat_id = $stmt2->fetch(PDO::FETCH_ASSOC);
                        $chat_id = $chat_id['ID'];
                    }
                }
            }
        } catch (Exeption $e) {
            echo $e->getMessage();
        }

        return $chat_id;
    }

    public function create_user_chat_id()
    {
        $chat_id = $this->get_chat_id();
        if ($chat_id) {
            return $chat_id;
        } else {
            $sql = 'INSERT INTO wp_user_chat(user_send,user_recevive) VALUES(:u_send,:u_receive)';
            $stmt = $this->dbConn->prepare($sql);
            $stmt->bindParam(':u_send', $this->sender);
            $stmt->bindParam(':u_receive', $this->recevicer);
            try {
                if ($stmt->execute()) {
                    $chat_id = $this->get_chat_id();
                }
            } catch (Exeption $e) {
                echo $e->getMessage();
            }
        }

        return $chat_id;
    }
}
