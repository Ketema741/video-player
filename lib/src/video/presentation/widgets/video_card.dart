import 'package:flutter/material.dart';
import 'package:flutter_video_player_yt/src/video/data/models/video.dart';
import 'package:flutter_video_player_yt/src/video/presentation/screen/video_player_screen.dart';
import 'package:flutter_video_player_yt/src/video/presentation/screen/videos.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key, required this.videos});
  final List<VideoModel> videos;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: SectionHeader(),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.27,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: videos.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(right: 10),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 500,
                      margin: const EdgeInsets.only(bottom: 10),
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: NetworkImage(
                            videos[index].videoThumbnail ?? "",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoPlayerScreen(
                              videoUrl: videos[index].videoUrl,
                            ),
                          ),
                        )
                      },
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.only(
                          bottom: 15,
                        ),
                        width: MediaQuery.of(context).size.width * 0.37,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white.withOpacity(0.8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 SizedBox(
                                  width: 100,
                                  child: Text(
                                    videos[index].videoTitle,
                                    style: const TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    videos[index].videoDescription?? "",
                                    style: const TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                            const Icon(Icons.play_circle)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
