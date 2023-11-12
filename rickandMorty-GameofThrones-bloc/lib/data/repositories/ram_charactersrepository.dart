import 'package:tvshows/data/web_services/ram_charactersWebServices.dart';

import '../models/ram_characters_model.dart';

class RAMCharactersRepository{
  final RAMCharactersWebServices charactersWebServices;

  RAMCharactersRepository(this.charactersWebServices);
  Future<List<RAMCharacter>> getAllRAMCharacters()async{
    final characters =await charactersWebServices.getAllRAMCharacters();
    return characters.map((character) => RAMCharacter.fromJson(character)).toList();
  }
}