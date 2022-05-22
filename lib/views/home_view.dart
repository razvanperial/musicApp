import 'package:flutter/material.dart';
import 'package:musicapp/views/videoplayer_view.dart';
import 'package:musicapp/widgets/call_to_action.dart';

import 'choice_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CallToAction(
              title: 'Drums',
              route: VideoPlayerScreen(
                title1: 'assets/drums.mp4',
                title2: 'assets/drums.mp4',
                barTitle: 'Drums',
              ),
            ),
            const SizedBox(
              width: 300,
            ),
            CallToAction(
              title: 'Pick your artist :)',
              route: const ChoiceView(),
            ),
          ],
        ),
      ),
    );
  }
}
