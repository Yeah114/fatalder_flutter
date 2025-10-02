import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';

class TaskGroupScreen extends StatelessWidget {
  const TaskGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return Scaffold(
          body: appState.taskGroups.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.task_outlined, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text('No task groups yet'),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: appState.taskGroups.length,
                  itemBuilder: (context, index) {
                    final taskGroup = appState.taskGroups[index];
                    return ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.task)),
                      title: Text(taskGroup),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // TODO: Navigate to task group detail
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
