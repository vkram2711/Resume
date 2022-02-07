import 'package:flutter/material.dart';
import 'package:resume/widgets/inherited/resume_inherited.dart';

class ImageWithOutlinedShadow extends StatelessWidget {
  final double width;
  final double height;

  const ImageWithOutlinedShadow({Key? key, this.height=300, this.width=300}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: ResumeInherited.of(context).isWeb ? const EdgeInsets.only(top: 40, left: 40) : const EdgeInsets.only(top: 15, left: 15),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).splashColor,
                width: 1,
              ),
            ),
          ),
        ),
        Image.asset('assets/face.jpg', width: width, height: height,),
      ],
    );
  }
}