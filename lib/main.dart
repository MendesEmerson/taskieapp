import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskieapp/di/service_locator.dart';
import 'package:taskieapp/firebase_options.dart';
import 'package:taskieapp/presentation/routes/nav_routes.dart';
import 'package:taskieapp/presentation/view/bem_vindo/welcome_page.dart';
import 'package:taskieapp/presentation/view/cadastro/cadastro_page.dart';
import 'package:taskieapp/presentation/view/home/home_page.dart';
import 'package:taskieapp/presentation/view/login/login_page.dart';

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
        RepositoryProvider<FirebaseAuthRepository>(
          create: (context) => getIt<FirebaseAuthRepository>(),
        ),
      ],
      child: MaterialApp(
        initialRoute: NavRoutes.bemVindoPage,
        routes: {
          NavRoutes.bemVindoPage: (context) => const WelcomePage(),
          NavRoutes.loginPage: (context) => LoginPage(title: 'Login'),
          NavRoutes.cadastroPage: (context) => CadastroPage(),
          NavRoutes.homePage: (context) => const HomePage(),
        },
      ),
    );
  }
}

