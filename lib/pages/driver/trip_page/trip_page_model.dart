import '/backend/supabase/supabase.dart';
import '/components/bottom_bar_driver_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'trip_page_widget.dart' show TripPageWidget;
import 'package:flutter/material.dart';

class TripPageModel extends FlutterFlowModel<TripPageWidget> {
  ///  Local state fields for this page.

  double km = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Update Row(s)] action in Container widget.
  List<OrdersRow>? cancelWithFee;
  // Stores action output result for [Backend Call - Update Row(s)] action in Container widget.
  List<UsersRow>? updateBallanceFee;
  // Stores action output result for [Backend Call - Update Row(s)] action in Container widget.
  List<OrdersRow>? updateOrder;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<OrdersRow>? updateOrderStatusArrived;
  Completer<List<OrdersRow>>? requestCompleter;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<OrdersRow>? finishOrder;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UsersRow>? updateUser;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  HistoryRow? insertEarned;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  HistoryRow? insertCommission;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ShiftsRow>? queryShift;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<ShiftsRow>? updateShift;
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

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
