import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/home/controller/home_controller.dart';

import 'package:job_timer/app/modules/home/widgets/header_projects_menu.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({super.key, required this.controller});

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
            BlocSelector<HomeController, HomeState, bool>(
              bloc: controller,
              selector: (state) => state.status == HomeStatus.loading,
              builder: (context, showLoading) {
                return SliverVisibility(
                  visible: showLoading,
                  sliver: const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 50,
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ),
                  ),
                );
              },
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
