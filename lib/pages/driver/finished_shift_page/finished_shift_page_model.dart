import '/components/bottom_bar_driver_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'finished_shift_page_widget.dart' show FinishedShiftPageWidget;
import 'package:flutter/material.dart';

class FinishedShiftPageModel extends FlutterFlowModel<FinishedShiftPageWidget> {
  ///  State fields for stateful widgets in this page.

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
