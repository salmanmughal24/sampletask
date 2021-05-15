
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample_task/home.dart';
import 'package:sample_task/signup.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  TextEditingController emailController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();

  GlobalKey<FormState> _formkey2 = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: _formkey2,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              SizedBox(
                height: 20,
              ),
              Text(
                'Login with Email',
                style: TextStyle(color: Color(0xdd253885), fontSize: 17),
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
                      return 'Please enter email';
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'email',
                    hintStyle: TextStyle(color: Color(0xdd253885), fontSize: 15),
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
                    hintStyle: TextStyle(color: Color(0xdd253885), fontSize: 15),
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
              Text(
                'Forgot Password?',
                style: TextStyle(
                    color: Color(0xdd253885),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {

                    if (_formkey2.currentState.validate()) {

                      try {
                        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text
                        );
                        if(userCredential.user!=null){

    Navigator.of(context).pushReplacement(
    MaterialPageRoute(
    builder: (context) =>
    HomeScreen()));
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          Fluttertoast.showToast(
                              msg: "No such email found",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Color(0xdd253885),
                              textColor: Colors.white,
                              fontSize: 16.0);

                        } else if (e.code == 'wrong-password') {
                          Fluttertoast.showToast(
                              msg: "Wrong password",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Color(0xdd253885),
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }else{
                          Fluttertoast.showToast(
                              msg: e.code,
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Color(0xdd253885),
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      }

                    }

                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Color(0xdd253885)),
                  )),
              SizedBox(
                height: 30,
              ),
              Text(
                'Don\'t have an account?',
                style: TextStyle(color: Color(0xdd253885), fontSize: 17),
              ),

              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignupScreen()));
                },
                child: Container(
                  child: Text(
                    'Sign Up',
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
    );
  }
}