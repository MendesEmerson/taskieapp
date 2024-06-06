import 'package:flutter/material.dart';
import 'package:taskieapp/presentation/comuns/styles/custom_colors.dart';
import 'package:taskieapp/presentation/widgets/custom_text.dart';

class CustomCardCategoryWidget extends StatelessWidget {
  final String categoryName;

  const CustomCardCategoryWidget({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final PadraoCategoria padrao = _criarPadraoCategoria(categoryName);

    return Card(
      color: CustomColors.padraoWidgetTransparente,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      padrao.icon,
                      color: padrao.corPadraoCategoria,
                    ),
                    CustomTextWidget(
                      text: categoryName,
                      textColor: padrao.corPadraoCategoria,
                    )
                  ],
                ),
                IconButton(
                  alignment: Alignment.centerRight,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: CustomColors.titleTextColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

PadraoCategoria _criarPadraoCategoria(String nomeCategoria) {
  final IconData? icon;
  final Color? corPadraoCategoria;

  switch (nomeCategoria.toUpperCase()) {
    case "FAMILIA":
      icon = Icons.family_restroom;
      corPadraoCategoria = Colors.red;
      break;
    case "SAÚDE":
      icon = Icons.monitor_heart_outlined;
      corPadraoCategoria = Colors.green;
      break;
    default:
      icon = null;
      corPadraoCategoria = null;
  }

  return PadraoCategoria(icon: icon, corPadraoCategoria: corPadraoCategoria);
}

class PadraoCategoria {
  final IconData? icon;
  final Color? corPadraoCategoria;

  PadraoCategoria({required this.icon, required this.corPadraoCategoria});
}
