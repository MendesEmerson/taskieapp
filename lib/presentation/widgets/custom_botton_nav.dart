import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  const CustomBottomNavigationBar({super.key, required this.currentIndex, required this.onTabTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTabTapped,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Tarefas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle),
          label: 'Criar tarefa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.folder),
          label: 'Categorias',
        ),
      ],
    );
  }
}
