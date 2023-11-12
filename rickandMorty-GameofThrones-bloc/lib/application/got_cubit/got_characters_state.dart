part of 'got_characters_cubit.dart';

@immutable
abstract class GotCharactersState {}

class GOTCharactersInitial extends GotCharactersState {}

class GOTCharactersloaded extends GotCharactersState {
  final List<GOTCharacter> gotcharacters;

  GOTCharactersloaded(this.gotcharacters);
}
