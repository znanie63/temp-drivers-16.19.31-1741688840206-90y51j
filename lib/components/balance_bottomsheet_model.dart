import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'balance_bottomsheet_widget.dart' show BalanceBottomsheetWidget;
import 'package:flutter/material.dart';

class BalanceBottomsheetModel
    extends FlutterFlowModel<BalanceBottomsheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? queryDriver;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UsersRow>? updateBallance;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  HistoryRow? insertHistory;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
