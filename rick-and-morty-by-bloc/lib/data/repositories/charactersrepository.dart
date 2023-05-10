import 'package:breakingbad/data/web_services/charactersWebServices.dart';

import '../models/characters_model.dart';

class CharactersRepository{
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);
  Future<List<Character>> getAllCharacters()async{
    final characters =await charactersWebServices.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }
}