import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get phoneNum => getField<String>('phoneNum');
  set phoneNum(String? value) => setField<String>('phoneNum', value);

  String? get password => getField<String>('password');
  set password(String? value) => setField<String>('password', value);

  String? get userType => getField<String>('userType');
  set userType(String? value) => setField<String>('userType', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get surname => getField<String>('surname');
  set surname(String? value) => setField<String>('surname', value);

  String? get carModel => getField<String>('carModel');
  set carModel(String? value) => setField<String>('carModel', value);

  String? get carNumber => getField<String>('carNumber');
  set carNumber(String? value) => setField<String>('carNumber', value);

  double? get ballance => getField<double>('ballance');
  set ballance(double? value) => setField<double>('ballance', value);

  List<int> get cancelledOrdersID => getListField<int>('cancelledOrdersID');
  set cancelledOrdersID(List<int>? value) =>
      setListField<int>('cancelledOrdersID', value);

  bool? get notificationEnabled => getField<bool>('notificationEnabled');
  set notificationEnabled(bool? value) =>
      setField<bool>('notificationEnabled', value);
}
