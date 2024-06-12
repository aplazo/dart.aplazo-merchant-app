import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';

class AplazoAgentProgressCard extends StatelessWidget {
  const AplazoAgentProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 0, 0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    AplazoText(
                        textProps: TextProps(
                            multiAligment: TextAlign.left,
                            text: 'Resumen de Hoy',
                            type: TextType.headlineSize18Weight600White)),
                    const SizedBox(
                      height: 14,
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 14.0),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            AplazoText(
                textProps: TextProps(
                    text: 'Total de Ventas',
                    type: TextType.headlineSize16Weight400White)),
            AplazoText(
                textProps: TextProps(
                    text: '\$1,476.00',
                    type: TextType.headlineSize16Weight400White)),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            AplazoText(
                textProps: TextProps(
                    text: 'Número de pedidos',
                    type: TextType.headlineSize16Weight400White)),
            AplazoText(
                textProps: TextProps(
                    text: '2', type: TextType.headlineSize16Weight400White)),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            AplazoText(
                textProps: TextProps(
                    text: 'Ticket Promedio',
                    type: TextType.headlineSize16Weight400White)),
            AplazoText(
                textProps: TextProps(
                    text: '\$1250.00',
                    type: TextType.headlineSize16Weight400White)),
          ])
        ],
      ),
    );
  }
}
