import 'package:flutter/material.dart';
import 'package:taskieapp/presentation/comuns/styles/custom_colors.dart';
import 'package:taskieapp/presentation/widgets/custom_text.dart';

class CustomCardCategoryWidget extends StatelessWidget {
  final String categoryName;
  final int quantidadeTarefas;
  final int quantidadeTarefasDone;

  const CustomCardCategoryWidget(
      {super.key, required this.categoryName, required this.quantidadeTarefas, required this.quantidadeTarefasDone});

  @override
  Widget build(BuildContext context) {
    final PadraoCategoria padrao = _criarPadraoCategoria(categoryName);

    return Card(
      color: CustomColors.transparentWidget,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        margin: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      padrao.icon,
                      color: padrao.corPadraoCategoria,
                    ),
                    const SizedBox(width: 5),
                    CustomTextWidget(
                      text: categoryName,
                      textColor: padrao.corPadraoCategoria,
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    size: 20,
                    Icons.edit,
                    color: CustomColors.titleTextColor,
                  ),
                ),
              ],
            ),
            CustomTextWidget(
              text: "$quantidadeTarefas tarefas",
              textColor: CustomColors.titleTextColor,
            ),
            const SizedBox(height: 4),
            LinearProgressIndicator(
              value: quantidadeTarefasDone / quantidadeTarefas,
              valueColor:
                  AlwaysStoppedAnimation<Color>(padrao.corPadraoCategoria),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              minHeight: 12,
              backgroundColor: CustomColors.textColor,
            )
          ],
        ),
      ),
    );
  }
}

PadraoCategoria _criarPadraoCategoria(String nomeCategoria) {
  final IconData? icon;
  final Color corPadraoCategoria;

  switch (nomeCategoria.toUpperCase()) {
    case "FAMÍLIA":
      icon = Icons.family_restroom;
      corPadraoCategoria = Colors.red;
      break;
    case "SAÚDE":
      icon = Icons.monitor_heart_outlined;
      corPadraoCategoria = Colors.green;
      break;
    default:
      icon = null;
      corPadraoCategoria = CustomColors.textColor;
  }

  return PadraoCategoria(icon: icon, corPadraoCategoria: corPadraoCategoria);
}

class PadraoCategoria {
  final IconData? icon;
  final Color corPadraoCategoria;

  PadraoCategoria({required this.icon, required this.corPadraoCategoria});
}
