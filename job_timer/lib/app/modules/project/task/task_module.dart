import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/project/task/task_page.dart';

import '../../../view_models/project_model.dart';

class TaskModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) {
            final ProjectModel projectModel = args.data;
            return const TaskPage();
          },
        ),
      ];
}
