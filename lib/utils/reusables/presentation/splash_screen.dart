import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_posui_pocket/ui/components/loaders/aplazo_splash.dart';
import 'package:flutter_posui_pocket/ui/theme/theme_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const idScreen = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AnimationController lottieController;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: AppTheme.highColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  void dispose() {
    super.dispose();

    SystemChrome.restoreSystemUIOverlays();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return _splashScreen();
  }

  Widget _splashScreen() {
    return Scaffold(
      backgroundColor: AppTheme.highColor,
      body: Stack(
        children: [
          Center(
            child: AplazoSplash(onFinishedAnimation: () {}),
          ),
          Center(
            child: Image.asset(
              "assets/images/logo/logo_splash_2.png",
              width: 50,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
