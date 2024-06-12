import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/components/components.dart';
import 'package:flutter_posui_pocket/ui/theme/theme_config.dart';

import 'dart:async';

class AplazoLoader extends StatefulWidget {
  const AplazoLoader({super.key, this.type = AplazoLoaderType.normal});

  //bool isLoading;
  final AplazoLoaderType type;

  @override
  State<AplazoLoader> createState() => _AplazoLoaderState();
}

const _aplazoMessages = [
  'Estrenar se disfruta más pagando con aplazo',
  'Compra hoy y paga a plazos',
  'Explora y compra en miles de comercios afiliados',
  'Divide tus compras en pequeños pagos'
];

class _AplazoLoaderState extends State<AplazoLoader>
    with TickerProviderStateMixin {
  int position = 0;

  @override
  void initState() {
    if (widget.type == AplazoLoaderType.dynamic) {
      Timer.periodic(const Duration(seconds: 3), (timer) {
        if (position == _aplazoMessages.length - 1) {
          position = 0;
        }
        position += 1;
        //setState(() {});
      });
    }

    //controller.repeat(reverse: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          color: AppTheme.secondaryColor,
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.sizePadding),
          child: widget.type == AplazoLoaderType.home
              ? Image.asset(
                  _getImageSource(),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fitWidth,
                )
              : Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          _getImageSource(),
                          height: 150.0,
                          width: 300.0,
                        ),
                        if (widget.type == AplazoLoaderType.dynamic)
                          SizedBox(
                            height: 100,
                            child: AplazoText(
                                textProps: TextProps(
                                    text: _aplazoMessages[position],
                                    type: TextType.homeName)),
                          )
                        /*LinearProgressIndicator(
                value: controller.value,
                semanticsLabel: 'Linear progress indicator',
              )*/
                      ]),
                ),
        ),
      ),
    );
  }

  String _getImageSource() {
    const base = 'assets/gifs';
    switch (widget.type) {
      case AplazoLoaderType.cash:
        return '$base/cash.gif';
      case AplazoLoaderType.profile:
        return '$base/profile.gif';
      case AplazoLoaderType.orders:
        return '$base/orders.gif';
      case AplazoLoaderType.virtualcard:
        return '$base/vc.gif';
      case AplazoLoaderType.dynamic:
        return '$base/loader.gif';
      case AplazoLoaderType.normal:
        return '$base/loader.gif';
      case AplazoLoaderType.home:
        return '$base/landing.gif';
      case AplazoLoaderType.map:
        return '$base/map.gif';
      case AplazoLoaderType.signup:
        return '$base/signup.gif';
      case AplazoLoaderType.online:
        return '$base/online.gif';
      case AplazoLoaderType.offline:
        return '$base/offline.gif';
    }
  }
}

enum AplazoLoaderType {
  normal,
  orders,
  virtualcard,
  dynamic,
  profile,
  home,
  cash,
  map,
  signup,
  online,
  offline
}
