import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:moviebook/constans/r.dart';
import 'dart:async';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final pesanController = TextEditingController();
  late CollectionReference chat;
  late QuerySnapshot chatData;
  // List<QueryDocumentSnapshot> listChat;
  // getDatafromFirebase() async {
  //   chatData = await FirebaseFirestore.instance
  //       .collection(
  //         "room",
  //       )
  //       .doc(
  //         "kimia",
  //       )
  //       .collection('chat')
  //       .get();
  //   listChat = chatData.docs;
  //   setState(() {});
  // }

  @override
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    if (user == null) {
      Navigator.of(context).pushNamed('/login-page');
    }
    chat = FirebaseFirestore.instance
        .collection(
          "room",
        )
        .doc(
          "kimia",
        )
        .collection('chat');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: R.colors.colorUmum,
        title: const Text("Diskusi Soal"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder(
                stream: chat.orderBy('time').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      reverse: true, //untuk muncul dari bawah
                      itemCount: snapshot.data?.docs.reversed.length,
                      itemBuilder: (BuildContext context, int index) {
                        final currentChat =
                            snapshot.data!.docs.reversed.toList()[index];
                        final currentDate =
                            (currentChat["time"] as Timestamp?)?.toDate();
                        return Container(
                          margin: EdgeInsets.only(
                            bottom: 10,
                          ),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            crossAxisAlignment: user.uid == currentChat['uid']
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentChat['nama'],
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff5200ff)),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: user.uid == currentChat['uid']
                                      ? Colors.pink.withOpacity(0.5)
                                      : R.colors.colorUmum.withOpacity(0.5),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: user.uid == currentChat['uid']
                                        ? Radius.circular(10)
                                        : Radius.circular(0),
                                    topRight: user.uid == currentChat['uid']
                                        ? Radius.circular(10)
                                        : Radius.circular(0),
                                  ),
                                ),
                                child: Text(
                                  currentChat['content'],
                                  style: GoogleFonts.poppins()
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                              Text(
                                // "waktucls",
                                currentChat == null
                                    ? ""
                                    : DateFormat.yMEd().format(currentDate!),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Text('Tidak ada data');
                  }
                },
              ),
            ),
          ),
          SafeArea(
            child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  offset: Offset(0, -1),
                  color: Colors.black.withOpacity(0.24),
                  blurRadius: 10,
                )
              ]),
              padding: const EdgeInsets.all(10),
              child: Row(children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: R.colors.colorUmum.withOpacity(0.5),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            child: TextField(
                              controller: pesanController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.camera_alt,
                                    color: R.colors.colorUmum,
                                  ),
                                ),
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                focusColor: R.colors.colorUmum,
                                hintText: 'tulis pesan',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print(pesanController.text);
                    if (pesanController.text.isEmpty) {
                      return;
                    }
                    dynamic chatContent = {
                      "nama": user.displayName,
                      "uid": user.uid,
                      "content": pesanController.text,
                      "email": user.email,
                      "photo": user.photoURL,
                      "time": FieldValue.serverTimestamp(),
                    };
                    chat.add(chatContent).whenComplete(() {
                      // getDatafromFirebase();
                      pesanController.clear();
                    });
                  },
                  icon: Icon(
                    Icons.send_outlined,
                    color: R.colors.colorUmum,
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
