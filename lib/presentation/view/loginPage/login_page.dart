import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskieapp/presentation/comuns/constants/images.dart';
import 'package:taskieapp/presentation/comuns/constants/strings.dart';
import 'package:taskieapp/presentation/comuns/styles/custom_colors.dart';
import 'package:taskieapp/presentation/routes/nav_routes.dart';
import 'package:taskieapp/presentation/widgets/custom_button.dart';
import 'package:taskieapp/presentation/widgets/custom_text_input_password.dart';

import '../../../domain/repositories/firebase_auth_repository.dart';
import '../../widgets/custom_text_input.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.title});

  final String title;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _login(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      final senha = _senhaController.text;

      context.read<LoginBloc>().add(
        LoginUsuarioEvent(
          email: email,
          senha: senha,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(
        firebaseAuthRepository: context.read<AuthRepository>(),
      ),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushNamed(context, NavRoutes.homePage);
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: const Color(0xFF151316),
            ),
            backgroundColor: const Color(0xFF151316),
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: SvgPicture.asset(
                        ImagesPath.logo,
                        width: 70,
                        height: 70,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        gradient: RadialGradient(
                          center: Alignment(-0.7, -0.6),
                          radius: 0.9,
                          colors: [
                            Color.fromRGBO(179, 121, 223, 0.2),
                            Color.fromRGBO(204, 88, 84, 0),
                            Color.fromRGBO(179, 121, 223, 0.2),
                          ],
                          stops: [0.0, 0.77, 1.0],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 30),
                              const Text(
                                StringsConstants.bemVindo,
                                style: TextStyle(
                                  color: CustomColors.titleTextColor,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                StringsConstants.sentimosSuaFalta,
                                style: TextStyle(
                                  color: CustomColors.textColor,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 20),
                              CustomTextInputWidget(
                                controller: _emailController,
                                width: MediaQuery.of(context).size.width * 0.8,
                                prefixIcon: Icons.person,
                                inputName: StringsConstants.email,
                                hint: StringsConstants.emailPlaceholder,
                                validator: (value) {
                                  if (value == null || value.isEmpty || !value.contains('@')) {
                                    return StringsConstants.emailInvalido;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12.0),
                              CustomTextInputPasswordWidget(
                                controller: _senhaController,
                                width: MediaQuery.of(context).size.width * 0.8,
                                prefixIcon: Icons.lock,
                                inputName: StringsConstants.senha,
                                hint: StringsConstants.senhaPlaceholder,
                                validator: (value) {
                                  if (value == null || value.length < 6) {
                                    return StringsConstants.senhaInvalido;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: const Text(
                                  StringsConstants.esqueceuSenha,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(color: Colors.white60),
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              CustomButtonWidget(
                                width: MediaQuery.of(context).size.width * 0.8,
                                onClick: () => _login(context),
                                text: StringsConstants.login,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
