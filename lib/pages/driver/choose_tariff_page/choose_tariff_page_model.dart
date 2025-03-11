import '/backend/supabase/supabase.dart';
import '/components/bottom_bar_driver_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'choose_tariff_page_widget.dart' show ChooseTariffPageWidget;
import 'package:flutter/material.dart';

class ChooseTariffPageModel extends FlutterFlowModel<ChooseTariffPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ShiftsRow? createdShift;
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
