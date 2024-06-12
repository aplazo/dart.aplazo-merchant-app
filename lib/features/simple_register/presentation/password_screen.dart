import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/components/buttons/aplazo_button.dart';
import 'package:flutter_posui_pocket/ui/components/inputs/aplazo_textfield.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  static const idScreen = 'password_creation_screen';

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;
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
                              text: 'Ingresa tu contraseña!',
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
                                hintText: 'Password',
                                showPassword: showPassword,
                                suffixCustomWidget: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  icon: Icon(showPassword
                                      ? Icons.remove_red_eye_rounded
                                      : Icons.add_circle_outline),
                                ),
                                isPassword: true,
                                label: 'Ingresa tu contraseña',
                                textFieldType: TextFieldType.normal),
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
                    onPressed: () {}),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
