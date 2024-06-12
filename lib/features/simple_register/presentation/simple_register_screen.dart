import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/core/extensiones/build_extensions.dart';
import 'package:flutter_posui_pocket/features/nuevo_pedido/presentation/add_phone_number_screen.dart';
import 'package:flutter_posui_pocket/features/panel/presentation/panel_screen.dart';
import 'package:flutter_posui_pocket/features/simple_register/presentation/password_screen.dart';
import 'package:flutter_posui_pocket/features/ventas/presentation/ventas_screen.dart';
import 'package:flutter_posui_pocket/ui/components/buttons/aplazo_button.dart';
import 'package:flutter_posui_pocket/ui/components/cards/aplazo_agent_progress_card.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';
import 'package:flutter_posui_pocket/ui/components/inputs/aplazo_textfield.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_posui_pocket/ui/components/buttons/aplazo_button.dart';

import '../models/shortcuts.dart';

class SimpleRegisterScreen extends StatefulWidget {
  const SimpleRegisterScreen({super.key});

  static const idScreen = 'main_dashboard_screen';

  @override
  State<SimpleRegisterScreen> createState() => _SimpleRegisterScreenState();
}

class _SimpleRegisterScreenState extends State<SimpleRegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                              text: 'Queremos conocerte!',
                              type: TextType.headlineSize24Weight700,
                              multiAligment: TextAlign.start,
                              aligment: Alignment.centerLeft,
                              paddingHorizontal: 16)),
                    ),
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
                        AplazoTextField(
                            textFieldProps: TextFieldProps(
                                hintText: 'Nombre',
                                label: 'Ingresa tu nombre',
                                textFieldType: TextFieldType.email),
                            onChanged: (text) {},
                            controller: emailController),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        AplazoTextField(
                            textFieldProps: TextFieldProps(
                                hintText: 'Razon social',
                                label: 'Ingresa tu razon social',
                                textFieldType: TextFieldType.email),
                            onChanged: (text) {},
                            controller: emailController),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        AplazoTextField(
                            textFieldProps: TextFieldProps(
                                hintText: 'RFC',
                                label: 'Ingresa tu RFC',
                                textFieldType: TextFieldType.email),
                            onChanged: (text) {},
                            controller: emailController),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        AplazoTextField(
                            textFieldProps: TextFieldProps(
                                hintText: 'Telefono',
                                label: 'Ingresa tu telefono',
                                textFieldType: TextFieldType.email),
                            onChanged: (text) {},
                            controller: emailController),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        AplazoTextField(
                            textFieldProps: TextFieldProps(
                                hintText: 'Correo',
                                label: 'Ingresa tu correo',
                                textFieldType: TextFieldType.email),
                            onChanged: (text) {},
                            controller: emailController),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    )),
                  ],
                ),
                AplazoButton(
                    buttonProps: ButtonProps(
                        text: 'Continuar', buttonType: ButtonType.primary),
                    onPressed: () {
                      context.materialPushAndRemoveUntil(
                          screen: PasswordScreen());
                    }),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
