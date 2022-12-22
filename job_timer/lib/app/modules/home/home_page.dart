import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/home/controller/home_controller.dart';

import 'package:job_timer/app/modules/home/widgets/header_projects_menu.dart';
import 'package:job_timer/app/modules/home/widgets/project_tile.dart';
import 'package:job_timer/app/view_models/project_model.dart';

import '../../services/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeController, HomeState>(
      bloc: controller,
      listener: (context, state) {
        if (state.status == HomeStatus.failure) {
          AsukaSnackbar.alert('Erro ao buscar os projetos').show();
        }
      },
      child: Scaffold(
        drawer: Drawer(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListTile(
                title: const Text(
                  'Sair',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
                onTap: () {
                  Modular.get<AuthService>().signOut();
                  Modular.to.navigate('/login');
                },
              ),
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
                delegate: HeaderProjectsMenu(controller: controller),
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
              BlocSelector<HomeController, HomeState, List<ProjectModel>>(
                bloc: controller,
                selector: (state) => state.projects,
                builder: (context, projects) {
                  return SliverList(
                    delegate: SliverChildListDelegate(
                      projects
                          .map(
                            (project) => ProjectTile(projectModel: project),
                          )
                          .toList(),
                    ),
                  );
                },
              )
            ],
          ),
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
