import 'package:flutter/material.dart';
import 'package:mvp_flutter_dm1/widgets/card.dart';
import 'package:mvp_flutter_dm1/widgets/custom_input.dart';
import 'package:mvp_flutter_dm1/widgets/custom_text.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              child: Input(),
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
            ),
            Expanded(
              child: CustomCard(
                color: const Color.fromRGBO(255, 204, 0, 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CustomText(
                      text: 'Palavra do dia',
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: CustomText(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        text: 'Amizade',
                        size: 48,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: CustomText(
                        color: Colors.black,
                        text: 'A-mi-za-de',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: CustomText(
                        color: Colors.black,
                        text: 'Relação de afeto, de carinho,'
                            'de estima e de dedicação entre duas pessoas, '
                            'sendo esses sentimentos recíprocos.',
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: CustomCard(
                color: const Color.fromRGBO(22, 26, 39, 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'Substantivo Feminino',
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 24.0),
                      child: CustomText(
                        text: 'Frases com Amizade',
                        fontWeight: FontWeight.bold,
                        size: 24,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CustomText(
                            text: 'A amizade é um amor que nunca morre.',
                          ),
                          CustomText(
                              text: '- Mário Quintana', color: Colors.white54),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CustomText(
                            text: 'A amizade é um amor que nunca morre.',
                          ),
                          CustomText(
                              text: '- Mário Quintana', color: Colors.white54),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
