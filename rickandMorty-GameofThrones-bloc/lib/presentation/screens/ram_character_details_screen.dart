import 'package:breakingbad/data/models/ram_characters_model.dart';
import 'package:flutter/material.dart';

import '../../shared/constants.dart';

class RAMCharactersDetailsScreen extends StatelessWidget {
  final RAMCharacter ramcharacter;

  const RAMCharactersDetailsScreen({Key? key, required this.ramcharacter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        slivers: [
          buildSliverappBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Species",
                            style: headstyle,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            ramcharacter.species!,
                            style: hintstyle,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Status",
                            style: headstyle,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            ramcharacter.status!,
                            style: hintstyle,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Gender",
                            style: headstyle,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            ramcharacter.gender!,
                            style: hintstyle,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "First Created",
                            style: headstyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                          width: 160,
                            child: Text(
                              ramcharacter.created!,
                              style: hintstyle,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Origin",
                            style: headstyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            ramcharacter.origin?.name ?? "",
                            style: hintstyle,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Location",
                            style: headstyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 180,
                            child: Text(
                              ramcharacter.location?.name ?? "",
                              style: hintstyle,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Number of Episodes",
                            style: headstyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            ramcharacter.episode?.length.toString() ?? "",
                            style: hintstyle,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 380,
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget buildSliverappBar() {
    return SliverAppBar(
      expandedHeight: 400,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          ramcharacter.name!,
          style: TextStyle(
            color: Colors.brown.shade900,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        background: Hero(
            tag: ramcharacter.id as Object,
            child: Image.network(
              ramcharacter.image!,
              fit: BoxFit.fill,
            )),
      ),
    );
  }
}
