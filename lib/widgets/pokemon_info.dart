import 'package:flutter/material.dart';
import 'package:flutter_project_pokemon_codex/models/pokemon_model.dart';
import 'package:flutter_project_pokemon_codex/widgets/poke_details/poke_ability_list.dart';
import 'package:flutter_project_pokemon_codex/widgets/poke_details/poke_stats_list.dart';
import 'package:flutter_project_pokemon_codex/widgets/poke_details/poke_type_list.dart';
import 'package:flutter_project_pokemon_codex/widgets/poke_details/species.dart';


class PokemonInformation extends StatelessWidget {
  const PokemonInformation({required this.pokemonModel, Key? key})
      : super(key: key);

  final PokemonModel pokemonModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemonModel.id}.png',
              scale: 2,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                  '#${pokemonModel.id}',
                style: TextStyle(
                  fontSize: 12,
                ),),
                SizedBox(
                  width: 10,
                ),
                Text('${pokemonModel.name}')
              ]),
            SizedBox(
              height: 10,
            ),
            SpeciesList(pokemonModel: pokemonModel),
            TypeList(pokemonModel: pokemonModel),
            SizedBox(
              height: 10,
            ),
            AbilityList(pokemonModel: pokemonModel),
            SizedBox(
              height: 10,
            ),
            StatList(pokemonModel: pokemonModel),
        ]

      ),


        ),
    );
  }
}
