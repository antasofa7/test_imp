import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:my_apps/cubit/auth_cubit.dart';
import 'package:my_apps/pages/home_page.dart';
import 'package:my_apps/services/user_service.dart';
import 'package:my_apps/widgets/button.dart';
import 'package:my_apps/widgets/input_field.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    Timer(
      const Duration(milliseconds: 1500),
      () async {
        bool? isUserExist = await UserService.checkLogin();
        if (isUserExist!) {
          if (!mounted) return;
          context.read<AuthCubit>().getCurrentUser();
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.routeName,
            (route) => false,
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              HomePage.routeName,
              (route) => false,
            );
          } else if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.errorMessage,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              backgroundColor: Theme.of(context).colorScheme.error,
            ));
          }
        }, builder: (context, state) {
          Widget widgetLoading = const SizedBox();
          if (state is AuthLoading) {
            widgetLoading = Container(
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
            );
          }
          return Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 40.0, horizontal: 16.0),
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
                    FormBuilder(
                        key: _formKey,
                        child: Column(
                          children: [
                            InputField(
                              key: _emailFieldKey,
                              label: 'Email address',
                              inputType: TextInputType.emailAddress,
                              controller: _emailController,
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            InputField(
                              label: 'Password',
                              inputType: TextInputType.visiblePassword,
                              suffixIcon: true,
                              controller: _passwordController,
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            ButtonWidget(
                                label: 'LOGIN',
                                onPress: () {
                                  if (_formKey.currentState
                                          ?.saveAndValidate() ??
                                      false) {
                                    if (true) {
                                      // Either invalidate using Form Key
                                      _formKey.currentState?.fields['email']
                                          ?.invalidate('Email already taken.');

                                      context.read<AuthCubit>().login(
                                          email: _emailController.text,
                                          password: _passwordController.text);
                                    }
                                  }
                                })
                          ],
                        ))
                  ]),
                ),
              ),
              widgetLoading
            ],
          );
        }));
  }
}
