import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutterapp/components/input_field.dart';
import 'package:room_track_flutterapp/theme/icon.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
            padding: const EdgeInsets.symmetric(horizontal: 50),
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
          ),
        ],
      ),
    );
  }
}
