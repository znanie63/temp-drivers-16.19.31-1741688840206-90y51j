import '/backend/supabase/supabase.dart';
import '/components/bottom_bar_driver_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'orders_page_widget.dart' show OrdersPageWidget;
import 'package:flutter/material.dart';

class OrdersPageModel extends FlutterFlowModel<OrdersPageWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<UsersRow>>? ordersPageSupabaseStream;
  // Stores action output result for [Backend Call - Update Row(s)] action in Container widget.
  List<UsersRow>? deactivate;
  // Stores action output result for [Backend Call - Update Row(s)] action in Container widget.
  List<UsersRow>? activate;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<ShiftsRow>? updateShift;
  Stream<List<OrdersRow>>? containerSupabaseStream;
  // Stores action output result for [Backend Call - Update Row(s)] action in Container widget.
  List<UsersRow>? addToCancelList;
  // Stores action output result for [Custom Action - checkPermissions] action in Container widget.
  bool? checkPermissionRes;
  // Stores action output result for [Backend Call - Update Row(s)] action in Container widget.
  List<OrdersRow>? updateorderstatus;
  // Model for BottomBarDriver component.
  late BottomBarDriverModel bottomBarDriverModel;

  @override
  void initState(BuildContext context) {
    bottomBarDriverModel = createModel(context, () => BottomBarDriverModel());
  }

  @override
  void dispose() {
    bottomBarDriverModel.dispose();
  }
}
