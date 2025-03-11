import '/backend/supabase/supabase.dart';
import '/components/bottom_bar_admin_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'admin_orders_page_widget.dart' show AdminOrdersPageWidget;
import 'package:flutter/material.dart';

class AdminOrdersPageModel extends FlutterFlowModel<AdminOrdersPageWidget> {
  ///  Local state fields for this page.

  String orderStatus = 'pending';

  ///  State fields for stateful widgets in this page.

  Stream<List<OrdersRow>>? containerSupabaseStream;
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
