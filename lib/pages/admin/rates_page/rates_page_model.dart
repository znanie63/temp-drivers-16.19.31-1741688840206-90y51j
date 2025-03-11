import '/backend/supabase/supabase.dart';
import '/components/bottom_bar_admin_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'rates_page_widget.dart' show RatesPageWidget;
import 'package:flutter/material.dart';

class RatesPageModel extends FlutterFlowModel<RatesPageWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<RatesRow>>? columnSupabaseStream;
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
