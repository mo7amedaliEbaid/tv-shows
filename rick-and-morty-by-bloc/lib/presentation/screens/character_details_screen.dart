import 'package:breakingbad/data/models/characters_model.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final Character character;

  const CharactersDetailsScreen({Key? key, required this.character})
      : super(key: key);

  Widget buildSliverappBar() {
    return SliverAppBar(
      expandedHeight: 400,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name!,
          style: TextStyle(
            color: Colors.brown.shade900,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        background: Hero(
            tag: character.id as Object,
            child: Image.network(
              character.image!,
              fit: BoxFit.fill,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        slivers: [
          buildSliverappBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Species",style: headstyle,),
                          SizedBox(width: 30,),
                          Text(character.species!,style: hintstyle,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Status",style: headstyle,),
                          SizedBox(width: 30,),
                          Text(character.status!,style: hintstyle,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Gender",style: headstyle,),
                          SizedBox(width: 30,),
                          Text(character.gender!,style: hintstyle,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("First Created",style: headstyle,overflow: TextOverflow.ellipsis,),
                          SizedBox(width: 30,),
                          Text(character.created!,style: hintstyle,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Origin",style: headstyle,overflow: TextOverflow.ellipsis,),
                          SizedBox(width: 30,),
                          Text(character.origin?.name??"",style: hintstyle,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Location",style: headstyle,overflow: TextOverflow.ellipsis,),
                          SizedBox(width: 30,),
                          Text(character.location?.name??"",style: hintstyle,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Number of Episodes",style: headstyle,overflow: TextOverflow.ellipsis,),
                          SizedBox(width: 30,),
                          Text(character.episode?.length.toString()??"",style: hintstyle,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 280,)
            ]),
          )
        ],
      ),
    );
  }
}
