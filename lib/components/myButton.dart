import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({required this.onTap , required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 35.0),
      alignment: Alignment.centerRight,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0.0,
              backgroundColor: const Color(0xFFFFAF65),
              fixedSize: const Size(250, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
              )),
          child:Text(
            text,
            style: TextStyle(
              fontFamily: 'Lora',
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
          onPressed: onTap),
    );
  }
}
