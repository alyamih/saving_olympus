import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:saving_olympus/pages/levels_page.dart';
import 'package:saving_olympus/pages/pick_a_game.dart';
import 'package:saving_olympus/pages/settings_page.dart';

class ComplexityPage extends StatefulWidget {
  const ComplexityPage({super.key, required this.isMatchingGame});
  final bool isMatchingGame;

  @override
  State<ComplexityPage> createState() => _ComplexityPageState();
}

class _ComplexityPageState extends State<ComplexityPage> {
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
          // make sure we apply clip it properly
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
                                              const PickAGame()),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          LevelsPage(
                                            isMatchingGame:
                                                widget.isMatchingGame,
                                          )),
                                );
                              },
                              child: Image.asset('assets/simple.png')),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          LevelsPage(
                                            isMatchingGame:
                                                widget.isMatchingGame,
                                          )),
                                );
                              },
                              child: Image.asset('assets/middle.png')),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          LevelsPage(
                                            isMatchingGame:
                                                widget.isMatchingGame,
                                          )),
                                );
                              },
                              child: Image.asset('assets/advanced.png')),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
