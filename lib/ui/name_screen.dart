import 'dart:io';

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
  Widget build(BuildContext context) => WatchShape(
        builder: (context, shape, child) => Scaffold(
          body: Center(
            child: Container(
              color: Colors.grey,
              height: screenHeight,
              width: screenWidth,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(Icons.arrow_back_outlined),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Back',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                        ),
                        if (shape == WearShape.round)
                          const Icon(Icons.access_time)
                        else
                          const Icon(Icons.crop_square)
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
                      child: Row(
                    children: [
                      Text(
                        'Flutter',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.blue[700],
                        ),
                      ),
                      if (Platform.isAndroid)
                        Expanded(
                            child: Icon(
                          Icons.android,
                          color: Colors.blue[700],
                        ))
                      else
                        Expanded(
                            child: Icon(Icons.phone_iphone,
                                color: Colors.blue[700])),
                      Text(
                        'OS',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.blue[700],
                        ),
                      ),
                    ],
                  )),
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
        ),
      );
}
