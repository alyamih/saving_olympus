import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saving_olympus/model/match_game.dart';
import 'package:saving_olympus/model/bomb_game.dart';
import 'package:saving_olympus/model/level_item.dart';
import 'package:saving_olympus/model/user_item.dart';
import 'package:saving_olympus/pages/complexity_page.dart';
import 'package:saving_olympus/pages/fina_a_match_game.dart';
import 'package:saving_olympus/pages/minesweeper_game.dart';
import 'package:saving_olympus/pages/settings_page.dart';

LevelItem levelMatch1 = LevelItem(levelNumber: 1, isCompleted: false);
LevelItem levelMatch2 = LevelItem(levelNumber: 2, isCompleted: false);
LevelItem levelMatch3 = LevelItem(levelNumber: 3, isCompleted: false);
LevelItem levelMatch4 = LevelItem(levelNumber: 4, isCompleted: false);
LevelItem levelMatch5 = LevelItem(levelNumber: 5, isCompleted: false);
LevelItem levelBomb1 = LevelItem(levelNumber: 1, isCompleted: false);
LevelItem levelBomb2 = LevelItem(levelNumber: 2, isCompleted: false);
LevelItem levelBomb3 = LevelItem(levelNumber: 3, isCompleted: false);
LevelItem levelBomb4 = LevelItem(levelNumber: 4, isCompleted: false);
LevelItem levelBomb5 = LevelItem(levelNumber: 5, isCompleted: false);
UserItem user = UserItem(money: 0, hp: 5);
GameModel findAMatchGame = GameModel();
Game minesweeperGame = Game();

class LevelsPage extends StatefulWidget {
  const LevelsPage({super.key, required this.isMatchingGame});
  final bool isMatchingGame;

  @override
  State<LevelsPage> createState() => _LevelsPageState();
}

