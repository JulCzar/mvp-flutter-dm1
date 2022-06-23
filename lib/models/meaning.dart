import 'package:mvp_flutter_dm1/utils/parse_string_list.dart';

class Meaning {
  late String _partOfSpeech;
  late List<String> _meanings;
  late String _etymology;

  Meaning._internal();

  static Meaning fromJSON(Map<String, dynamic> data) {
    var meaning = Meaning._internal();

    meaning._partOfSpeech = data['partOfSpeech'];
    meaning._meanings = parseStringList(data['meanings']);
    meaning._etymology = data['etymology'];

    return meaning;
  }

  String get partOfSpeech {
    return _partOfSpeech;
  }

  List<String> get meanings {
    return _meanings;
  }

  String get etymology {
    return _etymology;
  }

  static List<Meaning> newListFromMap(List<dynamic> data) {
    List<Meaning> meaningList = [];

    for (var element in data) {
      meaningList.add(Meaning.fromJSON(element));
    }

    return meaningList;
  }
}
