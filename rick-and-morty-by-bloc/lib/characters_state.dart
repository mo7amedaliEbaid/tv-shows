part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}
class Charactersloaded extends CharactersState{
  final List<Character> characters;

  Charactersloaded(this.characters);

}
