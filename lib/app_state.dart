import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_userInfo')) {
        try {
          final serializedData = prefs.getString('ff_userInfo') ?? '{}';
          _userInfo =
              UserInfoStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _ridedKm = prefs.getDouble('ff_ridedKm') ?? _ridedKm;
    });
    _safeInit(() {
      _coordsList = prefs
              .getStringList('ff_coordsList')
              ?.map(latLngFromString)
              .withoutNulls ??
          _coordsList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  UserInfoStruct _userInfo = UserInfoStruct();
  UserInfoStruct get userInfo => _userInfo;
  set userInfo(UserInfoStruct value) {
    _userInfo = value;
    prefs.setString('ff_userInfo', value.serialize());
  }

  void updateUserInfoStruct(Function(UserInfoStruct) updateFn) {
    updateFn(_userInfo);
    prefs.setString('ff_userInfo', _userInfo.serialize());
  }

  double _ridedKm = 0.0;
  double get ridedKm => _ridedKm;
  set ridedKm(double value) {
    _ridedKm = value;
    prefs.setDouble('ff_ridedKm', value);
  }

  List<LatLng> _coordsList = [];
  List<LatLng> get coordsList => _coordsList;
  set coordsList(List<LatLng> value) {
    _coordsList = value;
    prefs.setStringList(
        'ff_coordsList', value.map((x) => x.serialize()).toList());
  }

  void addToCoordsList(LatLng value) {
    coordsList.add(value);
    prefs.setStringList(
        'ff_coordsList', _coordsList.map((x) => x.serialize()).toList());
  }

  void removeFromCoordsList(LatLng value) {
    coordsList.remove(value);
    prefs.setStringList(
        'ff_coordsList', _coordsList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCoordsList(int index) {
    coordsList.removeAt(index);
    prefs.setStringList(
        'ff_coordsList', _coordsList.map((x) => x.serialize()).toList());
  }

  void updateCoordsListAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    coordsList[index] = updateFn(_coordsList[index]);
    prefs.setStringList(
        'ff_coordsList', _coordsList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCoordsList(int index, LatLng value) {
    coordsList.insert(index, value);
    prefs.setStringList(
        'ff_coordsList', _coordsList.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
