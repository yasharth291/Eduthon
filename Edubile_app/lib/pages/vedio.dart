import 'package:auto_orientation/auto_orientation.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eduthon/pages/components/rounded_button.dart';
import 'package:video_player/video_player.dart';

class Vedio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoExample(),
    );
  }
}

class VideoExample extends StatefulWidget {
  VideoExample({this.title = 'Video'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<VideoExample> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.asset("assets/video.mp4");
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController1,
        aspectRatio: 3 / 2,
        autoPlay: true,
        looping: true,
        routePageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondAnimation, provider) {
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget child) {
              return VideoScaffold(
                child: Scaffold(
                  resizeToAvoidBottomPadding: false,
                  body: Container(
                    alignment: Alignment.center,
                    color: Colors.black,
                    child: provider,
                  ),
                ),
              );
            },
          );
        }
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(

        body: Column(
          children: <Widget>[
            Image.asset("assets/bg1.png"),
            Expanded(
              child: Center(
                child: Chewie(
                  controller: _chewieController,
                ),
              ),
            ),
            RoundedButton(
              press: () {
                _chewieController.enterFullScreen();
              },
              text: 'Fullscreen',
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _chewieController.dispose();
                        _videoPlayerController1.pause();
                        _videoPlayerController1.seekTo(Duration(seconds: 0));
                        _chewieController = ChewieController(
                          aspectRatio: 3 / 2,
                          autoPlay: true,
                          looping: true,
                        );
                      });
                    },
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class VideoScaffold extends StatefulWidget {
  const VideoScaffold({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() => _VideoScaffoldState();
}

class _VideoScaffoldState extends State<VideoScaffold> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    AutoOrientation.landscapeAutoMode();
    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    AutoOrientation.portraitAutoMode();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}