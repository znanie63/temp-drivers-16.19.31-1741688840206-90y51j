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

import 'package:geolocator/geolocator.dart';
import 'dart:async'; // Для использования таймера

Future currentLocationWithTimer(
    Future Function(LatLng? locationinfo)? onUpdate) async {
  try {
    // Проверка разрешений
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('GPS выключен. Попросите пользователя включить GPS.');
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print('Доступ к геолокации не предоставлен.');
      return;
    }

    // Таймер, который обновляет местоположение каждые 15 секунд
    Timer.periodic(Duration(seconds: 15), (timer) async {
      try {
        // Получение текущей позиции
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation,
        );

        // Преобразование координат в LatLng
        LatLng currentLocation = LatLng(position.latitude, position.longitude);

        // Вызов переданного callback
        if (onUpdate != null) {
          await onUpdate(currentLocation);
        }

        print(
            'Координаты обновлены: Lat: ${currentLocation.latitude}, Lng: ${currentLocation.longitude}');
      } catch (e) {
        print('Ошибка получения местоположения: $e');
      }
    });
  } catch (e) {
    print('Ошибка в currentLocationWithTimer: $e');
  }
}
