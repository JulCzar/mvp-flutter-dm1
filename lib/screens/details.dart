import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../models/meaning.dart';
import '../models/phrase.dart';
import '../services/api.dart';
import '../utils/parse_string_list.dart';
import '../widgets/card.dart';
import '../widgets/custom_input.dart';
import '../widgets/custom_text.dart';

class Details extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var _word = useState('');

    var loading = useState(true);

    var silabes = useState<List<String>>([]);
    var phrases = useState<List<Phrase>>([]);
    var sinonim = useState<List<String>>([]);
    var meaning = useState<List<Meaning>>([]);

    final wordFromHome = ModalRoute.of(context)!.settings.arguments;

    void getDetails(String word) async {
      var _response = await Future.wait([
        api.get('/silabas/$word').then((v) => v.data),
        api.get('/frases/$word').then((v) => v.data),
        api.get('/sinonimos/$word').then((v) => v.data),
        api.get('/significados/$word').then((v) => v.data),
      ]).whenComplete(() {
        loading.value = false;
      });

      silabes.value = parseStringList(_response[0]);
      phrases.value = Phrase.newListFromMap(_response[1]);
      sinonim.value = parseStringList(_response[2]);
      meaning.value = Meaning.newListFromMap(_response[3]);
    }

    useEffect(() {
      _word.value = wordFromHome as String;
      return null;
    }, const []);

    useEffect(() {
      if (_word.value != '') getDetails(_word.value);
      return null;
    }, [_word]);

    if (loading.value) {
      return const LoadingIndicator();
    }

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
                  children: [
                    CustomText(
                      text: meaning.value[0].partOfSpeech,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: CustomText(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        text: _word.value,
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
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: CustomText(
                        text: 'Significados',
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        size: 24,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: meaning.value[0].meanings.length,
                        itemBuilder: (_j, j) => Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: CustomText(
                            color: Colors.black,
                            text: meaning.value[0].meanings[j],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
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
            )
          ],
        ),
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
