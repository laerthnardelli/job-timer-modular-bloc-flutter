import 'dart:developer';
import 'package:bloc/bloc.dart';

import '../../../../services/projects/project_service.dart';
import '../../../../view_models/project_model.dart';
import '../../../../view_models/project_task_model.dart';

part 'task_state.dart';

class TaskController extends Cubit<TaskStatus> {
  late final ProjectModel _projectModel;
  final ProjectService _projectService;

  TaskController({
    required ProjectService projectService,
  })  : _projectService = projectService,
        super(TaskStatus.initial);

  void setProject(ProjectModel projectModel) => _projectModel = projectModel;

  Future<void> register(String name, int duration) async {
    try {
      emit(TaskStatus.loading);
      final task = ProjectTaskModel(
        name: name,
        duration: duration,
      );
      await _projectService.addTask(_projectModel.id!, task);
      emit(TaskStatus.success);
    } catch (e, s) {
      log('Error ao salvar task', error: e, stackTrace: s);
      emit(TaskStatus.failure);
    }
  }
}
