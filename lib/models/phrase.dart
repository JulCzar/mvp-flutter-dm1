class Phrase {
  late String _sentence;
  late String _author;

  Phrase._internal();

  static Phrase fromJSON(dynamic data) {
    var phrase = Phrase._internal();

    phrase._author = data['author'];
    phrase._sentence = data['sentence'];

    return phrase;
  }

  String get sentence {
    return _sentence;
  }

  String get author {
    return _author;
  }

  static List<Phrase> newListFromMap(List<dynamic> data) {
    List<Phrase> phraseList = [];

    for (var element in data) {
      phraseList.add(Phrase.fromJSON(element));
    }

    return phraseList;
  }
}
