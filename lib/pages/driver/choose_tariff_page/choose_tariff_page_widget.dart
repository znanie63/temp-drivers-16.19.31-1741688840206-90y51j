import '/backend/supabase/supabase.dart';
import '/components/bottom_bar_driver_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'choose_tariff_page_model.dart';
export 'choose_tariff_page_model.dart';

class ChooseTariffPageWidget extends StatefulWidget {
  const ChooseTariffPageWidget({super.key});

  static String routeName = 'ChooseTariffPage';
  static String routePath = '/chooseTariffPage';

  @override
  State<ChooseTariffPageWidget> createState() => _ChooseTariffPageWidgetState();
}

class _ChooseTariffPageWidgetState extends State<ChooseTariffPageWidget> {
  late ChooseTariffPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseTariffPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Container(
                          width: 34.0,
                          height: 34.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Icon(
                              FFIcons.kback,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 14.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Выберите тариф',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      lineHeight: 1.35,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 6.0, 0.0, 0.0),
                                child: Text(
                                  'Выберите тарифы. Их можно будет поменять во время смены.',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              FutureBuilder<List<RatesRow>>(
                                future: RatesTable().queryRows(
                                  queryFn: (q) =>
                                      q.order('id', ascending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<RatesRow> columnRatesRowList =
                                      snapshot.data!;

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children:
                                        List.generate(columnRatesRowList.length,
                                                (columnIndex) {
                                      final columnRatesRow =
                                          columnRatesRowList[columnIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (FFAppState()
                                              .userInfo
                                              .rateidlist
                                              .contains(columnRatesRow.id
                                                  .toString())) {
                                            FFAppState().updateUserInfoStruct(
                                              (e) => e
                                                ..updateRateidlist(
                                                  (e) => e.remove(columnRatesRow
                                                      .id
                                                      .toString()),
                                                ),
                                            );
                                            safeSetState(() {});
                                          } else {
                                            FFAppState().updateUserInfoStruct(
                                              (e) => e
                                                ..updateRateidlist(
                                                  (e) => e.add(columnRatesRow.id
                                                      .toString()),
                                                ),
                                            );
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 91.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 25.0,
                                                color: Color(0x1111110A),
                                                offset: Offset(
                                                  0.0,
                                                  4.0,
                                                ),
                                                spreadRadius: 0.0,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: FFAppState()
                                                      .userInfo
                                                      .rateidlist
                                                      .contains(columnRatesRow
                                                          .id
                                                          .toString())
                                                  ? functions.textToColor(
                                                      columnRatesRow.color!)
                                                  : Colors.white,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 49.0,
                                                  height: 49.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFDEFEF3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            116.0),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      if (columnRatesRow
                                                              .title ==
                                                          'Дневной')
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Icon(
                                                            FFIcons.kday,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            size: 25.0,
                                                          ),
                                                        ),
                                                      if (columnRatesRow
                                                              .title ==
                                                          'Ночной')
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Icon(
                                                            FFIcons.knight,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            size: 25.0,
                                                          ),
                                                        ),
                                                      if (columnRatesRow
                                                              .title ==
                                                          'Трезвый')
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Icon(
                                                            FFIcons.ksober,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            size: 25.0,
                                                          ),
                                                        ),
                                                      if (columnRatesRow
                                                              .title ==
                                                          'Доставка')
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Icon(
                                                            FFIcons.kdelivery,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            size: 25.0,
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                Stack(
                                                  children: [
                                                    if (!FFAppState()
                                                        .userInfo
                                                        .rateidlist
                                                        .contains(columnRatesRow
                                                            .id
                                                            .toString()))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    17.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            columnRatesRow
                                                                .title,
                                                            'title',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                lineHeight: 1.5,
                                                              ),
                                                        ),
                                                      ),
                                                    if (FFAppState()
                                                        .userInfo
                                                        .rateidlist
                                                        .contains(columnRatesRow
                                                            .id
                                                            .toString()))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    17.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            columnRatesRow
                                                                .title,
                                                            'title',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                lineHeight: 1.5,
                                                              ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                                            .divide(SizedBox(height: 14.0))
                                            .addToStart(SizedBox(height: 16.0)),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (FFAppState().userInfo.lastShiftid == '')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 26.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.createdShift = await ShiftsTable().insert({
                                'driver_id': FFAppState().userInfo.id,
                                'started_time': supaSerialize<DateTime>(
                                    getCurrentTimestamp),
                              });
                              FFAppState().updateUserInfoStruct(
                                (e) => e
                                  ..lastShiftid =
                                      _model.createdShift?.id.toString(),
                              );
                              safeSetState(() {});
                              context.safePop();

                              safeSetState(() {});
                            },
                            text: 'Сохранить',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 52.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    lineHeight: 1.5,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.bottomBarDriverModel,
                updateCallback: () => safeSetState(() {}),
                child: BottomBarDriverWidget(
                  pageName: 'orders',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
