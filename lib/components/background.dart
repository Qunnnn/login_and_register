import 'package:flutter/material.dart';

class BackgroundPage extends StatelessWidget {
  final Widget child;
  BackgroundPage({required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset('images/top1.png'),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset('images/top2.png'),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset('images/bottom1.png'),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset('images/bottom2.png'),
            ),
            Positioned(
              top: 30.0,
              right: 10.0,
              child: Image.asset('images/main.png'),
              width: size.height * 0.2,
            ),
            child,
          ],
        ),
      ),
    );
  }
}
