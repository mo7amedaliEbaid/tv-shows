import 'package:breakingbad/data/models/got_character_model.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class GotCharactersDetailsScreen extends StatelessWidget {
  final GOTCharacter gotcharacter;

  const GotCharactersDetailsScreen({Key? key, required this.gotcharacter})
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
                            "Name",
                            style: headstyle,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            gotcharacter.fullName!,
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
                            "Family",
                            style: headstyle,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            gotcharacter.family!,
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
                            "Title",
                            style: headstyle,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            gotcharacter.title!,
                            style: hintstyle,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 525,
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget buildSliverappBar() {
    return SliverAppBar(
      expandedHeight: 500,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          gotcharacter.firstName!,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        background: Hero(
            tag: gotcharacter.id as Object,
            child: Image.network(
              gotcharacter.imageUrl!,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
