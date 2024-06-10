import 'package:flutter/material.dart';
import 'package:taskieapp/presentation/comuns/styles/custom_colors.dart';
import 'package:taskieapp/presentation/widgets/custom_text.dart';

class CustomProgressTaskBarWidget extends StatelessWidget {
  final int totalTasks;
  final int taskDone;

  const CustomProgressTaskBarWidget(
      {super.key, required this.totalTasks, required this.taskDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: CustomColors.transparentWidget),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.menu,
                color: CustomColors.defaultPurple,
              ),
              SizedBox(width: 10),
              CustomTextWidget(
                text: "Todas as tarefas",
                textColor: CustomColors.defaultPurple,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              )
            ],
          ),
          const SizedBox(height: 10),
          CustomTextWidget(
            text: "${totalTasks.toString()} Tarefas",
            textColor: CustomColors.titleTextColor,
            fontSize: 16,
          ),
          LinearProgressIndicator(
            value: taskDone / totalTasks,
            valueColor:
                const AlwaysStoppedAnimation<Color>(CustomColors.defaultPurple),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            minHeight: 12,
            backgroundColor: CustomColors.textColor,
          )
        ],
      ),
    );
  }
}
