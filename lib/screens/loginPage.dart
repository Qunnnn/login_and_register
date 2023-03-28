import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:login_and_register/components/background.dart';
import 'package:login_and_register/components/myButton.dart';
import 'package:login_and_register/components/myTextField.dart';
import 'package:login_and_register/screens/registerPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final emailAccount = TextEditingController();
    final passWord = TextEditingController();

    void showWrongMessages(String message) {
      showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              title: Text(message),
            );
          }));
    }

    void userSignIn() async {
      showDialog(
          context: context,
          builder: ((context) {
            return SpinKitFadingCircle(
              color: Colors.white,
              size: 50,
            );
          }));
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAccount.text,
          password: passWord.text,
        );
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        showWrongMessages(e.code);
      }
    }

    return Scaffold(
      body: BackgroundPage(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(horizontal: 40.0),
            child: const Text(
              'LOGIN',
              style: TextStyle(
                fontFamily: 'Lora',
                fontSize: 36.0,
                fontWeight: FontWeight.w900,
                color: Color(0xFF2661FA),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          MyTextField(controller: emailAccount, label: 'Email' , obscureText:  false,),
          SizedBox(height: size.height * 0.03),
          MyTextField(controller: passWord, label: 'Passworld' , obscureText: true,),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
            child: const Text(
              'Forget your password?',
              style: TextStyle(
                color: Color(0XFF2661FA),
                fontSize: 13.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.05),
          MyButton(onTap: userSignIn , text:  'Login',),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  RegisterPage()));
              },
              child: const Text(
                'Don\'t have an account? Sign up',
                style: TextStyle(
                  color: Color(0xFF2661FA),
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.w800,
                  fontSize: 13.0,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
