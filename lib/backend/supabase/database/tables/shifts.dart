import '../database.dart';

class ShiftsTable extends SupabaseTable<ShiftsRow> {
  @override
  String get tableName => 'shifts';

  @override
  ShiftsRow createRow(Map<String, dynamic> data) => ShiftsRow(data);
}

class ShiftsRow extends SupabaseDataRow {
  ShiftsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ShiftsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get driverId => getField<int>('driver_id');
  set driverId(int? value) => setField<int>('driver_id', value);

  DateTime? get startedTime => getField<DateTime>('started_time');
  set startedTime(DateTime? value) => setField<DateTime>('started_time', value);

  DateTime? get finishedTime => getField<DateTime>('finished_time');
  set finishedTime(DateTime? value) =>
      setField<DateTime>('finished_time', value);

  double? get earned => getField<double>('earned');
  set earned(double? value) => setField<double>('earned', value);

  double? get ordersNum => getField<double>('ordersNum');
  set ordersNum(double? value) => setField<double>('ordersNum', value);
}
