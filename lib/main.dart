import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_apps/cubit/auth_cubit.dart';
import 'package:my_apps/cubit/create_faq_cubit.dart';
import 'package:my_apps/cubit/delete_faq_cubit.dart';
import 'package:my_apps/cubit/faq_detail_cubit.dart';
import 'package:my_apps/cubit/list_faq_cubit.dart';
import 'package:my_apps/cubit/update_faq_cubit.dart';
import 'package:my_apps/pages/home_page.dart';
import 'package:my_apps/pages/login_page.dart';
import 'package:my_apps/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => ListFaqCubit(),
        ),
        BlocProvider(
          create: (context) => CreateFaqCubit(),
        ),
        BlocProvider(
          create: (context) => FaqDetailCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateFaqCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteFaqCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        initialRoute: LoginPage.routeName,
        routes: {
          LoginPage.routeName: (context) => const LoginPage(),
          HomePage.routeName: (context) => const HomePage()
        },
      ),
    );
  }
}
