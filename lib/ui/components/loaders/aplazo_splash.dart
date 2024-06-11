import 'package:flutter_posui_pocket/ui/theme/theme_config.dart';
import 'package:flutter/material.dart';

class AplazoSplash extends StatefulWidget {
  final VoidCallback onFinishedAnimation;
  const AplazoSplash({super.key, required this.onFinishedAnimation});

  @override
  AplazoSplashState createState() => AplazoSplashState();
}

class AplazoSplashState extends State<AplazoSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> moverDerecha;
  late Animation<double> agrandar;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    moverDerecha = Tween(begin: 0.0, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceIn));
    agrandar = Tween(begin: 0.0, end: 20.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        widget.onFinishedAnimation();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Play / Reproducción
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (context, childRectangulo) {
        return Transform.translate(
            offset: Offset(0, moverDerecha.value),
            child:
                Transform.scale(scale: agrandar.value, child: childRectangulo));
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
          color: AppTheme.secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(300))),
    );
  }
}
