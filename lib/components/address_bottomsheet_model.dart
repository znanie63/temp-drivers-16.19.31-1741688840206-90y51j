import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'address_bottomsheet_widget.dart' show AddressBottomsheetWidget;
import 'package:flutter/material.dart';

class AddressBottomsheetModel
    extends FlutterFlowModel<AddressBottomsheetWidget> {
  ///  Local state fields for this component.

  List<String> addressText = [];
  void addToAddressText(String item) => addressText.add(item);
  void removeFromAddressText(String item) => addressText.remove(item);
  void removeAtIndexFromAddressText(int index) => addressText.removeAt(index);
  void insertAtIndexInAddressText(int index, String item) =>
      addressText.insert(index, item);
  void updateAddressTextAtIndex(int index, Function(String) updateFn) =>
      addressText[index] = updateFn(addressText[index]);

  List<String> addressLat = [];
  void addToAddressLat(String item) => addressLat.add(item);
  void removeFromAddressLat(String item) => addressLat.remove(item);
  void removeAtIndexFromAddressLat(int index) => addressLat.removeAt(index);
  void insertAtIndexInAddressLat(int index, String item) =>
      addressLat.insert(index, item);
  void updateAddressLatAtIndex(int index, Function(String) updateFn) =>
      addressLat[index] = updateFn(addressLat[index]);

  List<String> addressLong = [];
  void addToAddressLong(String item) => addressLong.add(item);
  void removeFromAddressLong(String item) => addressLong.remove(item);
  void removeAtIndexFromAddressLong(int index) => addressLong.removeAt(index);
  void insertAtIndexInAddressLong(int index, String item) =>
      addressLong.insert(index, item);
  void updateAddressLongAtIndex(int index, Function(String) updateFn) =>
      addressLong[index] = updateFn(addressLong[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (getAddresses)] action in TextField widget.
  ApiCallResponse? apiResult3cc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
