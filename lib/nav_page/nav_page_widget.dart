import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'nav_page_model.dart';
export 'nav_page_model.dart';

class NavPageWidget extends StatefulWidget {
  const NavPageWidget({super.key});

  static String routeName = 'NavPage';
  static String routePath = '/navPage';

  @override
  State<NavPageWidget> createState() => _NavPageWidgetState();
}

class _NavPageWidgetState extends State<NavPageWidget> {
  late NavPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().userInfo.phoneNum != '') {
        if ((FFAppState().userInfo.userType == 'admin') ||
            (FFAppState().userInfo.userType == 'super')) {
          context.goNamed(AllDriversPageWidget.routeName);
        } else {
          _model.queryShifts = await ShiftsTable().queryRows(
            queryFn: (q) => q
                .eqOrNull(
                  'driver_id',
                  FFAppState().userInfo.id,
                )
                .isFilter(
                  'finished_time',
                  null,
                ),
          );
          if (_model.queryShifts != null && (_model.queryShifts)!.isNotEmpty) {
            FFAppState().updateUserInfoStruct(
              (e) => e
                ..lastShiftid = _model.queryShifts?.firstOrNull?.id.toString(),
            );
            safeSetState(() {});
          } else {
            FFAppState().updateUserInfoStruct(
              (e) => e..lastShiftid = null,
            );
            safeSetState(() {});
          }

          _model.queryOrders = await OrdersTable().queryRows(
            queryFn: (q) => q
                .neqOrNull(
                  'status',
                  'completed',
                )
                .eqOrNull(
                  'driver_id',
                  FFAppState().userInfo.id,
                )
                .neqOrNull(
                  'status',
                  'cancelled',
                ),
          );
          if (_model.queryOrders != null && (_model.queryOrders)!.isNotEmpty) {
            FFAppState().updateUserInfoStruct(
              (e) => e
                ..currentOrderID =
                    _model.queryOrders?.firstOrNull?.id.toString(),
            );
            safeSetState(() {});
          } else {
            FFAppState().updateUserInfoStruct(
              (e) => e..currentOrderID = null,
            );
            safeSetState(() {});
          }

          context.goNamed(OrdersPageWidget.routeName);
        }
      } else {
        context.goNamed(AuthPageWidget.routeName);
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
    );
  }
}
