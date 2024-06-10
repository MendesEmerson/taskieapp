import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskieapp/di/service_locator.dart';
import 'package:taskieapp/firebase_options.dart';
import 'package:taskieapp/presentation/routes/nav_routes.dart';
import 'package:taskieapp/presentation/view/homePage/home_page.dart';
import 'package:taskieapp/presentation/view/loginPage/login_page.dart';
import 'package:taskieapp/presentation/view/registerPage/register_page.dart';
import 'package:taskieapp/presentation/view/welcomePage/welcome_page.dart';

import 'domain/repositories/firebase_auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => getIt<AuthRepository>(),
        ),
      ],
      child: MaterialApp(
        initialRoute: NavRoutes.welcomePage,
        routes: {
          NavRoutes.welcomePage: (context) => const WelcomePage(),
          NavRoutes.loginPage: (context) => LoginPage(title: 'Login'),
          NavRoutes.registerPage: (context) => RegisterPage(),
          NavRoutes.homePage: (context) => HomePage(),
        },
      ),
    );
  }
}

