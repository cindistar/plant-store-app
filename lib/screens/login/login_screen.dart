import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../helpers/validators.dart';
import '../../models/user.dart';
import '../../models/user_manager.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Login',
            style: TextStyle(
              color: Color(0xFF8F928F),
              fontSize: 20,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 26),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/signup');
              },
              child: const Text(
                'Create an account',
                style: TextStyle(
                  color: Color(0xFF8F928F),
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Consumer<UserManager>(
          builder: (_, userManager, __) {
            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 26),
                    width: 362,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: primaryColor,
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                          color: Color(0xFFC5B8B8),
                          offset: Offset(5, 5),
                          blurRadius: 10,
                        ),
                        const BoxShadow(
                          color: Color(0xFFFFFFFF),
                          offset: Offset(-5, -5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(35, 15, 15, 15),
                      shrinkWrap: true,
                      children: [
                        TextFormField(
                          controller: emailController,
                          enabled: !userManager.loading,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(3),
                            hintText: ' Email',
                            errorStyle: TextStyle(height: 0),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                bottom: 30,
                              ),
                              child: Icon(
                                FontAwesomeIcons.envelope,
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Color(0xFF827D7D),
                            ),
                          ),
                          validator: (email) {
                            if (!emailValid(email)) return 'Invalid email';
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 26),
                    width: 362,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: primaryColor,
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                          color: Color(0xFFC5B8B8),
                          offset: Offset(5, 5),
                          blurRadius: 10,
                        ),
                        const BoxShadow(
                          color: Color(0xFFFFFFFF),
                          offset: Offset(-5, -5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(35, 15, 15, 15),
                      shrinkWrap: true,
                      children: [
                        TextFormField(
                          controller: passController,
                          enabled: !userManager.loading,
                          autocorrect: false,
                          obscureText: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(3),
                            hintText: ' Password',
                            errorStyle: TextStyle(
                              height: 0,
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                bottom: 30,
                              ),
                              child: Icon(
                                FontAwesomeIcons.lock,
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Color(0xFF827D7D),
                            ),
                          ),
                          validator: (pass) {
                            if (pass.isEmpty || pass.length < 6) {
                              return 'Invalid password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 26),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot password',
                          style: TextStyle(
                            color: Color(0xFF827D7D),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 118,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 26),
                    width: 362,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: primaryColor,
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                          color: Color(0xFFC5B8B8),
                          offset: Offset(5, 5),
                          blurRadius: 10,
                        ),
                        const BoxShadow(
                          color: Color(0xFFFFFFFF),
                          offset: Offset(-5, -5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: userManager.loading
                          ? null
                          : () {
                              if (formKey.currentState.validate()) {
                                userManager.signIn(
                                  user: Usuario(
                                    email: emailController.text,
                                    password: passController.text,
                                  ),
                                  onFail: (e) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text('Falha ao entrar: $e',
                                          style: const TextStyle(fontSize: 18)),
                                      backgroundColor: Colors.red,
                                    ));
                                  },
                                  onSuccess: () {
                                    Navigator.of(context).pop();
                                  },
                                );
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        primary: const Color(0xFFAF7BF0),
                        onSurface: const Color(0xFFAF7BF0),
                        elevation: 0,
                      ),
                      child: Center(
                        child: userManager.loading
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                  Color(0xFFAF7BF0),
                                ),
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 22,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
