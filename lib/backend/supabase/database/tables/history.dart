import '../database.dart';

class HistoryTable extends SupabaseTable<HistoryRow> {
  @override
  String get tableName => 'history';

  @override
  HistoryRow createRow(Map<String, dynamic> data) => HistoryRow(data);
}

class HistoryRow extends SupabaseDataRow {
  HistoryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HistoryTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get userid => getField<int>('userid');
  set userid(int? value) => setField<int>('userid', value);

  double? get value => getField<double>('value');
  set value(double? value) => setField<double>('value', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);
}
