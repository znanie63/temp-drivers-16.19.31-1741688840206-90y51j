import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'driver_statistics_page_widget.dart' show DriverStatisticsPageWidget;
import 'package:flutter/material.dart';

class DriverStatisticsPageModel
    extends FlutterFlowModel<DriverStatisticsPageWidget> {
  ///  Local state fields for this page.

  String chosenFilter = 'all';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Bottom Sheet - FilterBottomSheet] action in Stack widget.
  String? filterOutput;
  Stream<List<ShiftsRow>>? containerSupabaseStream;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
