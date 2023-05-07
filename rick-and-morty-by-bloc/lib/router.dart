import 'package:breakingbad/characters_cubit.dart';
import 'package:breakingbad/characters_screen.dart';
import 'package:breakingbad/charactersrepository.dart';
import 'package:breakingbad/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'character_details.dart';
import 'charactersWebServices.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>charactersCubit,
            child: CharactersScreen(),
          ),
        );
      case charactersDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharactersDetailsScreen());
    }
  }
}
