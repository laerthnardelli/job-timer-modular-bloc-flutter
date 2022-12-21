import 'package:flutter/material.dart';

import 'widgets/project_detail_appbar.dart';
import 'widgets/project_pie_chart.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProjectDetailAppbar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.only(top: 50.0, bottom: 50),
                  child: ProjectPieChart(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
