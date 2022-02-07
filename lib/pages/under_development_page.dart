import 'package:flutter/cupertino.dart';
import 'package:resume/widgets/text/accent_text.dart';

class UnderDevelopmentPage extends StatelessWidget {
  const UnderDevelopmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: AccentText(
            'This part under development',
            fontSize: 64,
          ),
        )
      ],
    );
  }
}
