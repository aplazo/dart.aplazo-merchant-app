import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/core/extensiones/build_extensions.dart';
import 'package:flutter_posui_pocket/features/nuevo_pedido/presentation/add_phone_number_screen.dart';
import 'package:flutter_posui_pocket/features/panel/presentation/panel_screen.dart';
import 'package:flutter_posui_pocket/features/ventas/presentation/ventas_screen.dart';
import 'package:flutter_posui_pocket/ui/components/buttons/aplazo_button.dart';
import 'package:flutter_posui_pocket/ui/components/cards/aplazo_agent_progress_card.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';
import 'package:flutter_svg/svg.dart';

import '../models/shortcuts.dart';

class MainDashboardScreen extends StatefulWidget {
  const MainDashboardScreen({super.key});

  static const String merchantImage = 'assets/images/merchant_logo.svg';

  static const idScreen = 'main_dashboard_screen';

  @override
  State<MainDashboardScreen> createState() => _MainDashboardScreenState();
}

class _MainDashboardScreenState extends State<MainDashboardScreen> {
  final shortcuts = [
    const Shortcut(
        name: 'Historicos',
        asset: 'assets/images/ic_ventas.svg',
        moveTo: 'ventas'),
    const Shortcut(
        name: 'Pedidos',
        asset: 'assets/images/ic_orders.svg',
        moveTo: 'ordenes'),
    const Shortcut(
        name: 'AplazoVersity',
        asset: 'assets/images/ic_aplazoversity.svg',
        moveTo: 'aplazoversity'),
    const Shortcut(
        name: 'Configuración',
        asset: 'assets/images/ic_info_comercio.svg',
        moveTo: 'edo'),
    const Shortcut(
        name: 'Soporte',
        asset: 'assets/images/ic_soporte.svg',
        moveTo: 'soporte'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AplazoText(
                          textProps: TextProps(
                              text: 'Hola, Adidas',
                              type: TextType.headlineSize24Weight700,
                              multiAligment: TextAlign.start,
                              aligment: Alignment.centerLeft,
                              paddingHorizontal: 16)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child:
                          SvgPicture.asset(MainDashboardScreen.merchantImage),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        AplazoText(
                            textProps: TextProps(
                                text: 'Tus ventas de hoy',
                                type: TextType.headlineSize14Weight400,
                                multiAligment: TextAlign.start,
                                aligment: Alignment.centerLeft,
                                paddingHorizontal: 16)),
                        AplazoText(
                            textProps: TextProps(
                                text: '\$2,123.00',
                                type: TextType.headlineSize24Weight700,
                                multiAligment: TextAlign.start,
                                aligment: Alignment.centerLeft,
                                paddingHorizontal: 16))
                      ],
                    )),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(
                          Icons.chevron_right,
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                      itemCount: shortcuts.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (context, index) =>
                          rowShortcut(shortcuts[index], (shortcut) {
                            handleShortcut(shortcut, context);
                          })),
                ),
                const AplazoAgentProgressCard(),
              ],
            ),
          )),
          AplazoButton(
              buttonProps: ButtonProps(
                  text: 'Nuevo pedido', buttonType: ButtonType.primary),
              onPressed: () {
                context.materialPush(screen: const AddPhoneNumberScreen());
              }),
          const SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }

  void handleShortcut(Shortcut shortcut, BuildContext context) {
    if (shortcut.moveTo == 'ordenes') {
      context.materialPush(screen: const PanelScreen());
    }

    if (shortcut.moveTo == 'ventas') {
      context.materialPush(screen: const VentasScreen());
    }
  }

  Widget rowShortcut(Shortcut shortcut, Function(Shortcut) onTapShortcut) {
    return GestureDetector(
      onTap: () {
        onTapShortcut.call(shortcut);
      },
      child: SizedBox(
        width: 60,
        height: 100,
        child: Column(
          children: [
            SvgPicture.asset(
              shortcut.asset,
              height: 50,
              width: 50,
            ),
            const SizedBox(
              height: 8,
            ),
            AplazoText(
                textProps: TextProps(
                    text: shortcut.name,
                    type: TextType.headlineSize12Weight500))
          ],
        ),
      ),
    );
  }
}
