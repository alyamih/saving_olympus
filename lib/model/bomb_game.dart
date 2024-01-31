import 'package:flutter/material.dart';

class Game {
  List<String>? gameImg;
  int? currentLevel;

  final String hiddenCardpath = "assets/gameIcons/icon_container.png";
  List<String> cards_list = [];
  List<Map<int, String>> matchCheck = [];
  int? cardCount;

  //methods
  void initGame() {
    gameImg = List.generate(cardCount!, (index) => hiddenCardpath);
  }

  void initCardsList() {
    if (currentLevel == 1) {
      cardCount = 4;
      cards_list = [
        "assets/check.png",
        "assets/check.png",
        "assets/bomb.png",
        "assets/check.png",
      ];
    } else if (currentLevel == 2) {
      cardCount = 6;
      cards_list = [
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/bomb.png",
      ];
    } else if (currentLevel == 3) {
      cardCount = 12;
      cards_list = [
        "assets/check.png",
        "assets/check.png",
        "assets/bomb.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
      ];
    } else if (currentLevel == 4) {
      cardCount = 16;
      cards_list = [
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/bomb.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
      ];
    } else if (currentLevel == 5) {
      cardCount = 16;
      cards_list = [
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/bomb.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
        "assets/check.png",
      ];
    }
  }
}
