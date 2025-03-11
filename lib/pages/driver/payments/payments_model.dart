import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payments_widget.dart' show PaymentsWidget;
import 'package:flutter/material.dart';

class PaymentsModel extends FlutterFlowModel<PaymentsWidget> {
  ///  Local state fields for this page.

  bool showDep = true;

  ///  State fields for stateful widgets in this page.

  Stream<List<HistoryRow>>? containerSupabaseStream;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
