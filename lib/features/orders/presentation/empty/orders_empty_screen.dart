import 'package:flutter_posui_pocket/ui/components/components.dart';
import 'package:flutter/material.dart';

class OrdersEmptyScreen extends StatelessWidget {
  const OrdersEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 24),
              child: Image.asset("assets/images/commons/empty.png", width: 200),
            ),
            AplazoText(
                textProps: TextProps(
                    paddingHorizontal: 0,
                    paddingVertical: 8,
                    text: "No hay ventas para mostrar",
                    type: TextType.head)),
            AplazoText(
                textProps: TextProps(
                    paddingHorizontal: 8,
                    paddingVertical: 8,
                    text: "Aún no has realizado ninguna venta.",
                    type: TextType.lightText))
          ],
        ),
      ),
    );
  }
}
