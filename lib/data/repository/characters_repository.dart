import 'package:gameofthrones/data/api/CharactersApi.dart';
import 'package:gameofthrones/data/models/Character.dart';

class CharactersRepositry {
  final CharactersApi charactersApi;

  CharactersRepositry(this.charactersApi);
  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersApi.getAllCharacters();

    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
