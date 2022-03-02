import 'package:cow_burger/app/core/ui/cow_state.dart';
import 'package:cow_burger/app/core/ui/cow_ui.dart';
import 'package:cow_burger/app/core/ui/widgets/cow_appbar.dart';
import 'package:cow_burger/app/core/ui/widgets/cow_button.dart';
import 'package:cow_burger/app/core/ui/widgets/cow_textformfield.dart';
import 'package:cow_burger/app/modules/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends CowState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: context.textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.theme.primaryColorDark),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CowTextformfield(
                          label: 'E-mail',
                          controller: _emailEC,
                          validator: Validatorless.multiple([
                            Validatorless.email('Digite um E-mail válido'),
                            Validatorless.required(
                                'Digite um email obrigatório'),
                          ]),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CowTextformfield(
                          label: 'Senha',
                          controller: _passwordEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('Senha obrigatória'),
                            Validatorless.min(6, 'Digite ao menos 6 digitos'),
                          ]),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: CowButton(
                            onPress: () {
                              final formValid =
                                  _formKey.currentState?.validate() ?? false;
                              if (formValid) {
                                controller.login(
                                    email: _emailEC.text,
                                    password: _passwordEC.text);
                              }
                            },
                            label: 'Entrar',
                            width: context.width,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Não Possui uma conta?'),
                            TextButton(
                              onPressed: () => Get.toNamed('/auth/register'),
                              child: const Text(
                                'Cadastre-se',
                                style: CowUI.textBold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
