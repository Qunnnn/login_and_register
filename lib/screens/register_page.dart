import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:login_and_register/components/background.dart';
import 'package:login_and_register/components/myButton.dart';
import 'package:login_and_register/components/myTextField.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final email = TextEditingController();
  final passWord = TextEditingController();
  final passWordConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void showWrongMessages(String message) {
      showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              title: Text(message),
            );
          }));
    }

    void userSignUp() async {
      showDialog(
          context: context,
          builder: ((context) {
            return SpinKitFadingCircle(
              color: Colors.white,
              size: 50,
            );
          }));
      try {
        if (passWordConfirm.text == passWord.text) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: email.text, password: passWord.text);
        } else {
          showWrongMessages('Passwords don\'t match');
        }
        Navigator.pop(context);
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        showWrongMessages(e.code);
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundPage(
          child: ListView(
        children: [
          SizedBox(
            height: size.height * 0.2,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.symmetric(horizontal: 40.0),
            child: const Text(
              'REGISTER',
              style: TextStyle(
                fontFamily: 'Lora',
                fontSize: 36.0,
                fontWeight: FontWeight.w900,
                color: Color(0xFF2661FA),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          MyTextField(controller: email, label: 'Email', obscureText: false),
          SizedBox(height: size.height * 0.03),
          MyTextField(
            controller: passWord,
            label: 'PassWord',
            obscureText: true,
          ),
          SizedBox(height: size.height * 0.03),
          MyTextField(
            controller: passWordConfirm,
            label: 'Confirm Password',
            obscureText: true,
          ),
          SizedBox(height: size.height * 0.03),
          MyButton(
            onTap: userSignUp,
            text: 'Sign Up',
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => {
                Navigator.pop(context),
              },
              child: const Text(
                'Already have an account? Sign in',
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
