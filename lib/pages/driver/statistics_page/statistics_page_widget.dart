import '';
import '/backend/supabase/supabase.dart';
import '/components/bottom_bar_driver_widget.dart';
import '/components/filter_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'statistics_page_model.dart';
export 'statistics_page_model.dart';

class StatisticsPageWidget extends StatefulWidget {
  const StatisticsPageWidget({super.key});

  static String routeName = 'StatisticsPage';
  static String routePath = '/statisticsPage';

  @override
  State<StatisticsPageWidget> createState() => _StatisticsPageWidgetState();
}

class _StatisticsPageWidgetState extends State<StatisticsPageWidget> {
  late StatisticsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatisticsPageModel());
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
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            actions: [],
            centerTitle: true,
            toolbarHeight: 0.0,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF201E1E),
            ),
            child: Stack(
              alignment: AlignmentDirectional(0.0, 1.0),
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: SvgPicture.asset(
                              'assets/images/stat_bg.svg',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 23.0, 24.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Статистика аккаунта',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 15.0,
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
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: FilterBottomSheetWidget(
                                                chosenFilter:
                                                    _model.chosenFilter,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(
                                          () => _model.filterOutput = value));

                                      _model.chosenFilter =
                                          _model.filterOutput!;
                                      safeSetState(() {});

                                      safeSetState(() {});
                                    },
                                    child: Stack(
                                      alignment:
                                          AlignmentDirectional(1.0, -1.0),
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 2.0, 0.0),
                                          child: Container(
                                            width: 34.0,
                                            height: 34.0,
                                            decoration: BoxDecoration(
                                              color: _model.chosenFilter != ''
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : Color(0xFF393838),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: _model.chosenFilter !=
                                                            ''
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground
                                                    : Color(0x00000000),
                                                width: _model.chosenFilter !=
                                                            ''
                                                    ? 1.0
                                                    : 0.0,
                                              ),
                                            ),
                                            child: Icon(
                                              FFIcons.kfilter,
                                              color: _model.chosenFilter != ''
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 18.0,
                                            ),
                                          ),
                                        ),
                                        if (_model.chosenFilter != '')
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: SvgPicture.asset(
                                              'assets/images/one.svg',
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
                              FutureBuilder<List<ShiftsRow>>(
                                future: ShiftsTable().queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'driver_id',
                                    FFAppState().userInfo.id,
                                  ),
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
                                  List<ShiftsRow> containerShiftsRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 5.5, 0.0),
                                              child: Container(
                                                height: 68.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      functions.sumOfListDouble(
                                                          functions
                                                              .filterShifts(
                                                                  containerShiftsRowList
                                                                      .toList(),
                                                                  _model
                                                                      .chosenFilter)!
                                                              .map((e) =>
                                                                  e.ordersNum)
                                                              .withoutNulls
                                                              .toList(),
                                                          false),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                    Text(
                                                      'Поездки',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            fontSize: 9.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            lineHeight: 1.35,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.5, 0.0, 5.5, 0.0),
                                              child: Container(
                                                height: 68.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        functions
                                                            .filterShifts(
                                                                containerShiftsRowList
                                                                    .toList(),
                                                                _model
                                                                    .chosenFilter)
                                                            ?.where((e) =>
                                                                e.finishedTime !=
                                                                null)
                                                            .toList()
                                                            .length
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                    Text(
                                                      'Смен закрыто',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            fontSize: 9.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            lineHeight: 1.35,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.5, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    PaymentsWidget.routeName,
                                                    queryParameters: {
                                                      'isDep': serializeParam(
                                                        false,
                                                        ParamType.bool,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Container(
                                                  height: 68.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        '${functions.sumOfListDouble(functions.filterShifts(containerShiftsRowList.toList(), _model.chosenFilter)!.map((e) => e.earned).withoutNulls.toList(), true)} TMT',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                      Text(
                                                        'Заработано',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize: 9.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  lineHeight:
                                                                      1.35,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 148.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 31.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 3.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.showFinished = true;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              height: 32.0,
                                              decoration: BoxDecoration(
                                                color: _model.showFinished
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : Color(0x00000000),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: _model.showFinished
                                                      ? Color(0x00000000)
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  width: _model.showFinished
                                                      ? 0.0
                                                      : 1.0,
                                                ),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'Завершенные',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: _model.showFinished
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 11.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      lineHeight: 1.5,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  3.0, 0.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.showFinished = false;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              height: 32.0,
                                              decoration: BoxDecoration(
                                                color: !_model.showFinished
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : Color(0x00000000),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: !_model.showFinished
                                                      ? Color(0x00000000)
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  width: !_model.showFinished
                                                      ? 0.0
                                                      : 1.0,
                                                ),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'Отмененные',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: !_model
                                                              .showFinished
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 11.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      lineHeight: 1.5,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: StreamBuilder<List<OrdersRow>>(
                                    stream: _model.containerSupabaseStream ??=
                                        SupaFlow.client
                                            .from("orders")
                                            .stream(primaryKey: ['id'])
                                            .eqOrNull(
                                              'driver_id',
                                              FFAppState().userInfo.id,
                                            )
                                            .order('id')
                                            .map((list) => list
                                                .map((item) => OrdersRow(item))
                                                .toList()),
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
                                      List<OrdersRow> containerOrdersRowList =
                                          snapshot.data!;

                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 7.0, 0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final order = functions
                                                      .orderStats(
                                                          _model.chosenFilter,
                                                          (_model.showFinished
                                                                  ? containerOrdersRowList
                                                                      .where((e) =>
                                                                          e.status ==
                                                                          'completed')
                                                                      .toList()
                                                                  : containerOrdersRowList
                                                                      .where((e) =>
                                                                          e.status ==
                                                                          'cancelled')
                                                                      .toList())
                                                              .toList())
                                                      ?.toList() ??
                                                  [];

                                              return ListView.separated(
                                                padding: EdgeInsets.fromLTRB(
                                                  0,
                                                  10.0,
                                                  0,
                                                  97.0,
                                                ),
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: order.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 8.0),
                                                itemBuilder:
                                                    (context, orderIndex) {
                                                  final orderItem =
                                                      order[orderIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: functions
                                                            .linesNumConHeight(
                                                                '${orderItem.departureAddress}${valueOrDefault<String>(
                                                                  orderItem
                                                                      .destinationAddress,
                                                                  'text',
                                                                )}',
                                                                10,
                                                                _model.showFinished
                                                                    ? 160
                                                                    : 100)
                                                            .toDouble(),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFFE1E1E1),
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                54.0,
                                                                            height:
                                                                                15.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: () {
                                                                                if (orderItem.rateId == 1) {
                                                                                  return Color(0xFF26E3BA);
                                                                                } else if (orderItem.rateId == 2) {
                                                                                  return Color(0xFF2C3E50);
                                                                                } else if (orderItem.rateId == 3) {
                                                                                  return Color(0xFFF5C242);
                                                                                } else if (orderItem.rateId == 4) {
                                                                                  return Color(0xFF3498DB);
                                                                                } else {
                                                                                  return Color(0xFFF2F2F2);
                                                                                }
                                                                              }(),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  orderItem.rateText,
                                                                                  'text',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      fontSize: 8.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      lineHeight: 1.35,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: 11.0,
                                                                                height: 11.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x00FFFFFF),
                                                                                  borderRadius: BorderRadius.circular(11.0),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFC3C3C3),
                                                                                    width: 3.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 1.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFD9D9D9),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                orderItem.departureAddress,
                                                                                'text',
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    lineHeight: 1.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 13.0)),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                54.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  _model.showFinished
                                                                                      ? dateTimeFormat(
                                                                                          "d.M.y",
                                                                                          orderItem.completedTime!,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        )
                                                                                      : dateTimeFormat(
                                                                                          "d.M.y",
                                                                                          orderItem.cancelledTime!,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 8.0,
                                                                                        letterSpacing: 0.0,
                                                                                        lineHeight: 1.0,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  _model.showFinished
                                                                                      ? dateTimeFormat(
                                                                                          "HH:mm",
                                                                                          orderItem.completedTime!,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        )
                                                                                      : dateTimeFormat(
                                                                                          "HH:mm",
                                                                                          orderItem.cancelledTime!,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 8.0,
                                                                                        letterSpacing: 0.0,
                                                                                        lineHeight: 1.0,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 5.0)),
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 1.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFD9D9D9),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 11.0,
                                                                                height: 11.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x00FFFFFF),
                                                                                  borderRadius: BorderRadius.circular(11.0),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFF26E3BA),
                                                                                    width: 3.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                orderItem.destinationAddress,
                                                                                'text',
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    lineHeight: 1.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 13.0)),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (_model
                                                                              .showFinished)
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  'Расстояние',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 15.0,
                                                                                        letterSpacing: 0.0,
                                                                                        lineHeight: 1.35,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  '${orderItem.ridedkm?.toString()}км',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 15.0,
                                                                                        letterSpacing: 0.0,
                                                                                        lineHeight: 1.35,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          if (_model
                                                                              .showFinished)
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  'Стоимость',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 15.0,
                                                                                        letterSpacing: 0.0,
                                                                                        lineHeight: 1.35,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  '${orderItem.finishedPrice?.toString()} TMT',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 15.0,
                                                                                        letterSpacing: 0.0,
                                                                                        lineHeight: 1.35,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          if (_model
                                                                              .showFinished)
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  'Комиссия',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 15.0,
                                                                                        letterSpacing: 0.0,
                                                                                        lineHeight: 1.35,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  '${orderItem.feeCost?.toString()} TMT',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 15.0,
                                                                                        letterSpacing: 0.0,
                                                                                        lineHeight: 1.35,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                'Клиент',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                      lineHeight: 1.35,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  orderItem.clientPhone,
                                                                                  'phone',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                      lineHeight: 1.35,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                wrapWithModel(
                  model: _model.bottomBarDriverModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BottomBarDriverWidget(
                    pageName: 'statistics',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
