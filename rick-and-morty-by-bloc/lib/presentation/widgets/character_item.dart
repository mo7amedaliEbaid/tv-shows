import 'package:breakingbad/constants/constants.dart';
import 'package:breakingbad/data/models/characters_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        child: InkWell(
          onTap: ()=>Navigator.pushNamed(context, charactersDetailsScreen,arguments: character),
          child: Hero(
            tag: character.id as Object,
            child: Container(
              color: Colors.grey,
              child: character.image!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'images/loading.jpg',
                      alignment: Alignment.center,
                      image: character.image.toString(),
                      fit: BoxFit.cover,
                    )
                  : Image.asset('images/cairo.jpeg'),
            ),
          ),
        ),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.topCenter,
          child: Text(
            character.name!,
            style: TextStyle(
              height: 1.3,
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
