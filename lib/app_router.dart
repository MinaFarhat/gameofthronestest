import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameofthrones/business_logic/cubit/characters_cubit.dart';
import 'package:gameofthrones/constants/strings.dart';
import 'package:gameofthrones/data/api/CharactersApi.dart';
import 'package:gameofthrones/data/models/Character.dart';
import 'package:gameofthrones/data/repository/characters_repository.dart';
import 'package:gameofthrones/presentation/screens/character_details.dart';

import 'presentation/screens/characters_screen.dart';

class AppRouter {
  late CharactersRepositry charactersRepositry;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepositry = CharactersRepositry(CharactersApi());
    charactersCubit = CharactersCubit(charactersRepositry);
  }

  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
            create: (BuildContext context) =>CharactersCubit(charactersRepositry),
            child: CharacterDetailsScreen(
              character: character,
            ),
          ),
        );
    }
  }
}
