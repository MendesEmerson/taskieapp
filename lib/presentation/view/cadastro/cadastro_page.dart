import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskieapp/presentation/routes/nav_routes.dart';
import 'package:taskieapp/presentation/view/cadastro/bloc/cadastro_bloc.dart';
import 'package:taskieapp/presentation/widgets/custom_button.dart';
import 'package:taskieapp/presentation/widgets/custom_text_input_password.dart';
import '../../../domain/repositories/firebase_auth_repository.dart';
import '../../comuns/constants/images.dart';
import '../../comuns/styles/custom_colors.dart';
import '../../widgets/custom_text_input.dart';

class CadastroPage extends StatelessWidget {
  CadastroPage({Key? key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController =
  TextEditingController();

  void _cadastrar(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      final nome = _nomeController.text;
      final email = _emailController.text;
      final senha = _senhaController.text;

      context.read<CadastroBloc>().add(
        CadastrarUsuarioEvent(
          nome: nome,
          email: email,
          senha: senha,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha corretamente todos os campos")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CadastroBloc(
        firebaseAuthRepository: context.read<FirebaseAuthRepository>(),
      ),
      child: BlocConsumer<CadastroBloc, CadastroState>(
        listener: (context, state) {
          if (state is CadastroSuccess) {
            Navigator.pushNamed(context, NavRoutes.loginPage);
          } else if (state is CadastroFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF151316),
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            backgroundColor: const Color(0xFF151316),
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: SvgPicture.asset(
                        ImagesPath.logo,
                        width: 70,
                        height: 70,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.8,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Comece gratuitamente",
                            style: TextStyle(
                                color: CustomColors.titleTextColor,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 30),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                CustomTextInputWidget(
                                  controller: _nomeController,
                                  width:
                                  MediaQuery.of(context).size.width * 0.8,
                                  prefixIcon: Icons.person,
                                  inputName: "Nome",
                                  hint: "Digite seu nome",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'O nome é obrigatório.';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 12.0),
                                CustomTextInputWidget(
                                  controller: _emailController,
                                  width:
                                  MediaQuery.of(context).size.width * 0.8,
                                  prefixIcon: Icons.person,
                                  inputName: "Email",
                                  hint: "seuemail@taskie.com",
                                  validator: (value) {
                                    if (value == null || value.isEmpty || !value.contains('@')) {
                                      return 'Insira um email válido';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 12.0),
                                CustomTextInputPasswordWidget(
                                  controller: _senhaController,
                                  width:
                                  MediaQuery.of(context).size.width * 0.8,
                                  prefixIcon: Icons.lock,
                                  inputName: "Senha",
                                  hint:
                                  "\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'A senha é obrigatória.';
                                    }
                                    if (!RegExp(
                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+{}|:"<>?~`]).{8,}$')
                                        .hasMatch(value)) {
                                      return 'A senha deve conter pelo menos 8 caracteres, incluindo pelo menos uma letra maiúscula, um número e um caractere especial.';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 12.0),
                                CustomTextInputPasswordWidget(
                                  controller: _confirmarSenhaController,
                                  width:
                                  MediaQuery.of(context).size.width * 0.8,
                                  prefixIcon: Icons.lock,
                                  inputName: "Confirmar senha",
                                  hint:
                                  "\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'A confirmação de senha é obrigatória.';
                                    }
                                    if (value != _senhaController.text) {
                                      return 'As senhas não coincidem.';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 30.0),
                                CustomButtonWidget(
                                  width:
                                  MediaQuery.of(context).size.width * 0.8,
                                  onClick: () => _cadastrar(context),
                                  text: "Cadastrar",
                                ),
                              ],
                            ),
                          ),
                        ],
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
