import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:saving_olympus/pages/levels_page.dart';
import 'package:saving_olympus/pages/show_screen.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image.asset('assets/home.png')),
                          Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: Image.asset('assets/settings_head.png')),
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
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const ReadTermsOrPrivacyScreenView(
                                      link: 'google.com',
                                    )),
                          );
                        },
                        child: Image.asset('assets/privacy.png')),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const ReadTermsOrPrivacyScreenView(
                                      link: 'google.com',
                                    )),
                          );
                        },
                        child: Image.asset('assets/terms.png')),
                    Image.asset('assets/rate.png'),
                    Image.asset('assets/support.png'),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
