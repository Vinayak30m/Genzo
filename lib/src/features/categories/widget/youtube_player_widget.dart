import 'package:flutter/material.dart';
import 'package:genzo/src/res/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerControllerWidget extends StatefulWidget {
  final String videoUrl;

  const YoutubePlayerControllerWidget({Key? key, required this.videoUrl})
      : super(key: key);

  @override
  _YoutubePlayerControllerWidgetState createState() =>
      _YoutubePlayerControllerWidgetState();
}

class _YoutubePlayerControllerWidgetState
    extends State<YoutubePlayerControllerWidget> {
  late YoutubePlayerController _controller;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          _hasFocus = hasFocus;
          if (!_hasFocus) {
            _controller.pause();
          } else {
            _controller.play();
          }
        });
      },
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppColor.primaryColor.withOpacity(0.1)),
            child: ClipRRect(
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
                progressColors: ProgressBarColors(
                  playedColor: Colors.blue,
                  handleColor: Colors.blueAccent,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
