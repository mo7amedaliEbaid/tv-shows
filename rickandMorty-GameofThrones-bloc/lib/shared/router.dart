import 'package:tvshows/application/got_cubit/got_characters_cubit.dart';
import 'package:tvshows/application/ram_cubit/ram_characters_cubit.dart';
import 'package:tvshows/shared/constants.dart';
import 'package:tvshows/data/repositories/got_charactersrepository.dart';
import 'package:tvshows/data/repositories/ram_charactersrepository.dart';
import 'package:tvshows/data/web_services/gotwebServices.dart';
import 'package:tvshows/presentation/screens/gotcharacters_screen.dart';
import 'package:tvshows/presentation/screens/ramcharacters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/web_services/ram_charactersWebServices.dart';

class AppRouter {
  late RAMCharactersRepository ramcharactersRepository;
  late RAMCharactersCubit ramcharactersCubit;
  late GOTCharactersRepository gotCharactersRepository;
  late GOTCharactersCubit gotCharactersCubit;

  AppRouter() {
    ramcharactersRepository =
        RAMCharactersRepository(RAMCharactersWebServices());
    ramcharactersCubit = RAMCharactersCubit(ramcharactersRepository);
    gotCharactersRepository =
        GOTCharactersRepository(GOTCharactersWebServices());
    gotCharactersCubit = GOTCharactersCubit(gotCharactersRepository);
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RAMcharactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => ramcharactersCubit,
            child: RAMCharactersScreen(),
          ),
        );
      case GOTcharactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => gotCharactersCubit,
            child: GOTCharactersScreen(),
          ),
        );
    }
  }
}
