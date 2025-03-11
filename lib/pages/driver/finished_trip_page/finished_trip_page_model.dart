import '/components/bottom_bar_driver_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'finished_trip_page_widget.dart' show FinishedTripPageWidget;
import 'package:flutter/material.dart';

class FinishedTripPageModel extends FlutterFlowModel<FinishedTripPageWidget> {
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
