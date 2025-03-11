import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'new_order_page_widget.dart' show NewOrderPageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NewOrderPageModel extends FlutterFlowModel<NewOrderPageWidget> {
  ///  Local state fields for this page.

  int? chosenRateID;

  String? departureAddress = '';

  String? destinationAddress;

  String? chosenRateName;

  List<String> ids = ['6', '1'];
  void addToIds(String item) => ids.add(item);
  void removeFromIds(String item) => ids.remove(item);
  void removeAtIndexFromIds(int index) => ids.removeAt(index);
  void insertAtIndexInIds(int index, String item) => ids.insert(index, item);
  void updateIdsAtIndex(int index, Function(String) updateFn) =>
      ids[index] = updateFn(ids[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  final textFieldMask = MaskTextInputFormatter(mask: '+993 ## ######');
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Bottom Sheet - AddressBottomsheet] action in Container widget.
  AddressStruct? outputAddress;
  // Stores action output result for [Bottom Sheet - AddressBottomsheet] action in Container widget.
  AddressStruct? destinationAddressOutput;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<RatesRow>? queryRate;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  OrdersRow? insertOrder;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? querydrivers;
  // Stores action output result for [Backend Call - API (SendNotification)] action in Button widget.
  ApiCallResponse? apiResultkd2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
