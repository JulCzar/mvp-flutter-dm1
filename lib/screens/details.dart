import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mvp_flutter_dm1/models/meaning.dart';
import 'package:mvp_flutter_dm1/models/phrase.dart';
import 'package:mvp_flutter_dm1/services/api.dart';
import 'package:mvp_flutter_dm1/widgets/card.dart';
import 'package:mvp_flutter_dm1/widgets/custom_input.dart';
import 'package:mvp_flutter_dm1/widgets/custom_text.dart';

List<String> parseList(List<dynamic> list) {
  return list.map((e) => e as String).toList();
}

class Details extends HookWidget {
  @override
  Widget build(BuildContext context) {
    const String _word = 'Amizade';
    var silabes = useState<List>(['']);
    var phrases = useState<List<Phrase>>([]);
    var sinonim = useState<List>([]);
    var meaning = useState<List<Meaning>>([]);

    final args = ModalRoute.of(context)?.settings.arguments;

    void getDetails(String word) async {
      var _response = await Future.wait([
        api.get('/silabas/$word'),
        api.get('/frases/$word'),
        api.get('/sinonimos/$word'),
        api.get('/significados/$word'),
      ]);

      silabes.value = parseList(_response[0].data);
      phrases.value = Phrase.newListFromMap(_response[1].data);
      sinonim.value = parseList(_response[2].data);
      meaning.value = Meaning.newListFromMap(_response[3].data);

      // meaning.value = _response[3].data as String;
    }

    useEffect(() {
      getDetails(_word);
    }, const []);

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
                child: ListView.builder(
                    itemCount: meaning.value.length,
                    itemBuilder: (_i, i) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: meaning.value[i].partOfSpeech,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16.0),
                              child: CustomText(
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                                text: silabes.value.join('-'),
                                size: 48,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: CustomText(
                                color: Colors.black,
                                text: silabes.value.join('-'),
                              ),
                            ),
                            ListView.builder(
                              itemBuilder: (_j, j) => Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: CustomText(
                                  color: Colors.black,
                                  text: meaning.value[i].meanings[j],
                                ),
                              ),
                            )
                          ],
                        )),
              ),
            ),
            Expanded(
              child: CustomCard(
                color: const Color.fromRGBO(22, 26, 39, 1),
                child: ListView.builder(
                  itemCount: phrases.value.length,
                  itemBuilder: (_, i) => Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: phrases.value[i].sentence,
                        ),
                        CustomText(
                          text: phrases.value[i].author,
                          color: Colors.white54,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
