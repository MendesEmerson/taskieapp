import 'package:flutter/material.dart';
import 'package:taskieapp/presentation/widgets/custom_appbar.dart';
import 'package:taskieapp/presentation/widgets/custom_card_category.dart';
import 'package:taskieapp/presentation/widgets/custom_text.dart';

import '../../widgets/custom_progress_task_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBarWidget(
        nomeUsuario: 'Emerson Mendes',
      ),
      endDrawer: const Drawer(
        shadowColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
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
        child: const Column(
          children: [
            SizedBox(height: 25),
            CustomProgressTaskBarWidget(totalTasks: 11, taskDone: 7,),
            CustomCardCategoryWidget(categoryName: "Saúde",)
          ],
        ),
      ),
    );
  }
}
