import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

import 'ambient_watch_face.dart';

class NameScreen extends StatelessWidget {
  const NameScreen(this.screenHeight, this.screenWidth, {Key? key})
      : super(key: key);

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return AmbientMode(
      builder: (context, mode, child) => mode == WearMode.active
          ? NameScreenUI(screenHeight, screenWidth)
          : const AmbientWatchFace(),
    );
  }
}

class NameScreenUI extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const NameScreenUI(this.screenHeight, this.screenWidth, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: <Widget>[
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.arrow_back_outlined),
                    SizedBox(width: 5),
                    Text(
                      'Back',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              const Text(
                'Welcome to',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Expanded(
                child: Text(
                  'FlutterOS',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.blue[700],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  const snackBar = SnackBar(
                    content: Text(
                      'Yay! A SnackBar!',
                      textAlign: TextAlign.center,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text(
                  'NEXT',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
