import '/backend/supabase/supabase.dart';
import '/components/bottom_bar_admin_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'driver_page_widget.dart' show DriverPageWidget;
import 'package:flutter/material.dart';

class DriverPageModel extends FlutterFlowModel<DriverPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Delete Row(s)] action in Container widget.
  List<UsersRow>? deleteDriver;
  // Model for BottomBarAdmin component.
  late BottomBarAdminModel bottomBarAdminModel;

  @override
  void initState(BuildContext context) {
    bottomBarAdminModel = createModel(context, () => BottomBarAdminModel());
  }

  @override
  void dispose() {
    bottomBarAdminModel.dispose();
  }
}
