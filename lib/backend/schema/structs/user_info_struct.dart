// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserInfoStruct extends BaseStruct {
  UserInfoStruct({
    int? id,
    DateTime? createdAt,
    String? phoneNum,
    String? password,
    String? userType,
    String? name,
    String? surname,
    String? carModel,
    String? carNumber,
    String? lastShiftid,
    String? currentOrderID,
    List<String>? rateidlist,
  })  : _id = id,
        _createdAt = createdAt,
        _phoneNum = phoneNum,
        _password = password,
        _userType = userType,
        _name = name,
        _surname = surname,
        _carModel = carModel,
        _carNumber = carNumber,
        _lastShiftid = lastShiftid,
        _currentOrderID = currentOrderID,
        _rateidlist = rateidlist;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "phoneNum" field.
  String? _phoneNum;
  String get phoneNum => _phoneNum ?? '';
  set phoneNum(String? val) => _phoneNum = val;

  bool hasPhoneNum() => _phoneNum != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  // "userType" field.
  String? _userType;
  String get userType => _userType ?? '';
  set userType(String? val) => _userType = val;

  bool hasUserType() => _userType != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "surname" field.
  String? _surname;
  String get surname => _surname ?? '';
  set surname(String? val) => _surname = val;

  bool hasSurname() => _surname != null;

  // "carModel" field.
  String? _carModel;
  String get carModel => _carModel ?? '';
  set carModel(String? val) => _carModel = val;

  bool hasCarModel() => _carModel != null;

  // "carNumber" field.
  String? _carNumber;
  String get carNumber => _carNumber ?? '';
  set carNumber(String? val) => _carNumber = val;

  bool hasCarNumber() => _carNumber != null;

  // "lastShiftid" field.
  String? _lastShiftid;
  String get lastShiftid => _lastShiftid ?? '';
  set lastShiftid(String? val) => _lastShiftid = val;

  bool hasLastShiftid() => _lastShiftid != null;

  // "currentOrderID" field.
  String? _currentOrderID;
  String get currentOrderID => _currentOrderID ?? '';
  set currentOrderID(String? val) => _currentOrderID = val;

  bool hasCurrentOrderID() => _currentOrderID != null;

  // "rateidlist" field.
  List<String>? _rateidlist;
  List<String> get rateidlist => _rateidlist ?? const [];
  set rateidlist(List<String>? val) => _rateidlist = val;

  void updateRateidlist(Function(List<String>) updateFn) {
    updateFn(_rateidlist ??= []);
  }

  bool hasRateidlist() => _rateidlist != null;

  static UserInfoStruct fromMap(Map<String, dynamic> data) => UserInfoStruct(
        id: castToType<int>(data['id']),
        createdAt: data['created_at'] as DateTime?,
        phoneNum: data['phoneNum'] as String?,
        password: data['password'] as String?,
        userType: data['userType'] as String?,
        name: data['name'] as String?,
        surname: data['surname'] as String?,
        carModel: data['carModel'] as String?,
        carNumber: data['carNumber'] as String?,
        lastShiftid: data['lastShiftid'] as String?,
        currentOrderID: data['currentOrderID'] as String?,
        rateidlist: getDataList(data['rateidlist']),
      );

  static UserInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'phoneNum': _phoneNum,
        'password': _password,
        'userType': _userType,
        'name': _name,
        'surname': _surname,
        'carModel': _carModel,
        'carNumber': _carNumber,
        'lastShiftid': _lastShiftid,
        'currentOrderID': _currentOrderID,
        'rateidlist': _rateidlist,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'phoneNum': serializeParam(
          _phoneNum,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
        'userType': serializeParam(
          _userType,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'surname': serializeParam(
          _surname,
          ParamType.String,
        ),
        'carModel': serializeParam(
          _carModel,
          ParamType.String,
        ),
        'carNumber': serializeParam(
          _carNumber,
          ParamType.String,
        ),
        'lastShiftid': serializeParam(
          _lastShiftid,
          ParamType.String,
        ),
        'currentOrderID': serializeParam(
          _currentOrderID,
          ParamType.String,
        ),
        'rateidlist': serializeParam(
          _rateidlist,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static UserInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserInfoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        phoneNum: deserializeParam(
          data['phoneNum'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
        userType: deserializeParam(
          data['userType'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        surname: deserializeParam(
          data['surname'],
          ParamType.String,
          false,
        ),
        carModel: deserializeParam(
          data['carModel'],
          ParamType.String,
          false,
        ),
        carNumber: deserializeParam(
          data['carNumber'],
          ParamType.String,
          false,
        ),
        lastShiftid: deserializeParam(
          data['lastShiftid'],
          ParamType.String,
          false,
        ),
        currentOrderID: deserializeParam(
          data['currentOrderID'],
          ParamType.String,
          false,
        ),
        rateidlist: deserializeParam<String>(
          data['rateidlist'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'UserInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserInfoStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        phoneNum == other.phoneNum &&
        password == other.password &&
        userType == other.userType &&
        name == other.name &&
        surname == other.surname &&
        carModel == other.carModel &&
        carNumber == other.carNumber &&
        lastShiftid == other.lastShiftid &&
        currentOrderID == other.currentOrderID &&
        listEquality.equals(rateidlist, other.rateidlist);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        createdAt,
        phoneNum,
        password,
        userType,
        name,
        surname,
        carModel,
        carNumber,
        lastShiftid,
        currentOrderID,
        rateidlist
      ]);
}

UserInfoStruct createUserInfoStruct({
  int? id,
  DateTime? createdAt,
  String? phoneNum,
  String? password,
  String? userType,
  String? name,
  String? surname,
  String? carModel,
  String? carNumber,
  String? lastShiftid,
  String? currentOrderID,
}) =>
    UserInfoStruct(
      id: id,
      createdAt: createdAt,
      phoneNum: phoneNum,
      password: password,
      userType: userType,
      name: name,
      surname: surname,
      carModel: carModel,
      carNumber: carNumber,
      lastShiftid: lastShiftid,
      currentOrderID: currentOrderID,
    );
