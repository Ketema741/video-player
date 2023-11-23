import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_video_player_yt/locator.dart' as di;

import 'core/router/app_router.dart';
import 'src/video/presentation/bloc/video_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<VideoBloc>()..add(FetchAllVideosEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Video Player',
        initialRoute: AppRouter.splash,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 0.9),
            textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
                displayLarge: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ))),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
