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

import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future onesignalLogout() async {
  // Add your function code here!
  try {
    final supabase = Supabase.instance.client;

    // Выход из Supabase
    await supabase.auth.signOut();

    // Выход из OneSignal
    await OneSignal.logout();
  } catch (e) {
    print('Ошибка при выходе: $e');
  }
}
