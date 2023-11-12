part of 'ram_characters_cubit.dart';

@immutable
abstract class RAMCharactersState {}

class RAMCharactersInitial extends RAMCharactersState {}

class RAMCharactersloaded extends RAMCharactersState {
  final List<RAMCharacter> ramcharacters;

  RAMCharactersloaded(this.ramcharacters);
}
