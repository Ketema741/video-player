import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_video_player_yt/src/video/presentation/screen/settings.dart';

import '../../data/models/video.dart';
import '../bloc/video_bloc.dart';
import '../widgets/bottom_navbar.dart';
import 'frequent_watched.dart';
import 'notification.dart';
import 'videos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<VideoModel> videos = [];

  @override
  void initState() {
    super.initState();

    final videoBloc = context.read<VideoBloc>();

    // Listen to the state changes in the VideoBloc
    videoBloc.stream.listen((state) {
      if (state is VideoLoadedState) {
        setState(() {
          videos = state.videos;
        });
      }
    });

    context.read<VideoBloc>().add(FetchAllVideosEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        actions: const [
          Icon(Icons.person)
        ],
      ),
      drawer: Drawer(
        child: Container(
            color: Colors.brown.shade400,
            child: ListView(
              children: const [
                DrawerHeader(
                  child: Center(
                    child: Text(
                      "LOGO",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Home page",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            )),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.brown.shade700,
                Colors.brown.shade200,
              ]),
        ),
        padding: const EdgeInsets.only(top: 50),
        child: Videos(videos: videos),
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
