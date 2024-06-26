import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_posui_pocket/core/extensiones/build_extensions.dart';
import 'package:flutter_posui_pocket/features/main_dashboard/presentation/main_dashboard_screen.dart';
import 'package:flutter_posui_pocket/features/nuevo_pedido/bloc/get_qr_bloc.dart';
import 'package:flutter_posui_pocket/ui/components/loaders/aplazo_loader.dart';
import 'package:provider/provider.dart';

import '../../../ui/components/buttons/aplazo_button.dart';
import '../../../ui/components/navigations/aplazo_navbar.dart';
import '../../../ui/components/texts/aplazo_text.dart';

class SuccessPedidoScreen extends StatefulWidget {
  const SuccessPedidoScreen({super.key});

  @override
  State<SuccessPedidoScreen> createState() => _SuccessPedidoScreenState();
}

class _SuccessPedidoScreenState extends State<SuccessPedidoScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
        child: MultiProvider(
          providers: [BlocProvider(create: (_) => GetQrBloc())],
          child: BlocBuilder<GetQrBloc, GetQrState>(builder: (context, state) {
            if (state is GetQrImageLoaded) {
              final Uint8List bytesImage =
                  const Base64Decoder().convert(state.imageInBase64);

              return Scaffold(
                appBar: AplazoNavbar(
                  navbarProps: NavbarProps(title: 'Pedido nuevo'),
                  backFuction: () {
                    context.materialPushAndRemoveUntil(
                        screen: const MainDashboardScreen());
                  },
                ),
                body: SafeArea(
                    child: Column(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        AplazoText(
                            textProps: TextProps(
                                text: 'Escanea el QR',
                                type: TextType.headlineSize24Weight700)),
                        const SizedBox(
                          height: 16,
                        ),
                        AplazoText(
                            textProps: TextProps(
                                text:
                                    'Pídele al cliente que escanee el QR con la\napp de aplazo para que pague',
                                type: TextType.headlineSize14Weight400)),
                        const SizedBox(
                          height: 16,
                        ),
                        Image.memory(
                          bytesImage,
                          width: 200,
                          height: 200,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AplazoText(
                            textProps: TextProps(
                                text: 'O envíale un link de pago por: ',
                                type: TextType.headlineSize14Weight400)),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            SizedBox(
                              height: 200,
                              width: 180,
                              child: Column(
                                children: [
                                  const Icon(Icons.whatshot),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  AplazoText(
                                      textProps: TextProps(
                                          text: "Whatsapp",
                                          type:
                                              TextType.headlineSize14Weight400))
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            SizedBox(
                              height: 200,
                              width: 180,
                              child: Column(
                                children: [
                                  const Icon(Icons.sms),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  AplazoText(
                                      textProps: TextProps(
                                          text: "SMS",
                                          type:
                                              TextType.headlineSize14Weight400))
                                ],
                              ),
                            ),
                            const Spacer()
                          ],
                        )
                      ],
                    )),
                    const SizedBox(
                      height: 8,
                    ),
                    AplazoButton(
                        buttonProps: ButtonProps(
                            text: 'ir a ordenes',
                            buttonType: ButtonType.primary),
                        onPressed: () {
                          context.materialPushAndRemoveUntil(
                              screen: const MainDashboardScreen());
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    AplazoButton(
                        buttonProps: ButtonProps(
                            text: 'Cerrar', buttonType: ButtonType.secondary),
                        onPressed: () {
                          context.materialPushAndRemoveUntil(
                              screen: const MainDashboardScreen());
                        }),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                )),
              );
            } else {
              return const AplazoLoader();
            }
          }),
        ),
        onWillPop: () async {
          context.materialPushAndRemoveUntil(
              screen: const MainDashboardScreen());
          return Future.value(false);
        });
  }
}
