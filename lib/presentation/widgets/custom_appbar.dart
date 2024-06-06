import 'package:flutter/material.dart';
import 'package:taskieapp/presentation/comuns/constants/images.dart';
import 'package:taskieapp/presentation/comuns/styles/custom_colors.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBarWidget({super.key, required this.nomeUsuario});

  final String nomeUsuario;
  final DateTime data = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
      leadingWidth: MediaQuery.of(context).size.width * 0.16,
      leading: Container(
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: const DecorationImage(
            image: AssetImage(ImagesPath.avatarPlaceholder),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "${data.day}",
                style: const TextStyle(
                  color: CustomColors.titleTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${data.year}",
                    style: const TextStyle(
                      color: CustomColors.titleTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    converterMesNumerico(data.month),
                    style: const TextStyle(
                      color: CustomColors.titleTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            "Olá, $nomeUsuario!",
            style: const TextStyle(
              color: CustomColors.titleTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

String converterMesNumerico(int mes) {
  final List<String> meses = [
    "Mês inválido",
    "Janeiro",
    "Fevereiro",
    "Março",
    "Abril",
    "Maio",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro"
  ];

  if (mes < 1 || mes > 12) {
    return meses[0];
  }

  return meses[mes];
}
