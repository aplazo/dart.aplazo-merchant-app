import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_posui_pocket/ui/components/buttons/aplazo_button.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';
import 'package:flutter_posui_pocket/ui/components/inputs/aplazo_textfield.dart';
import 'package:flutter_posui_pocket/features/simple_register/bloc/register_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class SimpleRegisterScreen extends StatefulWidget {
  const SimpleRegisterScreen({super.key});

  static const idScreen = 'simple_registry_screen';

  @override
  State<SimpleRegisterScreen> createState() => _SimpleRegisterScreenState();
}

class _SimpleRegisterScreenState extends State<SimpleRegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController bussinessNameController = TextEditingController();
  TextEditingController rfcController = TextEditingController();
  TextEditingController industryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController clabeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterBloc(),
        child: SimpleRegisterView(
            bussinessNameController: bussinessNameController,
            industryController: industryController,
            rfcController: rfcController,
            phoneController: phoneController,
            clabeController: clabeController,
            emailController: emailController));
  }
}

class SimpleRegisterView extends StatelessWidget {
  const SimpleRegisterView({
    super.key,
    required this.bussinessNameController,
    required this.industryController,
    required this.rfcController,
    required this.phoneController,
    required this.clabeController,
    required this.emailController,
  });

  final TextEditingController bussinessNameController;
  final TextEditingController industryController;
  final TextEditingController rfcController;
  final TextEditingController phoneController;
  final TextEditingController clabeController;
  final TextEditingController emailController;

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
                                hintText: 'Nombre del comercio',
                                label: 'Ingresa el nombre tu comercio',
                                textFieldType: TextFieldType.normal),
                            onChanged: (text) {},
                            controller: bussinessNameController),
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
                                hintText: 'Giro del negocio',
                                label: 'Ingresa el giro de tu negocio',
                                textFieldType: TextFieldType.normal),
                            onChanged: (text) {},
                            controller: industryController),
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
                                textFieldType: TextFieldType.normal),
                            onChanged: (text) {},
                            controller: rfcController),
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
                                textFieldType: TextFieldType.phone),
                            onChanged: (text) {},
                            controller: phoneController),
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
                                hintText: 'Clabe interbancaria',
                                label: 'Ingresa tu clabe',
                                textFieldType: TextFieldType.number),
                            onChanged: (text) {},
                            controller: clabeController),
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
                            onChanged: (text) {
                              print("asd");
                            },
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
                      var allFieldsFilled = emailController.text.isNotEmpty &&
                          bussinessNameController.text.isNotEmpty &&
                          rfcController.text.isNotEmpty &&
                          industryController.text.isNotEmpty &&
                          phoneController.text.isNotEmpty &&
                          clabeController.text.isNotEmpty;
                      if (allFieldsFilled) {
                        BlocProvider.of<RegisterBloc>(context).add(
                            MerchantRegisterEvent(
                                bussinessNameController.text,
                                industryController.text,
                                rfcController.text,
                                phoneController.text,
                                emailController.text,
                                clabeController.text));
                      }
                    }),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
