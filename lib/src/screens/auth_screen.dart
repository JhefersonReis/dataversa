import 'package:dataversa/src/controllers/auth_controller.dart';
import 'package:dataversa/src/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final authController = GetIt.I<AuthController>();

  @override
  void initState() {
    super.initState();
    authController.logged.listen(context, _handleLoginSignal);
  }

  void _handleLoginSignal() {
    if (authController.logged.value) {
      context.go('/home');
    }
  }

  void _login() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      authController.login(_userController.text, _passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container Logo
                  Container(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: const Column(
                      children: [
                        Text(
                          'DataVersa',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Sua ferramenta de pesquisa',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Container Formulário
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 40.0,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Input Email
                            CustomTextField(
                              controller: _userController,
                              icon: Icons.person,
                              label: 'Usuário',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Usuário não pode ser em branco';
                                }

                                return null;
                              },
                            ),

                            // Input Senha
                            CustomTextField(
                              controller: _passwordController,
                              icon: Icons.lock,
                              label: 'Senha',
                              isObscure: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Senha não pode ser em branco';
                                }
                                return null;
                              },
                            ),

                            // Botão Entrar
                            SizedBox(
                              height: 50.0,
                              child: Watch(
                                (context) => ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                  ),
                                  onPressed: authController.loading ? null : _login,
                                  child: authController.loading
                                      ? const SizedBox(
                                          height: 24.0,
                                          width: 24.0,
                                          child: CircularProgressIndicator(),
                                        )
                                      : const Text(
                                          'Entrar',
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 24.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
