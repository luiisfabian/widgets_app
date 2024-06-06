import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress Indicator"),
      ),
      body: const _progressView(),
    );
  }
}

class _progressView extends StatelessWidget {
  const _progressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text("Circular Progress Indicator"),
          SizedBox(
            height: 20,
          ),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black54,
          ),
          SizedBox(
            height: 30,
          ),
          Text("Circular y linear Progress Indicator Controlado"),
          SizedBox(
            height: 20,
          ),
          _controllerProgressIndicator()
        ],
      ),
    );
  }
}

class _controllerProgressIndicator extends StatelessWidget {
  const _controllerProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
       stream: Stream.periodic(Duration(seconds: 2), (value) {
        return value * 2 / 100;
      }).takeWhile((element) => element < 100),
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0;

        return  Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 2,
                backgroundColor: Colors.black12,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: LinearProgressIndicator(
                value: progressValue,
              ))
            ],
          ),
        );
      },
     
    );
  }
}
