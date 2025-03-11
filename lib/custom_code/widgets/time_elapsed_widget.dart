// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

class TimeElapsedWidget extends StatefulWidget {
  const TimeElapsedWidget({
    super.key,
    this.width,
    this.height,
    required this.startTime,
  });

  final double? width;
  final double? height;
  final DateTime startTime;

  @override
  State<TimeElapsedWidget> createState() => _TimeElapsedWidgetState();
}

class _TimeElapsedWidgetState extends State<TimeElapsedWidget> {
  late Timer _timer; // Таймер для обновления каждую минуту
  late Duration _timeElapsed; // Разница во времени

  @override
  void initState() {
    super.initState();
    _calculateTimeElapsed(); // Вычисляем изначальную разницу
    _startTimer(); // Запускаем таймер
  }

  @override
  void dispose() {
    _timer.cancel(); // Отменяем таймер при удалении виджета
    super.dispose();
  }

  void _calculateTimeElapsed() {
    final now = DateTime.now();
    setState(() {
      _timeElapsed = now.difference(widget.startTime);
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      _calculateTimeElapsed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Text(
        'В пути: ${_timeElapsed.inMinutes} минут',
        style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
              fontSize: 16.0, // Specify the font size
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
