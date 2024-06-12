import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/core/extensiones/build_extensions.dart';
import 'package:flutter_posui_pocket/features/nuevo_pedido/presentation/add_phone_number_screen.dart';
import 'package:flutter_posui_pocket/ui/components/cards/aplazo_sales_info_card.dart';
import 'package:flutter_posui_pocket/ui/components/navigations/aplazo_navbar.dart';
import 'package:flutter_posui_pocket/ui/components/buttons/aplazo_button.dart';
import 'package:flutter_posui_pocket/ui/components/cards/aplazo_container_card.dart';

class PanelScreen extends StatelessWidget {
  const PanelScreen({super.key});

  static const idScreen = 'Panel_screen';

  @override
  Widget build(BuildContext context) {
    return const PanelBody();
  }
}

class PanelBody extends StatelessWidget {
  const PanelBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                AplazoContainerCard(childrenContent: [
                  const AplazoSalesInfoCard(
                      text1: "\$25,999.00", text2: 'Total últimas 10 ventas'),
                  Container(
                    height:
                        1.0, // Ajusta la altura del separador según tus necesidades
                    color: Colors.white,
                  ),
                  const AplazoSalesInfoCard(
                      text1: "-\$2,599.00", text2: 'Comisiones'),
                  Container(
                    height:
                        1.0, // Ajusta la altura del separador según tus necesidades
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10.0),
                  const AplazoSalesInfoCard(
                      text1: "\$23,000.00", text2: 'Total a pagar'),
                  const SizedBox(
                    height: 10,
                  ),
                ], color: const Color(0xFF00E6F5))
              ]),
            ),
          )
        ],
      ),
      appBar: AplazoNavbar(
        navbarProps: NavbarProps(title: 'Panel'),
      ),
    );
  }
}
