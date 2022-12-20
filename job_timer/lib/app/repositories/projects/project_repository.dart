import 'package:job_timer/app/entities/project_status.dart';

import '../../entities/project.dart';

abstract class ProjectRepository {
  Future<void> register(Project project);
  Future<List<Project>> findByStatus(ProjectStatus status); //filter
}
