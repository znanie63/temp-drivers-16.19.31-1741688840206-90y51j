import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';

List<UsersRow>? searchDriver(
  String searchtext,
  List<UsersRow>? driversList,
) {
  if (driversList == null || searchtext.isEmpty) {
    return driversList;
  }

  final lowerSearchText = searchtext.toLowerCase();

  return driversList.where((user) {
    final name = user.name?.toLowerCase() ?? '';
    final surname = user.surname?.toLowerCase() ?? '';

    return name.contains(lowerSearchText) || surname.contains(lowerSearchText);
  }).toList();
}

double sumOfNumbers(
  double num1,
  double num2,
) {
  return num1 + num2;
}

String getlongitude(LatLng? latlng) {
  // return latitude from latlng
  if (latlng != null) {
    return latlng.longitude.toString();
  } else {
    return '';
  }
}

List<String>? searchTextFromTextList(
  String? text,
  List<String>? textList,
) {
  // return list from text list where text contains
  if (text == null || textList == null) {
    return null;
  }

  final searchText = text.toLowerCase();

  return textList
      .where((item) => item.toLowerCase().contains(searchText))
      .toList();
}

int textToInt(String? text) {
  // past int from text
  if (text == null) {
    return 0;
  }

  final number = int.tryParse(text.replaceAll(RegExp(r'[^0-9]'), ''));

  return number ?? 0;
}

List<OrdersRow>? filterorders(
  List<int>? unacceptedordersid,
  List<OrdersRow>? ordersList,
) {
  // return orders list where order id not in unacceptedordersid
  if (unacceptedordersid == null || ordersList == null) {
    return null;
  }

  List<OrdersRow> filteredOrders = ordersList
      .where((order) => !unacceptedordersid.contains(order.id))
      .toList();

  return filteredOrders;
}

List<int>? addToList(
  List<int>? list,
  int? num,
) {
  // return list with added num
  if (list == null) {
    list = [];
  }
  list.add(num ?? 0);
  return list;
}

String getlatitude(LatLng? latlng) {
  // return latitude from latlng
  if (latlng != null) {
    return latlng.latitude.toString();
  } else {
    return '';
  }
}

List<OrdersRow>? showordersofdriver(
  UsersRow driver,
  List<OrdersRow>? allorderslist,
) {
  final driverorders =
      allorderslist?.where((order) => order.driverId == driver.id).toList() ??
          [];
  final cancelledorders = allorderslist
          ?.where(
              (order) => driver.cancelledOrdersID?.contains(order.id) ?? false)
          .toList() ??
      [];

  final result = <OrdersRow>[];
  result.addAll(driverorders);

  for (final order in cancelledorders) {
    if (!result.any((o) => o.id == order.id)) {
      result.add(order);
    }
  }

  return result;
}

List<ShiftsRow>? filterShifts(
  List<ShiftsRow>? shiftslist,
  String filtertext,
) {
  if (shiftslist == null || shiftslist.isEmpty) {
    return <ShiftsRow>[];
  }

  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime weekAgo = today.subtract(const Duration(days: 7));
  DateTime monthAgo = today.subtract(const Duration(days: 30));

  switch (filtertext) {
    case 'today':
      return shiftslist.where((shift) {
        if (shift.startedTime == null) {
          return false;
        }
        final start = shift.startedTime!;
        final tomorrow = today.add(const Duration(days: 1));
        // Проверяем, что startedTime >= today и < tomorrow
        return start.isAfter(today) && start.isBefore(tomorrow);
      }).toList();

    case 'week':
      return shiftslist.where((shift) {
        if (shift.startedTime == null) {
          return false;
        }
        final start = shift.startedTime!;
        // Проверяем, что startedTime >= weekAgo
        return start.isAfter(weekAgo);
      }).toList();

    case 'month':
      return shiftslist.where((shift) {
        if (shift.startedTime == null) {
          return false;
        }
        final start = shift.startedTime!;
        // Проверяем, что startedTime >= monthAgo
        return start.isAfter(monthAgo);
      }).toList();

    case 'all':
      return shiftslist;

    default:
      return <ShiftsRow>[];
  }
}

String sumofList(List<String>? list) {
  // return sum of list
  if (list == null || list.isEmpty) {
    return '0';
  }

  int sum = 0;
  for (String item in list) {
    sum += int.tryParse(item) ?? 0;
  }

  return sum.toString();
}

LatLng getlatlng(
  String? latitude,
  String? longitude,
) {
  // return latlng from latitude and longitude
  double lat = double.parse(latitude ?? '0.0');
  double lng = double.parse(longitude ?? '0.0');
  return LatLng(lat, lng);
}

double calculateTotalPrice(
  String km,
  String startedprice,
  String pricePerkm,
) {
  // return startedprice + km * pricePerkm
  double kmValue = double.parse(km);
  double startedPriceValue = double.parse(startedprice);
  double pricePerKmValue = double.parse(pricePerkm);

  return startedPriceValue + kmValue * pricePerKmValue;
}

