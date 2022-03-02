import 'dart:math';

import 'package:cow_burger/app/core/ui/cow_state.dart';
import 'package:cow_burger/app/core/ui/cow_ui.dart';
import 'package:cow_burger/app/core/ui/widgets/cow_appbar.dart';
import 'package:cow_burger/app/core/ui/widgets/cow_button.dart';
import 'package:cow_burger/app/core/ui/widgets/cow_textformfield.dart';
import 'package:cow_burger/app/modules/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends CowState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEc = TextEditingController();
  final _emailEc = TextEditingController();
  final _passwordEC = TextEditingController();
  // final = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailEc.dispose();
    _nameEc.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CowAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Registrar',
                    style: context.textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.primaryColorDark),
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o seu cadastro.',
                    style: context.textTheme.bodyText1
                        ?.copyWith(color: context.theme.primaryColorDark),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CowTextformfield(
                    label: 'Nome',
                    controller: _nameEc,
                    validator: Validatorless.required('Nome Obrigatório'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CowTextformfield(
                    label: 'E-mail',
                    controller: _emailEc,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail Obrigatório'),
                      Validatorless.email('E-mail Inválido')
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CowTextformfield(
                    label: 'Senha',
                    obscureText: true,
                    controller: _passwordEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha Obrigatória'),
                      Validatorless.min(6, 'Digite ao menos 6 digitos')
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CowTextformfield(
                    label: 'Confirma Senha',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Confirma Senha Obrigatória'),
                      Validatorless.compare(_passwordEC, 'Senhas Diferentes')
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: CowButton(
                      onPress: () {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          controller.register(
                              name: _nameEc.text,
                              email: _emailEc.text,
                              password: _passwordEC.text);
                        }
                      },
                      label: 'Cadastrar',
                      width: context.width,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
