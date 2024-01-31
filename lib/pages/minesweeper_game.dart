import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:saving_olympus/model/level_item.dart';
import 'package:saving_olympus/model/user_item.dart';
import 'package:saving_olympus/pages/levels_page.dart';
import 'package:saving_olympus/pages/settings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MinesweeperGame extends StatefulWidget {
  const MinesweeperGame({super.key, required this.isMatchingGame});
  final bool isMatchingGame;

  @override
  State<MinesweeperGame> createState() => _MinesweeperGameState();
}

class _MinesweeperGameState extends State<MinesweeperGame> {
  String bombImage = '';
  int currentIndex = 100;
  List<String> checkedBlocks = [];
  @override
  void initState() {
    super.initState();
    getBombGameSP(() {
      setState(() {});
    });
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
                image: AssetImage('assets/background2.png'))),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: double.infinity,
              width: double.infinity,
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
                                  Navigator.pop(context);
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: minesweeperGame.currentLevel == 1 ||
                                    minesweeperGame.currentLevel == 2
                                ? 200
                                : 270,
                            width: minesweeperGame.currentLevel == 4 ||
                                    minesweeperGame.currentLevel == 5
                                ? 800
                                : 700,
                            child: GridView.builder(
                                itemCount: minesweeperGame.gameImg!.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: minesweeperGame
                                              .currentLevel ==
                                          3
                                      ? 6
                                      : minesweeperGame.currentLevel == 4
                                          ? 8
                                          : minesweeperGame.currentLevel == 2
                                              ? 6
                                              : minesweeperGame.currentLevel ==
                                                      1
                                                  ? 4
                                                  : 8,
                                  crossAxisSpacing: 16.0,
                                  mainAxisSpacing: 16.0,
                                ),
                                padding: const EdgeInsets.all(16.0),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        minesweeperGame.gameImg![index] =
                                            minesweeperGame.cards_list[index];
                                        currentIndex = index;
                                      });
                                      if (minesweeperGame.gameImg![index] ==
                                          "assets/bomb.png") {
                                        Future.delayed(
                                            const Duration(milliseconds: 500),
                                            () {
                                          user.hp = user.hp! - 1;
                                          addSP(
                                              levelBomb1,
                                              levelBomb2,
                                              levelBomb3,
                                              levelBomb4,
                                              levelBomb5,
                                              user);
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                    Navigator.of(context)
                                                        .pushReplacement(
                                                      MaterialPageRoute<void>(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              LevelsPage(
                                                                isMatchingGame:
                                                                    widget
                                                                        .isMatchingGame,
                                                              )),
                                                    );
                                                  },
                                                  child: Image.asset(
                                                      'assets/game_lost_popup.png'),
                                                );
                                              });
                                        });
                                      } else {
                                        Future.delayed(
                                            const Duration(milliseconds: 500),
                                            () {
                                          setState(() {
                                            checkedBlocks.add(minesweeperGame
                                                .gameImg![index]);
                                            if (checkedBlocks.length ==
                                                minesweeperGame
                                                        .cards_list.length -
                                                    1) {
                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 500), () {
                                                if (minesweeperGame
                                                        .currentLevel ==
                                                    levelBomb1.levelNumber) {
                                                  levelBomb1.isCompleted = true;
                                                } else if (minesweeperGame
                                                        .currentLevel ==
                                                    levelBomb2.levelNumber) {
                                                  levelBomb2.isCompleted = true;
                                                } else if (minesweeperGame
                                                        .currentLevel ==
                                                    levelBomb3.levelNumber) {
                                                  levelBomb3.isCompleted = true;
                                                } else if (minesweeperGame
                                                        .currentLevel ==
                                                    levelBomb4.levelNumber) {
                                                  levelBomb4.isCompleted = true;
                                                } else if (minesweeperGame
                                                        .currentLevel ==
                                                    levelBomb5.levelNumber) {
                                                  levelBomb5.isCompleted = true;
                                                }
                                                user.money = user.money! + 150;

                                                user.hp = user.hp! - 1;
                                                addSP(
                                                    levelBomb1,
                                                    levelBomb2,
                                                    levelBomb3,
                                                    levelBomb4,
                                                    levelBomb5,
                                                    user);
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                          Navigator.pop(
                                                              context);
                                                          Navigator.of(context)
                                                              .pushReplacement(
                                                            MaterialPageRoute<
                                                                    void>(
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    LevelsPage(
                                                                      isMatchingGame:
                                                                          widget
                                                                              .isMatchingGame,
                                                                    )),
                                                          );
                                                        },
                                                        child: Image.asset(
                                                            'assets/Popup.png'),
                                                      );
                                                    });
                                              });
                                            }
                                          });
                                        });
                                      }
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(16.0),
                                          decoration: BoxDecoration(
                                            color: minesweeperGame
                                                        .gameImg![index] !=
                                                    "assets/gameIcons/icon_container.png"
                                                ? const Color(0xFF2E95B5)
                                                : const Color(0xFFA319D3),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        minesweeperGame.gameImg![index] !=
                                                "assets/gameIcons/icon_container.png"
                                            ? Positioned(
                                                top: minesweeperGame
                                                            .currentLevel ==
                                                        1
                                                    ? 65
                                                    : minesweeperGame
                                                                .currentLevel ==
                                                            2
                                                        ? 35
                                                        : minesweeperGame
                                                                    .currentLevel ==
                                                                3
                                                            ? 35
                                                            : minesweeperGame
                                                                            .currentLevel ==
                                                                        4 ||
                                                                    minesweeperGame
                                                                            .currentLevel ==
                                                                        5
                                                                ? 25
                                                                : 35,
                                                child: Image.asset(
                                                  minesweeperGame
                                                      .gameImg![index],
                                                  scale: 1.5,
                                                ),
                                              )
                                            : Positioned(
                                                top: minesweeperGame
                                                                .currentLevel ==
                                                            4 ||
                                                        minesweeperGame
                                                                .currentLevel ==
                                                            5
                                                    ? -10
                                                    : minesweeperGame
                                                                .currentLevel ==
                                                            1
                                                        ? 30
                                                        : 0,
                                                child: Stack(
                                                  children: <Widget>[
                                                    Text(
                                                      '?',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily: 'Trispace',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 65,
                                                        foreground: Paint()
                                                          ..style =
                                                              PaintingStyle
                                                                  .stroke
                                                          ..strokeWidth = 6
                                                          ..color = const Color(
                                                              0Xff7C74C6),
                                                      ),
                                                    ),
                                                    // Solid text as fill.
                                                    const Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      '?',
                                                      style: TextStyle(
                                                        fontFamily: 'Trispace',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 65,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                      ],
                                    ),
                                  );
                                })),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addSP(
      LevelItem? levelMatch1,
      LevelItem? levelMatch2,
      LevelItem? levelMatch3,
      LevelItem? levelMatch4,
      LevelItem? levelMatch5,
      UserItem? user) async {
    final prefs = await SharedPreferences.getInstance();

    String rawJson1 = jsonEncode(levelMatch1!.toJson());
    prefs.setString('levelBomb1', rawJson1);

    String rawJson2 = jsonEncode(levelMatch2!.toJson());
    prefs.setString('levelBomb2', rawJson2);

    String rawJson3 = jsonEncode(levelMatch3!.toJson());
    prefs.setString('levelBomb3', rawJson3);

    String rawJson4 = jsonEncode(levelMatch4!.toJson());
    prefs.setString('levelBomb4', rawJson4);

    String rawJson5 = jsonEncode(levelMatch5!.toJson());
    prefs.setString('levelBomb5', rawJson5);

    String rawJson6 = jsonEncode(user!.toJson());
    prefs.setString('user', rawJson6);
  }
}

