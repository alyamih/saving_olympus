import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:saving_olympus/model/level_item.dart';
import 'package:saving_olympus/model/user_item.dart';
import 'package:saving_olympus/pages/levels_page.dart';
import 'package:saving_olympus/pages/settings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FindAMatchGame extends StatefulWidget {
  const FindAMatchGame({super.key, required this.isMatchingGame});
  final bool isMatchingGame;

  @override
  State<FindAMatchGame> createState() => _FindAMatchGameState();
}

class _FindAMatchGameState extends State<FindAMatchGame> {
  int matchedCard = 0;
  @override
  void initState() {
    super.initState();
    getMatchGameSP(() {
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
                            height: findAMatchGame.currentLevel == 1 ||
                                    findAMatchGame.currentLevel == 2
                                ? 200
                                : 270,
                            width: findAMatchGame.currentLevel == 4 ||
                                    findAMatchGame.currentLevel == 5
                                ? 800
                                : 700,
                            child: GridView.builder(
                                itemCount: findAMatchGame.gameImg!.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: findAMatchGame.currentLevel ==
                                          3
                                      ? 6
                                      : findAMatchGame.currentLevel == 4
                                          ? 8
                                          : findAMatchGame.currentLevel == 2
                                              ? 6
                                              : findAMatchGame.currentLevel == 1
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
                                        //incrementing the clicks

                                        findAMatchGame.gameImg![index] =
                                            findAMatchGame.cards_list[index];
                                        findAMatchGame.matchCheck.add({
                                          index:
                                              findAMatchGame.cards_list[index]
                                        });
                                      });
                                      if (findAMatchGame.matchCheck.length ==
                                          2) {
                                        if (findAMatchGame
                                                .matchCheck[0].values.first ==
                                            findAMatchGame
                                                .matchCheck[1].values.first) {
                                          findAMatchGame.matchCheck.clear();
                                          matchedCard = matchedCard + 2;
                                          if (matchedCard ==
                                              findAMatchGame.gameImg!.length) {
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 1000), () {
                                              if (findAMatchGame.currentLevel ==
                                                  levelMatch1.levelNumber) {
                                                levelMatch1.isCompleted = true;
                                              } else if (findAMatchGame
                                                      .currentLevel ==
                                                  levelMatch2.levelNumber) {
                                                levelMatch2.isCompleted = true;
                                              } else if (findAMatchGame
                                                      .currentLevel ==
                                                  levelMatch3.levelNumber) {
                                                levelMatch3.isCompleted = true;
                                              } else if (findAMatchGame
                                                      .currentLevel ==
                                                  levelMatch4.levelNumber) {
                                                levelMatch4.isCompleted = true;
                                              } else if (findAMatchGame
                                                      .currentLevel ==
                                                  levelMatch5.levelNumber) {
                                                levelMatch5.isCompleted = true;
                                              }
                                              user.money = user.money! + 150;

                                              user.hp = user.hp! - 1;
                                              addSP(
                                                  levelMatch1,
                                                  levelMatch2,
                                                  levelMatch3,
                                                  levelMatch4,
                                                  levelMatch5,
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
                                              setState(() {});
                                            });
                                          }
                                        } else {
                                          Future.delayed(
                                              const Duration(milliseconds: 500),
                                              () {
                                            setState(() {
                                              findAMatchGame.gameImg![
                                                      findAMatchGame
                                                          .matchCheck[0]
                                                          .keys
                                                          .first] =
                                                  findAMatchGame.hiddenCard;
                                              findAMatchGame.gameImg![
                                                      findAMatchGame
                                                          .matchCheck[1]
                                                          .keys
                                                          .first] =
                                                  findAMatchGame.hiddenCard;
                                              findAMatchGame.matchCheck.clear();
                                            });
                                          });
                                        }
                                      }
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(16.0),
                                          decoration: BoxDecoration(
                                            color: findAMatchGame
                                                        .gameImg![index] !=
                                                    "assets/gameIcons/icon_container.png"
                                                ? const Color(0xFF2E95B5)
                                                : const Color(0xFFA319D3),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        findAMatchGame.gameImg![index] !=
                                                "assets/gameIcons/icon_container.png"
                                            ? Positioned(
                                                top: findAMatchGame
                                                            .currentLevel ==
                                                        1
                                                    ? 60
                                                    : findAMatchGame
                                                                .currentLevel ==
                                                            2
                                                        ? 35
                                                        : findAMatchGame
                                                                    .currentLevel ==
                                                                3
                                                            ? 35
                                                            : findAMatchGame.currentLevel ==
                                                                        4 ||
                                                                    findAMatchGame
                                                                            .currentLevel ==
                                                                        5
                                                                ? 25
                                                                : 35,
                                                child: Image.asset(
                                                  findAMatchGame
                                                      .gameImg![index],
                                                  scale: 1.5,
                                                ),
                                              )
                                            : Positioned(
                                                top: findAMatchGame
                                                                .currentLevel ==
                                                            4 ||
                                                        findAMatchGame
                                                                .currentLevel ==
                                                            5
                                                    ? -10
                                                    : findAMatchGame
                                                                .currentLevel ==
                                                            1
                                                        ? 20
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
    prefs.setString('levelMatch1', rawJson1);

    String rawJson2 = jsonEncode(levelMatch2!.toJson());
    prefs.setString('levelMatch2', rawJson2);

    String rawJson3 = jsonEncode(levelMatch3!.toJson());
    prefs.setString('levelMatch3', rawJson3);

    String rawJson4 = jsonEncode(levelMatch4!.toJson());
    prefs.setString('levelMatch4', rawJson4);

    String rawJson5 = jsonEncode(levelMatch5!.toJson());
    prefs.setString('levelMatch5', rawJson5);

    String rawJson6 = jsonEncode(user!.toJson());
    prefs.setString('user', rawJson6);
  }
}

void getMatchGameSP(Function() callback) async {
  final prefs = await SharedPreferences.getInstance();
  final rawJson1 = prefs.getString('levelMatch1') ?? '';
  final rawJson2 = prefs.getString('levelMatch2') ?? '';
  final rawJson3 = prefs.getString('levelMatch3') ?? '';
  final rawJson4 = prefs.getString('levelMatch4') ?? '';
  final rawJson5 = prefs.getString('levelMatch5') ?? '';
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
    levelMatch1 = LevelItem.fromJson(map1);
  }
  if (map2.isNotEmpty) {
    levelMatch2 = LevelItem.fromJson(map2);
  }
  if (map3.isNotEmpty) {
    levelMatch3 = LevelItem.fromJson(map3);
  }
  if (map4.isNotEmpty) {
    levelMatch4 = LevelItem.fromJson(map4);
  }

  if (map5.isNotEmpty) {
    levelMatch5 = LevelItem.fromJson(map5);
  }

  if (map6.isNotEmpty) {
    user = UserItem.fromJson(map6);
  }
  callback();
}