class _LevelsPageState extends State<LevelsPage> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(minutes: 60),
      (timer) {
        /// callback will be executed every 1 second, increament a count value
        /// on each callback
        if (user.hp! < 5) {
          setState(() {
            user.hp = user.hp! + 1;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/background2.png',
                ))),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
                alignment: Alignment.center,
                color: Colors.black.withOpacity(0.3),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              ComplexityPage(
                                                isMatchingGame:
                                                    widget.isMatchingGame,
                                              )),
                                    );
                                  },
                                  child: Image.asset('assets/home.png')),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              const SettingsPage()),
                                    );
                                  },
                                  child: Image.asset('assets/Settings.png')),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Stack(
                              children: <Widget>[
                                Text(
                                  widget.isMatchingGame
                                      ? 'MATCH PAIRS'
                                      : 'MINESWEEPER',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Trispace',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 40,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 6
                                      ..color = const Color(0Xff7C74C6),
                                  ),
                                ),
                                // Solid text as fill.
                                Text(
                                  textAlign: TextAlign.center,
                                  widget.isMatchingGame
                                      ? 'MATCH PAIRS'
                                      : 'MINESWEEPER',
                                  style: const TextStyle(
                                    fontFamily: 'Trispace',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                clipBehavior: Clip.none,
                                children: [
                                  Image.asset('assets/hearts.png'),
                                  Stack(
                                    children: <Widget>[
                                      Text(
                                        '${user.hp}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Trispace',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 6
                                            ..color = const Color(0Xff7C74C6),
                                        ),
                                      ),
                                      // Solid text as fill.
                                      Text(
                                        textAlign: TextAlign.center,
                                        '${user.hp}',
                                        style: const TextStyle(
                                          fontFamily: 'Trispace',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Stack(
                                alignment: Alignment.center,
                                clipBehavior: Clip.none,
                                children: [
                                  Image.asset('assets/money.png'),
                                  Positioned(
                                    right: 20,
                                    child: Stack(
                                      children: <Widget>[
                                        Text(
                                          '${user.money}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Trispace',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 6
                                              ..color = const Color(0Xff7C74C6),
                                          ),
                                        ),
                                        // Solid text as fill.
                                        Text(
                                          textAlign: TextAlign.center,
                                          '${user.money}',
                                          style: const TextStyle(
                                            fontFamily: 'Trispace',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                if (user.hp != 0) {
                                  if (widget.isMatchingGame) {
                                    findAMatchGame.currentLevel =
                                        levelMatch1.levelNumber;
                                    findAMatchGame.initCards();
                                    findAMatchGame.initGame();
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              FindAMatchGame(
                                                isMatchingGame:
                                                    widget.isMatchingGame,
                                              )),
                                    );
                                  } else {
                                    minesweeperGame.currentLevel =
                                        levelBomb1.levelNumber;
                                    minesweeperGame.initCardsList();
                                    minesweeperGame.initGame();
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              MinesweeperGame(
                                                isMatchingGame:
                                                    widget.isMatchingGame,
                                              )),
                                    );
                                  }
                                } else {
                                  hpDialog(context);
                                }
                              },
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    'assets/start_level.png',
                                    scale: 1.2,
                                  ),
                                  const Positioned(
                                    top: 20,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      '1',
                                      style: TextStyle(
                                        fontFamily: 'Trispace',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 60,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (user.hp != 0) {
                                  if (widget.isMatchingGame) {
                                    findAMatchGame.currentLevel =
                                        levelMatch2.levelNumber;
                                    findAMatchGame.initCards();
                                    findAMatchGame.initGame();
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              FindAMatchGame(
                                                isMatchingGame:
                                                    widget.isMatchingGame,
                                              )),
                                    );
                                  } else {
                                    minesweeperGame.currentLevel =
                                        levelBomb2.levelNumber;
                                    minesweeperGame.initCardsList();
                                    minesweeperGame.initGame();
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              MinesweeperGame(
                                                isMatchingGame:
                                                    widget.isMatchingGame,
                                              )),
                                    );
                                  }
                                } else {
                                  hpDialog(context);
                                }
                              },
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    widget.isMatchingGame
                                        ? levelMatch1.isCompleted!
                                            ? 'assets/start_level.png'
                                            : 'assets/closed_level.png'
                                        : levelBomb1.isCompleted!
                                            ? 'assets/start_level.png'
                                            : 'assets/closed_level.png',
                                    scale: 1.2,
                                  ),
                                  const Positioned(
                                    top: 20,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      '2',
                                      style: TextStyle(
                                        fontFamily: 'Trispace',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 60,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (user.hp != 0) {
                                  if (widget.isMatchingGame) {
                                    findAMatchGame.currentLevel =
                                        levelMatch3.levelNumber;
                                    findAMatchGame.initCards();
                                    findAMatchGame.initGame();
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              FindAMatchGame(
                                                isMatchingGame:
                                                    widget.isMatchingGame,
                                              )),
                                    );
                                  } else {
                                    minesweeperGame.currentLevel =
                                        levelBomb3.levelNumber;
                                    minesweeperGame.initCardsList();
                                    minesweeperGame.initGame();
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              MinesweeperGame(
                                                isMatchingGame:
                                                    widget.isMatchingGame,
                                              )),
                                    );
                                  }
                                } else {
                                  hpDialog(context);
                                }
                              },
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    widget.isMatchingGame
                                        ? levelMatch2.isCompleted!
                                            ? 'assets/start_level.png'
                                            : 'assets/closed_level.png'
                                        : levelBomb2.isCompleted!
                                            ? 'assets/start_level.png'
                                            : 'assets/closed_level.png',
                                    scale: 1.2,
                                  ),
                                  const Positioned(
                                    top: 20,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      '3',
                                      style: TextStyle(
                                        fontFamily: 'Trispace',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 60,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (user.hp != 0) {
                                  if (widget.isMatchingGame) {
                                    findAMatchGame.currentLevel =
                                        levelMatch4.levelNumber;
                                    findAMatchGame.initCards();
                                    findAMatchGame.initGame();
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              FindAMatchGame(
                                                isMatchingGame:
                                                    widget.isMatchingGame,
                                              )),
                                    );
                                  } else {
                                    minesweeperGame.currentLevel =
                                        levelBomb4.levelNumber;
                                    minesweeperGame.initCardsList();
                                    minesweeperGame.initGame();
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              MinesweeperGame(
                                                isMatchingGame:
                                                    widget.isMatchingGame,
                                              )),
                                    );
                                  }
                                } else {
                                  hpDialog(context);
                                }
                              },
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    widget.isMatchingGame
                                        ? levelMatch3.isCompleted!
                                            ? 'assets/start_level.png'
                                            : 'assets/closed_level.png'
                                        : levelBomb3.isCompleted!
                                            ? 'assets/start_level.png'
                                            : 'assets/closed_level.png',
                                    scale: 1.2,
                                  ),
                                  const Positioned(
                                    top: 20,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      '4',
                                      style: TextStyle(
                                        fontFamily: 'Trispace',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 60,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (user.hp != 0) {
                                  if (widget.isMatchingGame) {
                                    findAMatchGame.currentLevel =
                                        levelMatch5.levelNumber;
                                    findAMatchGame.initCards();
                                    findAMatchGame.initGame();
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              FindAMatchGame(
                                                isMatchingGame:
                                                    widget.isMatchingGame,
                                              )),
                                    );
                                  } else {
                                    minesweeperGame.currentLevel =
                                        levelBomb5.levelNumber;
                                    minesweeperGame.initCardsList();
                                    minesweeperGame.initGame();
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              MinesweeperGame(
                                                isMatchingGame:
                                                    widget.isMatchingGame,
                                              )),
                                    );
                                  }
                                } else {
                                  hpDialog(context);
                                }
                              },
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    widget.isMatchingGame
                                        ? levelMatch4.isCompleted!
                                            ? 'assets/start_level.png'
                                            : 'assets/closed_level.png'
                                        : levelBomb4.isCompleted!
                                            ? 'assets/start_level.png'
                                            : 'assets/closed_level.png',
                                    scale: 1.2,
                                  ),
                                  const Positioned(
                                    top: 20,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      '5',
                                      style: TextStyle(
                                        fontFamily: 'Trispace',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 60,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }

  void hpDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              'Not enough HP.',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 17,
              ),
            ),
            content: Text(
              'Please, wait an hour.',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 17,
              ),
            ),
            actions: [
              Card(
                color: Colors.transparent,
                elevation: 0.0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                        child: const Text(
                          'Ok',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
