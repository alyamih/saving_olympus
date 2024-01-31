import 'package:flutter/material.dart';
import 'package:saving_olympus/pages/pick_a_game.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.bottomRight,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/background.png'))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: count == 0
                                  ? Image.asset('assets/text1.png')
                                  : count == 1
                                      ? Image.asset('assets/text2.png')
                                      : count == 2
                                          ? Image.asset('assets/text3.png')
                                          : Image.asset('assets/text4.png'),
                            ),
                            InkWell(
                              onTap: () {
                                if (count < 3) {
                                  count++;
                                  setState(() {});
                                } else {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const PickAGame()),
                                  );
                                }
                              },
                              child: Image.asset('assets/continue.png'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Image.asset('assets/zeus.png'),
          ],
        ),
      ),
    );
  }
}
