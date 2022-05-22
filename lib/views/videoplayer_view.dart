import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  String title1;
  String title2;
  String barTitle;
  VideoPlayerScreen(
      {super.key,
      required this.title1,
      required this.title2,
      required this.barTitle});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  late Future<void> _initializeVideoPlayerFuture1;
  late Future<void> _initializeVideoPlayerFuture2;

  @override
  void initState() {
    super.initState();
    _controller1 = VideoPlayerController.asset(
      widget.title1,
    );
    _controller2 = VideoPlayerController.asset(
      widget.title2,
    );

    _initializeVideoPlayerFuture1 = _controller1.initialize();
    _initializeVideoPlayerFuture2 = _controller2.initialize();

    _controller1.setLooping(true);
    _controller2.setLooping(true);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.barTitle),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: _initializeVideoPlayerFuture1,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _controller1.value.aspectRatio / 1.5,
                  child: VideoPlayer(_controller1),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          const SizedBox(width: 200),
          FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              setState(() {
                if (_controller1.value.isPlaying) {
                  _controller1.pause();
                  _controller2.pause();
                } else {
                  _controller1.play();
                  _controller2.play();
                }
              });
            },
            child: Icon(
              _controller1.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
          const SizedBox(width: 200),
          FutureBuilder(
            future: _initializeVideoPlayerFuture2,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _controller2.value.aspectRatio / 1.5,
                  child: VideoPlayer(_controller2),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
