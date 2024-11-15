import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/message_bubble.dart';

class MessageStream extends StatelessWidget {
  const MessageStream({
    super.key,
    required FirebaseFirestore firestore,
    required User? user,
  })  : _firestore = firestore,
        _user = user;

  final FirebaseFirestore _firestore;
  final User? _user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueAccent,
            ),
          );
        }
        final messages = snapshot.data?.docs.reversed ?? [];
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageData = message.data() as Map<String, dynamic>?;
          if (messageData != null) {
            final messageText = messageData['text'];
            final messageSender = messageData['sender'];

            final currentUser = _user?.email;

            final messageBubble = MessageBubble(
              text: messageText,
              sender: messageSender,
              isMe: currentUser == messageSender,
            );
            messageBubbles.add(messageBubble);
          }
          // final messageText = message.data()['text'];
          // final messageSender = message.data()['sender'];

          // final messageBubble =
          //     Text('$messageText from $messageSender');
          // messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messageBubbles,
          ),
        );
        // } else {
        //   return const CircularProgressIndicator();
        // }
      },
    );
  }
}
