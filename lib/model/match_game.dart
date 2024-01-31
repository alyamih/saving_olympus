import 'package:flutter/material.dart';

class GameModel {
  List<String>? gameImg;
  int? currentLevel;

  final String hiddenCard = "assets/gameIcons/icon_container.png";
  List<String> cards_list = [];
  int? cardCount;
  List<Map<int, String>> matchCheck = [];

  //methods
  void initGame() {
    gameImg = List.generate(cardCount!, (index) => hiddenCard);
  }

  void initCards() {
    if (currentLevel == 1) {
      cardCount = 4;
      cards_list = [
        "assets/gameIcons/watch.png",
        "assets/gameIcons/brilliant.png",
        "assets/gameIcons/brilliant.png",
        "assets/gameIcons/watch.png",
      ];
    } else if (currentLevel == 2) {
      cardCount = 6;
      cards_list = [
        "assets/gameIcons/refresh.png",
        "assets/gameIcons/present.png",
        "assets/gameIcons/bomb2.png",
        "assets/gameIcons/present.png",
        "assets/gameIcons/bomb2.png",
        "assets/gameIcons/refresh.png",
      ];
    } else if (currentLevel == 3) {
      cardCount = 12;
      cards_list = [
        "assets/gameIcons/chest.png",
        "assets/gameIcons/open_mail.png",
        "assets/gameIcons/lightning.png",
        "assets/gameIcons/crown.png",
        "assets/gameIcons/lightning.png",
        "assets/gameIcons/chest.png",
        "assets/gameIcons/open_mail.png",
        "assets/gameIcons/crown.png",
        "assets/gameIcons/open_mail.png",
        "assets/gameIcons/chest.png",
        "assets/gameIcons/chest.png",
        "assets/gameIcons/open_mail.png",
      ];
    } else if (currentLevel == 4) {
      cardCount = 16;
      cards_list = [
        "assets/gameIcons/chest.png",
        "assets/gameIcons/flag.png",
        "assets/gameIcons/present.png",
        "assets/gameIcons/bomb2.png",
        "assets/gameIcons/hourglass.png",
        "assets/gameIcons/watch.png",
        "assets/gameIcons/flag.png",
        "assets/gameIcons/present.png",
        "assets/gameIcons/open_mail.png",
        "assets/gameIcons/chest.png",
        "assets/gameIcons/watch.png",
        "assets/gameIcons/hourglass.png",
        "assets/gameIcons/open_mail.png",
        "assets/gameIcons/chest.png",
        "assets/gameIcons/bomb2.png",
        "assets/gameIcons/chest.png",
      ];
    } else if (currentLevel == 5) {
      cardCount = 16;
      cards_list = [
        "assets/gameIcons/chest.png",
        "assets/gameIcons/present.png",
        "assets/gameIcons/bomb2.png",
        "assets/gameIcons/open_mail.png",
        "assets/gameIcons/hourglass.png",
        "assets/gameIcons/watch.png",
        "assets/gameIcons/flag.png",
        "assets/gameIcons/bomb2.png",
        "assets/gameIcons/present.png",
        "assets/gameIcons/chest.png",
        "assets/gameIcons/flag.png",
        "assets/gameIcons/watch.png",
        "assets/gameIcons/hourglass.png",
        "assets/gameIcons/chest.png",
        "assets/gameIcons/open_mail.png",
        "assets/gameIcons/chest.png",
      ];
    }
  }
}
