import 'package:flutter/cupertino.dart';
import 'package:resume/widgets/resume_button.dart';
import 'package:resume/widgets/text/accent_text.dart';
import 'package:resume/widgets/text/primary_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget{
  const ContactPage({Key? key}) : super(key: key);

  //TODO: add in the top contant text with dividers left and right
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      const AccentText(
        'Send me a message!',
        fontSize: 72,
        textAlign: TextAlign.center,
      ),
      const Padding(
        padding: EdgeInsets.all(4.0),
        child: PrimaryText(
          'Do you have a proposition or want to discuss something?',
          textAlign: TextAlign.center,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: PrimaryText(
          'Do not hesitate to contact me!',
          textAlign: TextAlign.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
          child: ResumeButton('Contact me', (){
            launch('mailto:vkramarenko.at.work@gmail.com?subject=Hello, Vlad');
          }),
        )
      ]
    );
  }
}