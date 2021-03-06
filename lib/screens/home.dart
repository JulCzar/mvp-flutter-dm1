import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/custom_input.dart';
import '../widgets/custom_text.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void navigateToDetails() {
      if (inputController.text != '') {
        Navigator.of(context).pushNamed(
          '/details',
          arguments: inputController.text,
        );
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomText(text: 'Este é um ', size: 48),
                CustomText(
                  fontWeight: FontWeight.w700,
                  text: 'Dicionário.',
                  size: 64,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Input(
                  controller: inputController,
                  onEditingComplete: navigateToDetails,
                ),
                Button(
                  text: 'Buscar',
                  onPressed: navigateToDetails,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
