import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../helpers/validators.dart';
import '../../models/user.dart';
import '../../models/user_manager.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final Usuario user = Usuario();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Create account',
          style: TextStyle(
            color: Color(0xFF8F928F),
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Consumer<UserManager>(
            builder: (_, userManager, __) {
              return Column(
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
                          //controller: emailController,
                          enabled: !userManager.loading,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(3),
                            hintText: ' Full name',
                            errorStyle: TextStyle(height: 0),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                bottom: 30,
                              ),
                              child: Icon(
                                FontAwesomeIcons.user,
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Color(0xFF827D7D),
                            ),
                          ),
                          validator: (name) {
                            if (name.isEmpty) {
                              return 'Required field';
                            } else if (name.trim().split(' ').length <= 1) {
                              return 'Fill in your full name';
                            }
                            return null;
                          },
                          onSaved: (name) => user.name = name,
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
                          //controller: emailController,
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
                            if (email.isEmpty) {
                              return 'Required field';
                            } else if (!emailValid(email)) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                          onSaved: (email) => user.email = email,
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
                          obscureText: true,
                          //controller: emailController,
                          enabled: !userManager.loading,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(3),
                            hintText: ' Password',
                            errorStyle: TextStyle(height: 0),
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
                            if (pass.isEmpty) {
                              return 'Required field';
                            } else if (pass.length < 6) {
                              return 'Password is too short';
                            }
                            return null;
                          },
                          onSaved: (pass) => user.password = pass,
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
                          //controller: emailController,
                          enabled: !userManager.loading,
                          obscureText: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(3),
                            hintText: ' Repeat password',
                            errorStyle: TextStyle(height: 0),
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
                            if (pass.isEmpty) {
                              return 'Required field';
                            } else if (pass.length < 6) {
                              return 'Password is too short';
                            }
                            return null;
                          },
                          onSaved: (pass) => user.confirmPassword = pass,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
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
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        primary: const Color(0xFFAF7BF0),
                        onSurface: const Color(0xFFAF7BF0),
                        elevation: 0,
                      ),
                      onPressed: userManager.loading
                          ? null
                          : () {
                              if (formKey.currentState.validate()) {
                                formKey.currentState.save();

                                if (user.password != user.confirmPassword) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Different passwords!',
                                          style: TextStyle(fontSize: 18)),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }
                                userManager.signUp(
                                  user: user,
                                  onSuccess: () {
                                    Navigator.of(context).pop();
                                  },
                                  onFail: (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Sign up failed: $e',
                                            style: const TextStyle(fontSize: 18)),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                      child: userManager.loading
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(
                                Color(0xFFAF7BF0),
                              ),
                            )
                          : const Text(
                              'Sign up',
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 22,
                              ),
                            ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
