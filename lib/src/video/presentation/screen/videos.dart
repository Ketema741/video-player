import 'package:flutter/material.dart';
import 'package:flutter_video_player_yt/src/video/data/models/video.dart';
import 'package:flutter_video_player_yt/src/video/presentation/screen/video_player_screen.dart';
import 'package:flutter_video_player_yt/src/video/presentation/widgets/video_card.dart';

class Videos extends StatefulWidget {
  final List<VideoModel> videos;
  const Videos({super.key, required this.videos});

  @override
  State<Videos> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<Videos> {
  @override
  Widget build(BuildContext context) {
    if (widget.videos.isNotEmpty) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [const DiscoverVideo(), VideoCard(videos: widget.videos)],
          ),
        ),
      );
    }

    return const CircularProgressIndicator();
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Trending Music",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "View more",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class DiscoverVideo extends StatelessWidget {
  const DiscoverVideo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Enjoy your favorite music",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search...',
              hintStyle: TextStyle(
                fontSize: 20,
                color: Colors.grey.shade400,
              ),
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
