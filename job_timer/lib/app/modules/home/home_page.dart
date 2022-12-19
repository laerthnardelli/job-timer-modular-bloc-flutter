import 'package:flutter/material.dart';

import 'package:job_timer/app/modules/home/widgets/header_projects_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: SafeArea(
          child: ListTile(
            title: Text('Sair'),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Projetos'),
              expandedHeight: 100,
              toolbarHeight: 100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: HeaderProjectsMenu(),
              pinned: true,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                color: Colors.blue,
                height: 200,
              ),
              Container(
                color: Colors.blue,
                height: 200,
              ),
              Container(
                color: Colors.blue,
                height: 200,
              ),
              Container(
                color: Colors.blue,
                height: 200,
              ),
              Container(
                color: Colors.blue,
                height: 200,
              ),
              Container(
                color: Colors.blue,
                height: 200,
              ),
              Container(
                color: Colors.blue,
                height: 200,
              ),
              Container(
                color: Colors.blue,
                height: 200,
                child: Text('Fim'),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}

//  ElevatedButton(
//             onPressed: () async {
//               final db = Modular.get<Database>();
//               final connection = await db.openConnection();

//               await connection.writeTxn((isar) async => connection.clear());

//               connection.writeTxn(
//                 (isar) async {
//                   var project = Project();
//                   project.name = 'Projeto Teste';
//                   project.status = ProjectStatus.finished;
//                   return connection.projects.put(project);
//                 },
//               );
//             },
//             child: const Text('Cadastrar'),
//           ),
