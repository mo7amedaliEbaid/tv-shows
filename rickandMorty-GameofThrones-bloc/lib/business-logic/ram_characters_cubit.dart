import 'package:bloc/bloc.dart';
import 'package:breakingbad/data/repositories/ram_charactersrepository.dart';
import 'package:meta/meta.dart';

import '../data/models/ram_characters_model.dart';

part 'ram_characters_state.dart';

class RAMCharactersCubit extends Cubit<RAMCharactersState> {
  final RAMCharactersRepository charactersRepostry;
  List<RAMCharacter> ramcharacters = [];

  RAMCharactersCubit(this.charactersRepostry) : super(RAMCharactersInitial());

  List<RAMCharacter> getAllRAMCharacters() {
    charactersRepostry.getAllRAMCharacters().then((characters) {
      emit(RAMCharactersloaded(characters));
      this.ramcharacters = characters;
    });
    return ramcharacters;
  }
}
