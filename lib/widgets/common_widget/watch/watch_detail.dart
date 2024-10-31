import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchDetail extends StatefulWidget {
  final Map<String, dynamic> watch;
  const WatchDetail({super.key, required this.watch});

  @override
  State<WatchDetail> createState() => _YoutubeState();
}

class _YoutubeState extends State<WatchDetail> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Sử dụng widget.watch để truy cập thuộc tính watch của WatchDetail
    final videoID = YoutubePlayer.convertUrlToId(widget.watch['LinkYoutube']);

    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watch'),
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () => debugPrint('ready'),
            bottomActions: [
              CurrentPosition(),
              ProgressBar(
                isExpanded: true,
                colors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
              ),
              const PlaybackSpeedButton(),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            widget.watch['Title'],
            style: const TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
