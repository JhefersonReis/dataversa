import 'package:dataversa/src/controllers/auth_controller.dart';
import 'package:dataversa/src/helpers/helpers.dart';
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

  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
    _passwordController.dispose();
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
      // authController.simulateLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container Logo
              Container(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Image.asset(
                  'assets/logo_dataversa.png',
                  height: 90.0,
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
                          onTapOutside: (_) => context.unfocus(),
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
                          onTapOutside: (_) => context.unfocus(),
                          onFieldSubmitted: (p0) => _login(),
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
                                  borderRadius: BorderRadius.circular(4),
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
                'assets/logo_versatec.png',
                height: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
