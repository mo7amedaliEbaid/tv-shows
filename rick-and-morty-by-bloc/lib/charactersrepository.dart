import 'package:breakingbad/charactersWebServices.dart';

import 'characters.dart';

class CharactersRepository{
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);
  Future<List<Character>> getAllCharacters()async{
    final characters =await charactersWebServices.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }
}