part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharctersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState{
  final List<Character> characters;

  CharactersLoaded(this.characters);

}
