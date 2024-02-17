import 'package:flutter/material.dart';
import 'package:genzo/src/res/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class YoutubePlayerControllerWidget extends StatefulWidget {
  final String categoryTitle;

  const YoutubePlayerControllerWidget({Key? key, required this.categoryTitle});

  @override
  _YoutubePlayerControllerWidgetState createState() =>
      _YoutubePlayerControllerWidgetState();
}

class _YoutubePlayerControllerWidgetState
    extends State<YoutubePlayerControllerWidget> {
  late YoutubePlayerController _controller;
  bool _hasFocus = false;
  String? videoUrl;

  @override
  void initState() {
    super.initState();
    _fetchVideoUrl();
  }

  Future<void> _fetchVideoUrl() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('categoriesvideo')
        .where('category', isEqualTo: widget.categoryTitle)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final data = snapshot.docs.first.data();
      setState(() {
        videoUrl = data['video'];
        _controller = YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(videoUrl!) ?? '',
          flags: const YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
          ),
        );
      });
    }
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
