<?php

namespace MyApp;

use Ratchet\MessageComponentInterface;
use Ratchet\ConnectionInterface;

include '../DbConnection/chat-room.php';
include '../DbConnection/message.php';
include '../DbConnection/message-groups.php';

class Chat implements MessageComponentInterface
{
    protected $clients;

    public function __construct()
    {
        $this->clients = new \SplObjectStorage();
        echo "Server stared \n";
    }

    public function onOpen(ConnectionInterface $conn)
    {
        // Store the new connection to send messages to later
        $this->clients->attach($conn);

        echo "New connection! ({$conn->resourceId})\n";
    }

    public function onMessage(ConnectionInterface $from, $msg)
    {
        $numRecv = count($this->clients) - 1;
        echo sprintf('Connection %d sending message "%s" to %d other connection%s'."\n", $from->resourceId, $msg, $numRecv, $numRecv == 1 ? '' : 's');
        $data = json_decode($msg, true);
        $type = $data['type'];
        if ($type == 1) {
            $objChat = new \chatrooms();
            $objMsg = new \chatmsg();
            $objChat->setSender($data['sender']);
            $objChat->setRecevicer($data['recievier']);
            $chat_id = $objChat->create_user_chat_id();
            if ($chat_id) {
                $objMsg->setChat_id($chat_id);
                $objMsg->setSender_id($data['sender']);
                $objMsg->setMessage($data['msg']);
                $objMsg->readed_message();
            }
        } elseif ($type == 0) {
            $objMsg = new \sendMessage();
            $objMsg->setForm_id($data['ID']);
            $objMsg->setUser_id($data['sender']);
            $objMsg->setMessage($data['msg']);
            if ($objMsg->getForm_id()) {
                $objMsg->save_message();
                $data['user_sender'] = $objMsg->get_user_account();
            }
        }

        foreach ($this->clients as $client) {
            if ($from !== $client) {
                // The sender is not the receiver, send to each client connected
                $client->send(json_encode($data));
            }
        }
    }

    public function onClose(ConnectionInterface $conn)
    {
        // The connection is closed, remove it, as we can no longer send it messages
        $this->clients->detach($conn);

        echo "Connection {$conn->resourceId} has disconnected\n";
    }

    public function onError(ConnectionInterface $conn, \Exception $e)
    {
        echo "An error has occurred: {$e->getMessage()}\n";

        $conn->close();
    }
}
