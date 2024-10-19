// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutterapp/components/input_field.dart';
import 'package:room_track_flutterapp/theme/icon.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void onForgotPassword() {
    // TODO onForgotPassword
  }

  void onOutlookSigIn() {
    // TODO onOutlookSigIn
  }

  void onSignIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (err) {
      Navigator.pop(context);
      wrongField(err.code);
    }
  }

  void wrongField(String errCode) {
    String message;
    switch (errCode) {
      case "user-not-found":
        message = "Incorrect email";
        break;
      case "wrong-password":
        message = "Incorrect password";
        break;
      default:
        message = "No server response";
        break;
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          /**
           * Fondo "R"
           */
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(70.0),
              child: SvgPicture.asset(
                IconSchemeBackground.logoSVG,
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.surfaceDim.withOpacity(0.5),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          /**
           * Pagina
           */
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 2),
                /**
                 * Form
                 */
                Column(
                  children: [
                    /**
                     * Correo
                     */
                    InputField(
                      controller: emailController,
                      label: 'Email',
                      hint: 'example@usm.cl',
                      hide: false,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    /**
                     * Contraseña
                     */
                    InputField(
                      controller: passwordController,
                      label: 'Password',
                      hint: 'Insert your password',
                      hide: true,
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(height: 10),
                    /**
                     * Forgot your password?
                     */
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: onForgotPassword,
                        child: const Text('Forgot your password?'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    /**
                     * Sign in
                     */
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: onSignIn,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: theme.colorScheme.onSurface,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text('Sign in'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    /**
                     * or
                     */
                    const Text('or'),
                    const SizedBox(height: 20),
                    /**
                     * Outlook
                     */
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: onOutlookSigIn,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: theme.colorScheme.onSurface,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        icon: SvgPicture.asset(IconSchemeButton.outlookSVG),
                        label: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text('Outlook'),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                /**
                 * Empresa
                 */
                Text(
                  'PORTALS ©',
                  style: TextStyle(
                    color: theme.colorScheme.onSurface.withOpacity(0.3),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
    );
  }
}
