import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mediease/models/sleep_exercise_model.dart';
import 'package:mediease/utils/colors.dart';

class SleepExerciseTimer extends StatefulWidget {
  final SleepExercise sleepExercise;
  const SleepExerciseTimer({super.key, required this.sleepExercise});

  @override
  State<SleepExerciseTimer> createState() => _SleepExerciseTimerState();
}

class _SleepExerciseTimerState extends State<SleepExerciseTimer> {
  Timer? _timer;
  int _remainingTime = 0;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.sleepExercise.duration * 60;
  }

  //Method to start the timer
  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }

    _isRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  //Method to pause the timer
  void _pauseTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _isRunning = false;
    }
  }

  //Method to stop the timer
  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    setState(() {
      _remainingTime = widget.sleepExercise.duration * 60;
      _isRunning = false;
    });
  }

  String _formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remaingSeconds = seconds % 60;

    return "$minutes:${remaingSeconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Story Timer'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.sleepExercise.category,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryBlue,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.sleepExercise.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Duration: ${widget.sleepExercise.duration} minutes',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.sleepExercise.description,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: Text(
                _formatTime(_remainingTime),
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_isRunning) {
                        _pauseTimer();
                      } else {
                        _startTimer();
                      }
                    });
                  },
                  child: Text(
                    _isRunning
                        ? "Pause"
                        : (_remainingTime < widget.sleepExercise.duration * 60)
                            ? "Resume"
                            : "Start",
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _stopTimer();
                  },
                  child: const Text('Stop'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