void getBombGameSP(Function() callback) async {
  final prefs = await SharedPreferences.getInstance();
  final rawJson1 = prefs.getString('levelBomb1') ?? '';
  final rawJson2 = prefs.getString('levelBomb2') ?? '';
  final rawJson3 = prefs.getString('levelBomb3') ?? '';
  final rawJson4 = prefs.getString('levelBomb4') ?? '';
  final rawJson5 = prefs.getString('levelBomb5') ?? '';
  final rawJson6 = prefs.getString('user') ?? '';
  Map<String, dynamic> map1 = {};
  Map<String, dynamic> map2 = {};
  Map<String, dynamic> map3 = {};
  Map<String, dynamic> map4 = {};
  Map<String, dynamic> map5 = {};
  Map<String, dynamic> map6 = {};
  if (rawJson1.isNotEmpty) {
    map1 = jsonDecode(rawJson1);
  }
  if (rawJson2.isNotEmpty) {
    map2 = jsonDecode(rawJson2);
  }
  if (rawJson3.isNotEmpty) {
    map3 = jsonDecode(rawJson3);
  }
  if (rawJson4.isNotEmpty) {
    map4 = jsonDecode(rawJson4);
  }

  if (rawJson5.isNotEmpty) {
    map5 = jsonDecode(rawJson5);
  }

  if (rawJson6.isNotEmpty) {
    map6 = jsonDecode(rawJson6);
  }
  if (map1.isNotEmpty) {
    levelBomb1 = LevelItem.fromJson(map1);
  }
  if (map2.isNotEmpty) {
    levelBomb2 = LevelItem.fromJson(map2);
  }
  if (map3.isNotEmpty) {
    levelBomb3 = LevelItem.fromJson(map3);
  }
  if (map4.isNotEmpty) {
    levelBomb4 = LevelItem.fromJson(map4);
  }

  if (map5.isNotEmpty) {
    levelBomb5 = LevelItem.fromJson(map5);
  }

  if (map6.isNotEmpty) {
    user = UserItem.fromJson(map6);
  }
  callback();
}
