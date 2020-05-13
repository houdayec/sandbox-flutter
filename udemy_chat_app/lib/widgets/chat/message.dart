import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:udemy_chat_app/widgets/chat/message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (ctx, futureSnapshot) {
          if (futureSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return StreamBuilder(
              stream: Firestore.instance
                  .collection("chat")
                  .orderBy("createdAt", descending: true)
                  .snapshots(),
              builder: (ctx, chatSnapshot) {
                if (chatSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                final documents = chatSnapshot.data.documents;
                return ListView.builder(
                  reverse: true,
                  itemCount: documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MessageBubble(
                        documents[index]["text"],
                        documents[index]["userId"] == futureSnapshot.data.uid,
                        documents[index]["username"],
                        documents[index]["userImage"],
                        ValueKey(documents[index].documentID));
                  },
                );
              });
        });
  }
}
