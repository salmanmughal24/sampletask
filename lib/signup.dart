import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sample_task/home.dart';

import 'login.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();

  bool obscureText = true;
  TextEditingController nameController = new TextEditingController();

  TextEditingController emailController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();

  bool uploadingImage = false;
  File _image;
  String photo;
  final picker = ImagePicker();

  Future getImage() async {

    if (await Permission.storage.request().isGranted) {
      final pickedFile = await picker.getImage(
          source: ImageSource.gallery,
          maxHeight: MediaQuery.of(context).size.width,
          maxWidth: MediaQuery.of(context).size.width);

      setState(() {
        _image = File(pickedFile.path);
      });
    }
    /*else {
      Map<PermissionGroup, PermissionStatus> permissionStatus =
      await PermissionHandler()
          .requestPermissions([PermissionGroup.storage]);
      permissionStatus.forEach((key, value) async {
        if (value == PermissionStatus.granted) {
          final pickedFile = await picker.getImage(
              source: ImageSource.gallery,
              maxHeight: MediaQuery
                  .of(context)
                  .size
                  .width,
              maxWidth: MediaQuery
                  .of(context)
                  .size
                  .width);

          if (pickedFile != null) {
            setState(() {
              _image = File(pickedFile.path);
              uploadFile();
            });
          } else {
            setState(() {
              uploadingImage = false;
            });
          }
        } else {
          setState(() {
            uploadingImage = false;
          });
        }
      });
    }*/
  }

  Future uploadFile() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Form(
            key: _formkey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Sign up with Email',
                    style: TextStyle(color: Color(0xdd253885), fontSize: 17),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      getImage();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                          height: 100,
                          width: 100,
                          child: _image != null
                              ? Image.file(_image, fit: BoxFit.fill)
                              : Image.asset(
                                  'assets/images/avatar.png',
                                  fit: BoxFit.fill,
                                )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x66253885),
                            blurRadius: 5,
                            offset: Offset(0, 2),
                            spreadRadius: 2,
                          )
                        ]),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'name',
                        hintStyle:
                            TextStyle(color: Color(0xdd253885), fontSize: 15),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x66253885),
                            blurRadius: 5,
                            offset: Offset(0, 2),
                            spreadRadius: 2,
                          )
                        ]),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'email',
                        hintStyle:
                            TextStyle(color: Color(0xdd253885), fontSize: 15),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x66253885),
                            blurRadius: 5,
                            offset: Offset(0, 2),
                            spreadRadius: 2,
                          )
                        ]),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter password';
                        }
                        if (value.length < 8) {
                          return 'Password should at least 8 characters';
                        }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        hintText: 'password',
                        hintStyle:
                            TextStyle(color: Color(0xdd253885), fontSize: 15),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          child: obscureText == true
                              ? Container(
                                  width: 22.0,
                                  height: 22.0,
                                  child: Icon(Icons.visibility_off,
                                      size: 22.0, color: Colors.grey),
                                )
                              : Container(
                                  width: 22.0,
                                  height: 22.0,
                                  child: Icon(Icons.visibility,
                                      size: 22.0, color: Color(0xdd253885)),
                                ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          if (_image == null) {
                            Fluttertoast.showToast(
                                msg: "Please upload Image",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Color(0xdd253885),
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            try {
                              setState(() {
                                uploadingImage = true;
                              });
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);
                              Reference userStorageReference = FirebaseStorage
                                  .instance
                                  .ref()
                                  .child("users")
                                  .child(DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString());
                              UploadTask snap =
                                  userStorageReference.putFile(_image);
                              snap.whenComplete(() async {
                                String photo = await snap.snapshot.ref.getDownloadURL();

                                if (userCredential.user != null) {
                                  FirebaseFirestore.instance
                                      .collection('users')
                                      .add({
                                    'name': nameController.text,
                                    'email': emailController.text,
                                    'password': passwordController.text,
                                    'photo': photo
                                  }).then((value) => {
                                  setState(() {
                                  uploadingImage = false;
                                  }),

                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()))
                                  });
                                }
                              });

                            } on FirebaseAuthException catch (e) {
                              setState(() {
                                uploadingImage = false;
                              });
                              if (e.code == 'weak-password') {
                                Fluttertoast.showToast(
                                    msg: "Password is too weak.",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Color(0xdd253885),
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else if (e.code == 'email-already-in-use') {
                                Fluttertoast.showToast(
                                    msg: "Email already Exists.",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Color(0xdd253885),
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            } catch (e) {
                              setState(() {
                                uploadingImage = false;
                              });
                              print(e);
                            }
                          }
                        }
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(color: Color(0xdd253885)),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: Color(0xdd253885), fontSize: 17),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Container(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Color(0xdd253885),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: uploadingImage,
            child: SizedBox.expand(
              child: Container(
                color: Colors.black54,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
