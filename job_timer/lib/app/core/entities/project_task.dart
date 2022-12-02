import 'package:isar/isar.dart';

part 'project_task.g.dart';

@Collection()
class ProjectTask {
  @Id()
  int? id;
  late String name;
  late int duration;
  late DateTime created = DateTime.now();
}

//rodar o comando: flutter pub run build_runner watch --delete-conflicting-outputs

//https://drive.google.com/drive/folders/1sXvfywjLQ5-y8W8PgPIYw3RhWhBDWUKX
