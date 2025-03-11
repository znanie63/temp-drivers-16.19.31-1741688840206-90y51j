import '../database.dart';

class RatesTable extends SupabaseTable<RatesRow> {
  @override
  String get tableName => 'rates';

  @override
  RatesRow createRow(Map<String, dynamic> data) => RatesRow(data);
}

class RatesRow extends SupabaseDataRow {
  RatesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RatesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  double? get startingPrice => getField<double>('starting_price');
  set startingPrice(double? value) => setField<double>('starting_price', value);

  double? get kmPrice => getField<double>('km_price');
  set kmPrice(double? value) => setField<double>('km_price', value);

  int? get feePercent => getField<int>('fee_percent');
  set feePercent(int? value) => setField<int>('fee_percent', value);

  String? get color => getField<String>('color');
  set color(String? value) => setField<String>('color', value);
}
