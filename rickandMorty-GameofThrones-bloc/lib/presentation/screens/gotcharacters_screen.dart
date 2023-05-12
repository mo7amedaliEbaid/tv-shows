import 'package:breakingbad/constants/constants.dart';
import 'package:breakingbad/data/models/got_character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../business-logic/got_characters_cubit.dart';
import '../widgets/appbar_title.dart';
import '../widgets/gotcharacter_item.dart';
import '../widgets/loading.dart';

class GOTCharactersScreen extends StatefulWidget {
  const GOTCharactersScreen({Key? key}) : super(key: key);

  @override
  State<GOTCharactersScreen> createState() => _GOTCharactersScreenState();
}

class _GOTCharactersScreenState extends State<GOTCharactersScreen> {
  late List<GOTCharacter> allCharacters;
  late List<GOTCharacter> searchedForCharacters;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GOTCharactersCubit>(context).getAllGOTCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: _isSearching
            ? _buildSearchField()
            : buildAppBarrTitle("Game of Thrones"),
        leading: InkWell(
            onTap: () {
              Navigator.pushNamed(context, RAMcharactersScreen);
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 2, 0, 2),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/rick.png"), fit: BoxFit.fill)),
            )),
        actions: buildAppBarrActions(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return buildBlocWidget();
          } else {
            return Center(
              child: Column(
                children: [
                  Icon(
                    Icons.signal_wifi_statusbar_connected_no_internet_4_sharp,
                    size: 60,
                    color: Colors.red,
                  ),
                  Text("Please Check Your Internet Connection")
                ],
              ),
            );
          }
        },
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<GOTCharactersCubit, GotCharactersState>(
        builder: (context, state) {
      if (state is GOTCharactersloaded) {
        allCharacters = (state).gotcharacters;
        return buildLoadedListWidgets();
      } else {
        return showLoadingIndicator();
      }
    });
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildCharactersList(),
        ],
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
        itemCount: _searchTextController.text.isEmpty
            ? allCharacters.length
            : searchedForCharacters.length,
        itemBuilder: (context, index) {
          return GotCharacterItem(
            character: _searchTextController.text.isEmpty
                ? allCharacters[index]
                : searchedForCharacters[index],
          );
        });
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: Colors.cyan,
      decoration: InputDecoration(
        hintText: 'Find Game of thrones character',
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
        IconButton(
            onPressed: () {
              _clearSearch();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.clear,
              color: Colors.black,
            )),
      ];
    } else {
      return [
        IconButton(
            onPressed: _startsearch,
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ))
      ];
    }
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    searchedForCharacters = allCharacters
        .where((character) =>
            character.fullName!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  void _startsearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }
}