String calculateminutes(
  DateTime startedtime,
  DateTime finishedtime,
) {
  // return minutes between started and finishedtime
  Duration difference = finishedtime.difference(startedtime);
  int minutes = difference.inMinutes;
  return '$minutes';
}

double updateBallance(
  double cost,
  double ballance,
) {
  // return ballance - percent of finishedprice

  return ballance - cost;
}

int getTextLength(String? text) {
  // return text length
  if (text == null) {
    return 0;
  } else {
    return text.length;
  }
}

bool isDifferenceMoreThanValue(
  DateTime firsttime,
  DateTime secondtime,
  int value,
) {
  // if difference between secondtime and firsttime more than value return true
  Duration difference = secondtime.difference(firsttime);
  return difference.inSeconds > value;
}

double getPercentValue(
  double price,
  double percent,
) {
  // return percent of price
  return (price * percent) / 100;
}

List<OrdersRow>? orderStats(
  String filtertext,
  List<OrdersRow>? orderlist,
) {
  if (orderlist == null || orderlist.isEmpty) {
    return <OrdersRow>[];
  }

  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime weekAgo = today.subtract(const Duration(days: 7));
  DateTime monthAgo = today.subtract(const Duration(days: 30));

  switch (filtertext) {
    case 'today':
      return orderlist.where((order) {
        if (order.completedTime == null) {
          return false;
        }
        final completed = order.completedTime!;
        final tomorrow = today.add(const Duration(days: 1));
        // Проверяем, что completedTime >= today и < завтра
        return completed.isAfter(today) && completed.isBefore(tomorrow);
      }).toList();

    case 'week':
      return orderlist.where((order) {
        if (order.completedTime == null) {
          return false;
        }
        final completed = order.completedTime!;
        // Проверяем, что completedTime >= weekAgo
        return completed.isAfter(weekAgo);
      }).toList();

    case 'month':
      return orderlist.where((order) {
        if (order.completedTime == null) {
          return false;
        }
        final completed = order.completedTime!;
        // Проверяем, что completedTime >= monthAgo
        return completed.isAfter(monthAgo);
      }).toList();

    case 'all':
      return orderlist;

    default:
      return <OrdersRow>[];
  }
}

String sumOfListDouble(
  List<double> value,
  bool isDouble,
) {
  double sum = 0.0;
  for (double num in value) {
    sum += num;
  }
  return isDouble ? sum.toString() : sum.toInt().toString();
}

Color textToColor(String text) {
  String hex = text.startsWith('#') ? text.substring(1) : text;

  // Parse the hex string into an integer
  final int colorInt = int.parse(hex, radix: 16);

  // Return the color
  return Color.fromARGB(
      255, (colorInt >> 16) & 0xFF, (colorInt >> 8) & 0xFF, colorInt & 0xFF);
}

int linesNumConHeight(
  String text,
  int value,
  int minheight,
) {
  int length = text.length;

  int linesnum = (length / 33).ceil();

  return (minheight + (linesnum * value));
}

String formatTimeDifference(DateTime timestamp) {
  // Текущее время
  final DateTime currentTime = DateTime.now();

  // Рассчитываем разницу во времени в минутах
  final int differenceInMinutes = currentTime.difference(timestamp).inMinutes;

  // Определяем правильное окончание для слова "минута"
  String getMinuteSuffix(int minutes) {
    if (minutes % 10 == 1 && minutes % 100 != 11) {
      return 'минута';
    } else if (minutes % 10 >= 2 &&
        minutes % 10 <= 4 &&
        (minutes % 100 < 10 || minutes % 100 >= 20)) {
      return 'минуты';
    } else {
      return 'минут';
    }
  }

  // Формируем строку результата
  return '$differenceInMinutes ${getMinuteSuffix(differenceInMinutes)}';
}

String deletepartfromtext(String text) {
  return text.replaceAll(" назад", "");
}

double calculateMinus(
  double num1,
  double num2,
) {
  return num1 - num2;
}

double distanceOfLocations(List<LatLng>? coordsList) {
  if (coordsList == null || coordsList.length < 2) {
    return 0.0;
  }

  const double earthRadiusKm = 6371.0;

  double degreesToRadians(double degrees) => degrees * math.pi / 180;

  double calculateHaversine(LatLng start, LatLng end) {
    final lat1 = degreesToRadians(start.latitude);
    final lon1 = degreesToRadians(start.longitude);
    final lat2 = degreesToRadians(end.latitude);
    final lon2 = degreesToRadians(end.longitude);

    final dLat = lat2 - lat1;
    final dLon = lon2 - lon1;

    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(lat1) *
            math.cos(lat2) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return earthRadiusKm * c;
  }

  double totalDistance = 0.0;

  for (int i = 0; i < coordsList.length - 1; i++) {
    totalDistance += calculateHaversine(coordsList[i], coordsList[i + 1]);
  }

  /// Округляем до одного десятичного знака
  return double.parse(totalDistance.toStringAsFixed(1));
}

String intToString(int numv) {
  // return text from numv
  return numv.toString();
}
