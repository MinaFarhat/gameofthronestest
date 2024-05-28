import 'package:bloc/bloc.dart';
import 'package:gameofthrones/data/models/Character.dart';
import 'package:gameofthrones/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';


part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepositry charactersRepositry;
  List<Character> characters = [];
  CharactersCubit(this.charactersRepositry) : super(CharctersInitial());

  List<Character> getAllCharacters() {
    charactersRepositry.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
