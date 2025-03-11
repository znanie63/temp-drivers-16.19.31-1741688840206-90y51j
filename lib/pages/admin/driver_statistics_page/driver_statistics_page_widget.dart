import '';
import '/backend/supabase/supabase.dart';
import '/components/filter_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'driver_statistics_page_model.dart';
export 'driver_statistics_page_model.dart';

class DriverStatisticsPageWidget extends StatefulWidget {
  const DriverStatisticsPageWidget({
    super.key,
    required this.driverInfo,
  });

  final UsersRow? driverInfo;

  static String routeName = 'DriverStatisticsPage';
  static String routePath = '/driverStatisticsPage';

  @override
  State<DriverStatisticsPageWidget> createState() =>
      _DriverStatisticsPageWidgetState();
}

class _DriverStatisticsPageWidgetState
    extends State<DriverStatisticsPageWidget> {
  late DriverStatisticsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DriverStatisticsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            actions: [],
            centerTitle: true,
            toolbarHeight: 0.0,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 23.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Container(
                          width: 34.0,
                          height: 34.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Icon(
                            FFIcons.kback,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 14.0,
                          ),
                        ),
                      ),
                      Text(
                        'Статистика',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              lineHeight: 1.35,
                            ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: Color(0x4C000000),
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: FilterBottomSheetWidget(
                                    chosenFilter: _model.chosenFilter,
                                  ),
                                ),
                              );
                            },
                          ).then((value) =>
                              safeSetState(() => _model.filterOutput = value));

                          _model.chosenFilter = _model.filterOutput!;
                          safeSetState(() {});

                          safeSetState(() {});
                        },
                        child: Stack(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 2.0, 0.0),
                              child: Container(
                                width: 34.0,
                                height: 34.0,
                                decoration: BoxDecoration(
                                  color: _model.chosenFilter != ''
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : Color(0xFFF2F2F2),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: _model.chosenFilter != ''
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : Color(0x00000000),
                                    width: _model.chosenFilter != ''
                                        ? 1.0
                                        : 0.0,
                                  ),
                                ),
                                child: Icon(
                                  FFIcons.kfilter,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 18.0,
                                ),
                              ),
                            ),
                            if (_model.chosenFilter != '')
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: SvgPicture.asset(
                                  'assets/images/blackOne.svg',
                                  width: 12.0,
                                  height: 12.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<List<ShiftsRow>>(
                  stream: _model.containerSupabaseStream ??= SupaFlow.client
                      .from("shifts")
                      .stream(primaryKey: ['id'])
                      .eqOrNull(
                        'driver_id',
                        widget.driverInfo?.id,
                      )
                      .map((list) =>
                          list.map((item) => ShiftsRow(item)).toList()),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 40.0,
                          height: 40.0,
                          child: SpinKitPulse(
                            color: FlutterFlowTheme.of(context).primary,
                            size: 40.0,
                          ),
                        ),
                      );
                    }
                    List<ShiftsRow> containerShiftsRowList = snapshot.data!;

                    return Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 68.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent1,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    functions.sumofList(functions
                                        .filterShifts(
                                            containerShiftsRowList.toList(),
                                            _model.chosenFilter)
                                        ?.map((e) => e.ordersNum.toString())
                                        .toList()
                                        .toList()),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        lineHeight: 1.5,
                                      ),
                                ),
                                Text(
                                  'Всего поездок',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 9.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.35,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 68.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent1,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      functions
                                          .filterShifts(
                                              containerShiftsRowList
                                                  .where((e) =>
                                                      e.finishedTime != null)
                                                  .toList(),
                                              _model.chosenFilter)
                                          ?.length
                                          .toString(),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                  Text(
                                    'Всего смен',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          lineHeight: 1.35,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 68.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent1,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${functions.sumofList(functions.filterShifts(containerShiftsRowList.toList(), _model.chosenFilter)?.map((e) => e.earned.toString()).toList().toList())} TMT',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        lineHeight: 1.5,
                                      ),
                                ),
                                Text(
                                  'Заработано',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 9.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.35,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
