import '/backend/supabase/supabase.dart';
import '/components/bottom_bar_driver_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'statistics_page_widget.dart' show StatisticsPageWidget;
import 'package:flutter/material.dart';

class StatisticsPageModel extends FlutterFlowModel<StatisticsPageWidget> {
  ///  Local state fields for this page.

  bool showFinished = true;

  String chosenFilter = 'all';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Bottom Sheet - FilterBottomSheet] action in Stack widget.
  String? filterOutput;
  Stream<List<OrdersRow>>? containerSupabaseStream;
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
