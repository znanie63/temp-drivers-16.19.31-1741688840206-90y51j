// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:permission_handler/permission_handler.dart';

Future<bool> checkPermissions() async {
  // Проверяем текущее состояние разрешения на геолокацию
  final status = await Permission.location.status;

  if (status.isGranted) {
    return true; // Разрешение предоставлено
  } else if (status.isPermanentlyDenied) {
    // Открываем настройки приложения
    await openAppSettings();
    return false;
  } else if (status.isRestricted) {
    // Разрешение ограничено (актуально для iOS)
    print('Доступ к геолокации ограничен.');
    return false;
  } else {
    // Запрашиваем разрешение
    final newStatus = await Permission.location.request();

    if (newStatus.isGranted) {
      return true;
    } else if (newStatus.isPermanentlyDenied) {
      // Если разрешение окончательно запрещено
      await openAppSettings();
      return false;
    } else {
      return false; // Разрешение не предоставлено
    }
  }
}
