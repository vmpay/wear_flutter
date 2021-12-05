import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

import 'name_screen.dart';
import 'watch_utils.dart';

class ActiveWatchFace extends StatelessWidget {
  const ActiveWatchFace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WatchShape(
        builder: (context, shape, child) {
          var screenSize = MediaQuery.of(context).size;
          if (shape == WearShape.round) {
            screenSize = Size(boxInsetLength(screenSize.width),
                boxInsetLength(screenSize.height));
          }
          var screenHeight = screenSize.height;
          var screenWidth = screenSize.width;

          return Center(
            child: Container(
              color: Colors.white,
              height: screenSize.height,
              width: screenSize.width,
              child: Column(
                children: <Widget>[
                  const Expanded(child: FlutterLogo(size: 60)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return NameScreen(screenHeight, screenWidth);
                      }));
                    },
                    child: const Text(
                      'START',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
