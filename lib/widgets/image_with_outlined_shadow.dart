import 'package:flutter/material.dart';

class ImageWithOutlinedShadow extends StatelessWidget {
  const ImageWithOutlinedShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 40),
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).splashColor,
                width: 1,
              ),
            ),
          ),
        ),
        Image.asset('assets/face.jpg', width: 300, height: 300,),
      ],
    );
  }
}