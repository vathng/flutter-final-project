import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_project_pokemon_codex/models/pokemon_model.dart';

class StatsList extends StatefulWidget {
  const StatsList({required this.pokemonModel, Key? key}) : super(key: key);
  final PokemonModel pokemonModel;

  @override
  State<StatsList> createState() => _StatsListState();
}

class _StatsListState extends State<StatsList> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _statAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    _animationController.addListener(() => setState(() {}));
    _animationController.forward();

    _statAnimation = Tween<double>(
            begin: 0, end: widget.pokemonModel.stats[0].baseStat.toDouble())
        .animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: widget.pokemonModel.types.first.type.name == "grass"
            ? Colors.greenAccent.shade400
            : widget.pokemonModel.types.first.type.name == "fire"
                ? Colors.redAccent.shade400
                : widget.pokemonModel.types.first.type.name == "water"
                    ? Colors.blue.shade300
                    : widget.pokemonModel.types.first.type.name == "poison"
                        ? Colors.deepPurpleAccent.shade400
                        : widget.pokemonModel.types.first.type.name ==
                                "electric"
                            ? Colors.amber.shade300
                            : widget.pokemonModel.types.first.type.name ==
                                    "rock"
                                ? Colors.grey.shade300
                                : widget.pokemonModel.types.first.type.name ==
                                        "ground"
                                    ? Colors.brown.shade300
                                    : widget.pokemonModel.types.first.type
                                                .name ==
                                            "psychic"
                                        ? Colors.indigo.shade300
                                        : widget.pokemonModel.types.first.type
                                                    .name ==
                                                "fighting"
                                            ? Colors.orange.shade300
                                            : widget.pokemonModel.types.first
                                                        .type.name ==
                                                    "bug"
                                                ? Colors
                                                    .lightGreenAccent.shade400
                                                : widget.pokemonModel.types
                                                            .first.type.name ==
                                                        "ghost"
                                                    ? Colors.deepPurple.shade300
                                                    : widget
                                                                .pokemonModel
                                                                .types
                                                                .first
                                                                .type
                                                                .name ==
                                                            "normal"
                                                        ? Colors.black26
                                                        : Colors.pink.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Text(
              'Stats',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.pokemonModel.stats.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TweenAnimationBuilder<double>(
                            tween: Tween<double>(
                                begin: 0,
                                end: widget.pokemonModel.stats[index].baseStat
                                        .toDouble() /
                                    2),
                            duration: const Duration(seconds: 5),
                            builder: (BuildContext context, double size,
                                Widget? child) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Transform.scale(
                                  scaleX: size,
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 10,
                                    height: 18,
                                    color: widget.pokemonModel.types.first.type
                                                .name ==
                                            "grass"
                                        ? Colors.greenAccent
                                        : widget.pokemonModel.types.first.type.name ==
                                                "fire"
                                            ? Colors.redAccent
                                            : widget.pokemonModel.types.first
                                                        .type.name ==
                                                    "water"
                                                ? Colors.blue
                                                : widget.pokemonModel.types
                                                            .first.type.name ==
                                                        "poison"
                                                    ? Colors.deepPurpleAccent
                                                    : widget
                                                                .pokemonModel
                                                                .types
                                                                .first
                                                                .type
                                                                .name ==
                                                            "electric"
                                                        ? Colors.amber
                                                        : widget
                                                                    .pokemonModel
                                                                    .types
                                                                    .first
                                                                    .type
                                                                    .name ==
                                                                "rock"
                                                            ? Colors.grey
                                                            : widget
                                                                        .pokemonModel
                                                                        .types
                                                                        .first
                                                                        .type
                                                                        .name ==
                                                                    "ground"
                                                                ? Colors.brown
                                                                : widget
                                                                            .pokemonModel
                                                                            .types
                                                                            .first
                                                                            .type
                                                                            .name ==
                                                                        "psychic"
                                                                    ? Colors.indigo
                                                                    : widget.pokemonModel.types.first.type.name == "fighting"
                                                                        ? Colors.orange
                                                                        : widget.pokemonModel.types.first.type.name == "bug"
                                                                            ? Colors.lightGreenAccent
                                                                            : widget.pokemonModel.types.first.type.name == "ghost"
                                                                                ? Colors.deepPurple
                                                                                : widget.pokemonModel.types.first.type.name == "normal"
                                                                                    ? Colors.black26
                                                                                    : Colors.pink,
                                  ),
                                ),
                              );
                            }),
                        Container(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            '${widget.pokemonModel.stats[index].stat.name}                                  ',
                            style:
                                TextStyle(color: Color.fromARGB(127, 0, 0, 0)),
                          ),
                        ),
                      ],
                    );
                  }),
            )
          ]),
        ));
  }
}
