import 'package:flutter/material.dart';
import 'package:task_app/ui/api_config_task_screen.dart';
import 'ui/dropdown_task.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ApiConfigScreen())),
              child: const Text('Rest Api Task')),
          const SizedBox(height: 15),
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DropDownScreen())),
              child: const Text('DropDown Task')),
        ],
      ),
    );
  }
}
