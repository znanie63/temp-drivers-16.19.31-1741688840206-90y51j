import '../database.dart';

class OrdersTable extends SupabaseTable<OrdersRow> {
  @override
  String get tableName => 'orders';

  @override
  OrdersRow createRow(Map<String, dynamic> data) => OrdersRow(data);
}

class OrdersRow extends SupabaseDataRow {
  OrdersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrdersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get departureAddress => getField<String>('departure_address');
  set departureAddress(String? value) =>
      setField<String>('departure_address', value);

  String? get destinationAddress => getField<String>('destination_address');
  set destinationAddress(String? value) =>
      setField<String>('destination_address', value);

  String? get clientPhone => getField<String>('client_phone');
  set clientPhone(String? value) => setField<String>('client_phone', value);

  int? get driverId => getField<int>('driver_id');
  set driverId(int? value) => setField<int>('driver_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get rateId => getField<int>('rate_id');
  set rateId(int? value) => setField<int>('rate_id', value);

  double? get finishedPrice => getField<double>('finished_price');
  set finishedPrice(double? value) => setField<double>('finished_price', value);

  String? get rateText => getField<String>('rate_text');
  set rateText(String? value) => setField<String>('rate_text', value);

  double? get startedPrice => getField<double>('started_price');
  set startedPrice(double? value) => setField<double>('started_price', value);

  String? get departureLatitude => getField<String>('departure_latitude');
  set departureLatitude(String? value) =>
      setField<String>('departure_latitude', value);

  String? get departureLongitude => getField<String>('departure_longitude');
  set departureLongitude(String? value) =>
      setField<String>('departure_longitude', value);

  String? get destinationLatitude => getField<String>('destination_latitude');
  set destinationLatitude(String? value) =>
      setField<String>('destination_latitude', value);

  String? get destinationLongitude => getField<String>('destination_longitude');
  set destinationLongitude(String? value) =>
      setField<String>('destination_longitude', value);

  double? get ridedkm => getField<double>('ridedkm');
  set ridedkm(double? value) => setField<double>('ridedkm', value);

  double? get kmPrice => getField<double>('km_price');
  set kmPrice(double? value) => setField<double>('km_price', value);

  double? get feePercent => getField<double>('fee_percent');
  set feePercent(double? value) => setField<double>('fee_percent', value);

  DateTime? get assignedTime => getField<DateTime>('assigned_time');
  set assignedTime(DateTime? value) =>
      setField<DateTime>('assigned_time', value);

  DateTime? get arrivedTime => getField<DateTime>('arrived_time');
  set arrivedTime(DateTime? value) => setField<DateTime>('arrived_time', value);

  DateTime? get completedTime => getField<DateTime>('completed_time');
  set completedTime(DateTime? value) =>
      setField<DateTime>('completed_time', value);

  DateTime? get cancelledTime => getField<DateTime>('cancelled_time');
  set cancelledTime(DateTime? value) =>
      setField<DateTime>('cancelled_time', value);

  double? get feeCost => getField<double>('fee_cost');
  set feeCost(double? value) => setField<double>('fee_cost', value);

  String? get driverPhone => getField<String>('driver_phone');
  set driverPhone(String? value) => setField<String>('driver_phone', value);

  String? get driverName => getField<String>('driver_name');
  set driverName(String? value) => setField<String>('driver_name', value);
}
