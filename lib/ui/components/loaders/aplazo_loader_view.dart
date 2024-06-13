import 'package:flutter/material.dart';

class AplazoLoaderView extends StatelessWidget {
  const AplazoLoaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Image.asset(
        "assets/gifs/loader.gif",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fitWidth,
      ),
    ));
  }
}
