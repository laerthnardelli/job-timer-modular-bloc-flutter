enum ProjectStatus {
  in_loading(label: 'Em andamento'),
  finished(label: 'Finalizado');

  final String label;
  const ProjectStatus({required this.label});
}
