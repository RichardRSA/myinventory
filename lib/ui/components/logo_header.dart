import 'package:flutter/material.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      margin: EdgeInsets.only(bottom: 8),
      child: Image(image: AssetImage('lib/ui/assets/logo.png')),
    );
  }
}