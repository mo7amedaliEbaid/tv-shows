import 'package:breakingbad/data/models/got_character_model.dart';
import 'package:breakingbad/data/web_services/gotwebServices.dart';

class GOTCharactersRepository{
  final GOTCharactersWebServices charactersWebServices;

  GOTCharactersRepository(this.charactersWebServices);
  Future<List<GOTCharacter>> getAllGOTCharacters()async{
    final characters =await charactersWebServices.getAllGOTCharacters();
    return characters.map((character) => GOTCharacter.fromJson(character)).toList();
  }
}