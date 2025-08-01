import 'package:flutter/material.dart';

class Logintailer extends StatelessWidget {
  const Logintailer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 34),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.27,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/loginBackground.png"),
        ),
      ),
      child: Center(child: Image.asset(scale: 3, "assets/images/logo.png")),
    );
  }
}
