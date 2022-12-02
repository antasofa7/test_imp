import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:my_apps/widgets/input_field.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(children: [
                Text(
                  'My APPS',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Image.asset(
                  'assets/images/Mobile-login-Cristina.png',
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const InputField(
                  label: 'Username',
                  inputType: TextInputType.name,
                  suffixIcon: false,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const InputField(
                  label: 'Password',
                  inputType: TextInputType.visiblePassword,
                  suffixIcon: true,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(double.infinity, 60.0)),
                    child: Text(
                      'LOGIN',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                )
              ]),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
            child: Center(
              child: CircularProgressIndicator(
                  strokeWidth: 6.0,
                  color: Theme.of(context).colorScheme.secondary,
                  backgroundColor: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }
}
