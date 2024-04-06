import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 1500;
  int lapse = 0;
  bool isRunning = false;
  late Timer timer;

  void onTick(t) {
    setState(() {
      if (totalSeconds == 1) {
        timer.cancel();
        totalSeconds = 1500;
        ++lapse;
        isRunning = false;
      } else {
        --totalSeconds;
      }
    });
  }

  void onStartPressed() {
    setState(() {
      isRunning = !isRunning;
    });
    if (isRunning) {
      timer = Timer.periodic(const Duration(seconds: 1), onTick);
    } else {
      timer.cancel();
    }
  }

  String convertTime({required int seconds}) {
    int minutes = seconds ~/ 60;
    return '${minutes.toString().padLeft(2, '0')}:${(seconds - minutes * 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                convertTime(seconds: totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: IconButton(
                onPressed: onStartPressed,
                icon: Icon(!isRunning
                    ? Icons.play_circle_outline
                    : Icons.pause_circle_outline),
                iconSize: 120,
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(50),
                        bottom: Radius.circular(0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                        Text(
                          lapse.toString(),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
