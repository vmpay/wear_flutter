import 'package:flutter/widgets.dart';
import 'package:wear/wear.dart';

import 'active_watch_face.dart';
import 'ambient_watch_face.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (context, shape, child) {
        return AmbientMode(
          builder: (context, mode, child) {
            return mode == WearMode.active
                ? const ActiveWatchFace()
                : const AmbientWatchFace();
          },
        );
      },
    );
  }
}
