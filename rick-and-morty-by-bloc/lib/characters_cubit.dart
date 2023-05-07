import 'package:bloc/bloc.dart';
import 'package:breakingbad/charactersrepository.dart';
import 'package:meta/meta.dart';

import 'characters.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepostry;
  List<Character> characters=[];
  CharactersCubit(this.charactersRepostry) : super(CharactersInitial());
  List<Character> getAllCharacters(){
    charactersRepostry.getAllCharacters().then((characters){
      emit(Charactersloaded(characters));
      this.characters=characters;
    });
    return characters;
  }
}
