import 'package:breakingbad/business-logic/characters_cubit.dart';
import 'package:breakingbad/data/models/characters_model.dart';
import 'package:breakingbad/presentation/screens/characters_screen.dart';
import 'package:breakingbad/data/repositories/charactersrepository.dart';
import 'package:breakingbad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/screens/character_details_screen.dart';
import 'data/web_services/charactersWebServices.dart';

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
        final character = settings.arguments as Character;
        return MaterialPageRoute(builder: (_) => CharactersDetailsScreen(character: character,));
    }
  }
}
