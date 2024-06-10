import 'package:flutter/material.dart';
import 'package:taskieapp/presentation/widgets/custom_appbar.dart';
import 'package:taskieapp/presentation/widgets/custom_card_category.dart';
import 'package:taskieapp/presentation/widgets/custom_progress_task_bar.dart';

import '../../widgets/custom_botton_nav.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, dynamic>> categories = [
    {"name": "Saúde", "tasks": 14, "tasksDone": 3},
    {"name": "Família", "tasks": 8, "tasksDone": 2},
  ];

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
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
        onTabTapped: (int) {},
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            const CustomProgressTaskBarWidget(totalTasks: 11, taskDone: 7),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 120,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomCardCategoryWidget(
                    categoryName: categories[index]["name"],
                    quantidadeTarefas: categories[index]["tasks"],
                    quantidadeTarefasDone: categories[index]["tasksDone"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
