import 'package:breakingbad/application/ram_cubit/ram_characters_cubit.dart';
import 'package:breakingbad/presentation/widgets/ramcharacter_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../shared/constants.dart';
import '../../data/models/ram_characters_model.dart';
import '../widgets/appbar_title.dart';
import '../widgets/loading.dart';

class RAMCharactersScreen extends StatefulWidget {
  const RAMCharactersScreen({Key? key}) : super(key: key);

  @override
  State<RAMCharactersScreen> createState() => _RAMCharactersScreenState();
}

class _RAMCharactersScreenState extends State<RAMCharactersScreen> {
  late List<RAMCharacter> allCharacters;
  late List<RAMCharacter> searchedForCharacters;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RAMCharactersCubit>(context).getAllRAMCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, GOTcharactersScreen);
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 2, 0, 2),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/got.jpeg"), fit: BoxFit.fill)),
          ),
        ),
        title: _isSearching
            ? _buildSearchField()
            : buildAppBarrTitle("Rick and Morty"),
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

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: Colors.cyan,
      decoration: InputDecoration(
        hintText: 'Find Ricky and Morty character',
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

  Widget buildBlocWidget() {
    return BlocBuilder<RAMCharactersCubit, RAMCharactersState>(
        builder: (context, state) {
      if (state is RAMCharactersloaded) {
        allCharacters = (state).ramcharacters;
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
          return RAMCharacterItem(
            character: _searchTextController.text.isEmpty
                ? allCharacters[index]
                : searchedForCharacters[index],
          );
        });
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    searchedForCharacters = allCharacters
        .where((character) =>
            character.name!.toLowerCase().startsWith(searchedCharacter))
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
