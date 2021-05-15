import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_task/models/user.dart';

import 'login.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Text(
                    "Users",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  )),
              Expanded(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.size,
                          itemBuilder: (BuildContext context, int index) {
                            User user = User.fromJson(
                                snapshot.data.docs.elementAt(index).data());
                            return listItem(user);
                          },
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
              ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) => {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => LoginScreen()))
                    });
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Color(0xdd253885)),
                  )),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  listItem(User user) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(bottom: 1),
        color: Colors.black26,
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          color: Color(0xffdee1ed),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                    height: 50,
                    width: 50,
                    child: Image.network(
                      user.photo,
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(user.name),
                  SizedBox(
                    width: 10,
                  ),
                  Text(user.email),
                ],
              ),
            ],
          ),
        ));
  }
}
