import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/database/database.dart';
import '../../core/entities/project.dart';
import '../../core/entities/project_status.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Container(),
          ElevatedButton(
            onPressed: () async {
              final db = Modular.get<Database>();
              final connection = await db.openConnection();

              await connection.writeTxn((isar) async => connection.clear());

              connection.writeTxn(
                (isar) async {
                  var project = Project();
                  project.name = 'Projeto Teste';
                  project.status = ProjectStatus.finished;
                  return connection.projects.put(project);
                },
              );
            },
            child: const Text('Cadastrar'),
          ),
        ],
      ),
    );
  }
}
