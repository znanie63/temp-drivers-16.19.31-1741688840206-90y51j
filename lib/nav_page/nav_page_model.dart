import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'nav_page_widget.dart' show NavPageWidget;
import 'package:flutter/material.dart';

class NavPageModel extends FlutterFlowModel<NavPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in NavPage widget.
  List<ShiftsRow>? queryShifts;
  // Stores action output result for [Backend Call - Query Rows] action in NavPage widget.
  List<OrdersRow>? queryOrders;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
