import 'package:job_timer/app/core/entities/project.dart';

abstract class ProjectRepository {
  Future<void> register(Project project);
}
