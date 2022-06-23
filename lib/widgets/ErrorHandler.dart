import 'package:flutter/material.dart';
import 'package:mvp_flutter_dm1/widgets/card.dart';
import 'package:mvp_flutter_dm1/widgets/custom_input.dart';
import 'package:mvp_flutter_dm1/widgets/custom_text.dart';

class ErrorHandler extends StatelessWidget {
  final TextEditingController inputController;
  final VoidCallback updateWord;

  const ErrorHandler(
      {Key? key, required this.inputController, required this.updateWord})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              child: Input(
                controller: inputController,
                onEditingComplete: updateWord,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
            ),
            const Expanded(
              child: CustomCard(
                color: Color.fromRGBO(255, 204, 0, 1),
                child: Center(
                  child: CustomText(
                    color: Colors.black,
                    text: 'Não foi possivel localizar a palavra inserida',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
