
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
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
                    return 'Please enter email';
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
                onPressed: () {

                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));

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
    );
  }
}