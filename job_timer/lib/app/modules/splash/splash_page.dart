import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/job_timer_icons.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashPage'),
      ),
      body: Column(
        children: [
          Container(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                label: Text('Input'),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('BOTÃO'),
          ),
          const Icon(
            JobTimerIcons.angle_double_right,
            size: 50,
          ),
        ],
      ),
    );
  }
}
