import 'package:bloc/bloc.dart';
import 'package:tvshows/data/models/got_character_model.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/got_charactersrepository.dart';

part 'got_characters_state.dart';

class GOTCharactersCubit extends Cubit<GotCharactersState> {
  final GOTCharactersRepository charactersRepostry;
  List<GOTCharacter> gotcharacters = [];

  GOTCharactersCubit(this.charactersRepostry) : super(GOTCharactersInitial());

  List<GOTCharacter> getAllGOTCharacters() {
    charactersRepostry.getAllGOTCharacters().then((characters) {
      emit(GOTCharactersloaded(characters));
      this.gotcharacters = characters;
    });
    return gotcharacters;
  }
}
