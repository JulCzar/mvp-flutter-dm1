import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/custom_input.dart';
import '../widgets/custom_text.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(text: 'Este é um dicionário.', size: 64),
            const Input(),
            Button(
              text: 'Buscar',
              onPressed: () {
                Navigator.of(context).pushNamed('/details');
              },
            ),
          ],
        ),
      ),
    );
  }
}
