import 'package:breakingbad/character_item.dart';
import 'package:breakingbad/characters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'characters.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;
  late List<Character> searchedForCharacters;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();
  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: Colors.cyan,
      decoration: InputDecoration(
        hintText: 'Find a character',
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.red,
        ),
      ),
      style: TextStyle(
        color: Colors.purple,
      ),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearchedList(searchedCharacter);
      },
    );
  }

  List<Widget> buildAppBarrActions() {
    if (_isSearching) {
      return [
        IconButton(onPressed: () {
          _clearSearch();
          Navigator.pop(context);
        }, icon: Icon(Icons.clear)),
      ];
    }else{
      return[
        IconButton(onPressed: _startsearch
        , icon: Icon(Icons.search))
      ];
    }
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is Charactersloaded) {
        allCharacters = (state).characters;
        return buildLoadedListWidgets();
      } else {
        return showLoadingIndicator();
      }
    });
  }

  Widget showLoadingIndicator() {
    return Center(
      child: Container(
        child: CircularProgressIndicator(
          color: Colors.yellow,
        ),
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _searchTextController.text.isEmpty? allCharacters.length : searchedForCharacters.length,
        itemBuilder: (context, index) {
          return CharacterItem(
            character:_searchTextController.text.isEmpty? allCharacters[index]:searchedForCharacters[index],
          );
        });
  }
Widget _buildAppBarrTitle(){
    return Text(
      'Characters',
      style: TextStyle(
        color: Colors.grey,
      ),
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: _isSearching? _buildSearchField():_buildAppBarrTitle(),
        actions: buildAppBarrActions(),
      ),
      body: buildBlocWidget(),
    );
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    searchedForCharacters = allCharacters
        .where((character) =>
        character.name!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {

    });
  }

  void _startsearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove:_stopSearching ));
    setState(() {
      _isSearching=true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching=false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }
}

