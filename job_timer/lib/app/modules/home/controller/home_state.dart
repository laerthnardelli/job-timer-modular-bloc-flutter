// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_controller.dart';

enum HomeStatus {
  initial,
  loading,
  complete,
  failure,
}

class HomeState extends Equatable {
  final List<ProjectModel> projects;
  final HomeStatus status;
  final ProjectStatus projectFilter;

  const HomeState._({
    required this.projects,
    required this.status,
    required this.projectFilter,
  });

  HomeState.initial()
      : this._(
          projects: [],
          projectFilter: ProjectStatus.in_loading,
          status: HomeStatus.initial,
        );

  //se mudar qualquer um desses, o Bloc tem que atualizar a tela
  // changing the instance itself using the prototype concept (CopyWitch)
  @override
  List<Object?> get props => [projects, status, projectFilter];

  HomeState copyWith({
    List<ProjectModel>? projects,
    HomeStatus? status,
    ProjectStatus? projectFilter,
  }) {
    return HomeState._(
      projects: projects ?? this.projects,
      status: status ?? this.status,
      projectFilter: projectFilter ?? this.projectFilter,
    );
  }
}
