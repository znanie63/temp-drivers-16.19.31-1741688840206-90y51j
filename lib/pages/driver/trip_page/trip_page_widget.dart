import '';
import '/backend/supabase/supabase.dart';
import '/components/bottom_bar_driver_widget.dart';
import '/components/simple_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'trip_page_model.dart';
export 'trip_page_model.dart';

class TripPageWidget extends StatefulWidget {
  const TripPageWidget({super.key});

  static String routeName = 'TripPage';
  static String routePath = '/tripPage';

  @override
  State<TripPageWidget> createState() => _TripPageWidgetState();
}

class _TripPageWidgetState extends State<TripPageWidget> {
  late TripPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TripPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<UsersRow>>(
      future: UsersTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          FFAppState().userInfo.id,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRow> tripPageUsersRowList = snapshot.data!;

        final tripPageUsersRow =
            tripPageUsersRowList.isNotEmpty ? tripPageUsersRowList.first : null;

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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 29.0),
                            child: Text(
                              'Текущая поездка',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    lineHeight: 1.35,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                if (FFAppState().userInfo.currentOrderID != '')
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: FutureBuilder<List<OrdersRow>>(
                                        future: (_model.requestCompleter ??=
                                                Completer<List<OrdersRow>>()
                                                  ..complete(OrdersTable()
                                                      .querySingleRow(
                                                    queryFn: (q) => q.eqOrNull(
                                                      'id',
                                                      functions.textToInt(
                                                          FFAppState()
                                                              .userInfo
                                                              .currentOrderID),
                                                    ),
                                                  )))
                                            .future,
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<OrdersRow>
                                              containerOrdersRowList =
                                              snapshot.data!;

                                          final containerOrdersRow =
                                              containerOrdersRowList.isNotEmpty
                                                  ? containerOrdersRowList.first
                                                  : null;

                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 133.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      25.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          'TMT ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                32.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                            lineHeight:
                                                                                1.0,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        formatNumber(
                                                                          functions.calculateTotalPrice(
                                                                              _model.km.toString(),
                                                                              formatNumber(
                                                                                containerOrdersRow!.startedPrice!,
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.periodDecimal,
                                                                              ),
                                                                              containerOrdersRow.kmPrice!.toString()),
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.periodDecimal,
                                                                        ),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                56.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            lineHeight:
                                                                                1.0,
                                                                          ),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        lineHeight:
                                                                            1.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              Text(
                                                                'Стоимость поездки',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFE9FFFA),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius:
                                                                    25.0,
                                                                color: Color(
                                                                    0x1111110A),
                                                                offset: Offset(
                                                                  0.0,
                                                                  4.0,
                                                                ),
                                                                spreadRadius:
                                                                    0.0,
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        22.0,
                                                                        16.0,
                                                                        17.0,
                                                                        16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        dateTimeFormat(
                                                                          "dd MMMM, HH:mm",
                                                                          containerOrdersRow
                                                                              .createdAt,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            lineHeight:
                                                                                1.35,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          2.5,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            54.0,
                                                                        height:
                                                                            15.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderRadius:
                                                                              BorderRadius.circular(4.0),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              containerOrdersRow.rateText,
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
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          17.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/images/fromTo.svg',
                                                                          width:
                                                                              11.0,
                                                                          height:
                                                                              45.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                13.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    containerOrdersRow.departureAddress,
                                                                                    'text',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        lineHeight: 1.35,
                                                                                      ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      containerOrdersRow.destinationAddress,
                                                                                      'text',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          lineHeight: 1.35,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await launchURL(
                                                                              'tel:${containerOrdersRow.clientPhone}');
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              42.0,
                                                                          height:
                                                                              42.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Icon(
                                                                              FFIcons.kphone,
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              size: 18.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Номер клиента: ${containerOrdersRow.clientPhone}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      if (containerOrdersRow
                                                                  .status ==
                                                              'arrived'
                                                          ? (containerOrdersRow
                                                                      .destinationLatitude !=
                                                                  null &&
                                                              containerOrdersRow
                                                                      .destinationLatitude !=
                                                                  '')
                                                          : (containerOrdersRow
                                                                      .departureLatitude !=
                                                                  null &&
                                                              containerOrdersRow
                                                                      .departureLatitude !=
                                                                  ''))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (containerOrdersRow
                                                                      .status ==
                                                                  'arrived') {
                                                                await launchMap(
                                                                  location: functions.getlatlng(
                                                                      containerOrdersRow
                                                                          .destinationLatitude,
                                                                      containerOrdersRow
                                                                          .destinationLongitude),
                                                                  title: '',
                                                                );
                                                              } else {
                                                                await launchMap(
                                                                  location: functions.getlatlng(
                                                                      containerOrdersRow
                                                                          .departureLatitude,
                                                                      containerOrdersRow
                                                                          .departureLongitude),
                                                                  title: '',
                                                                );
                                                              }
                                                            },
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: 52.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFFE1E1E1),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        21.0,
                                                                        0.0,
                                                                        21.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Проложить маршрут',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            lineHeight:
                                                                                1.5,
                                                                          ),
                                                                    ),
                                                                    Icon(
                                                                      FFIcons
                                                                          .kmakeRoute,
                                                                      color: Color(
                                                                          0xFFC3C3C3),
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (containerOrdersRow
                                                              .status ==
                                                          'arrived')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      20.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'Расстояние: ${_model.km.toString()} км',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height:
                                                                          30.0,
                                                                      child: custom_widgets
                                                                          .TimeElapsedWidget(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height:
                                                                            30.0,
                                                                        startTime:
                                                                            containerOrdersRow.arrivedTime!,
                                                                      ),
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 25.0),
                                                  child: Stack(
                                                    children: [
                                                      if (containerOrdersRow
                                                              .status ==
                                                          'assigned')
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                if (functions.isDifferenceMoreThanValue(
                                                                    containerOrdersRow
                                                                        .assignedTime!,
                                                                    getCurrentTimestamp,
                                                                    300)) {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(context)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              SimpleBottomSheetWidget(
                                                                            question:
                                                                                'Отменить поездку?',
                                                                            primaryOption:
                                                                                'Продолжить поездку',
                                                                            secondaryOption:
                                                                                'Отменить поездку',
                                                                            description:
                                                                                'Спишется комиссия ₽${functions.getPercentValue(containerOrdersRow.startedPrice!, containerOrdersRow.feePercent!).toString()}',
                                                                            primaryAction:
                                                                                () async {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            secondaryAction:
                                                                                () async {
                                                                              _model.cancelWithFee = await OrdersTable().update(
                                                                                data: {
                                                                                  'status': 'cancelled',
                                                                                  'cancelled_time': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                                },
                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                  'id',
                                                                                  containerOrdersRow.id,
                                                                                ),
                                                                                returnRows: true,
                                                                              );
                                                                              _model.updateBallanceFee = await UsersTable().update(
                                                                                data: {
                                                                                  'ballance': functions.updateBallance(functions.getPercentValue(containerOrdersRow.startedPrice!, containerOrdersRow.feePercent!), tripPageUsersRow!.ballance!),
                                                                                },
                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                  'id',
                                                                                  FFAppState().userInfo.id,
                                                                                ),
                                                                                returnRows: true,
                                                                              );
                                                                              FFAppState().updateUserInfoStruct(
                                                                                (e) => e..currentOrderID = null,
                                                                              );
                                                                              safeSetState(() {});

                                                                              context.pushNamed(
                                                                                FinishedTripPageWidget.routeName,
                                                                                queryParameters: {
                                                                                  'isFinished': serializeParam(
                                                                                    false,
                                                                                    ParamType.bool,
                                                                                  ),
                                                                                  'earned': serializeParam(
                                                                                    functions.getPercentValue(containerOrdersRow.startedPrice!, containerOrdersRow.feePercent!),
                                                                                    ParamType.double,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                } else {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(context)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              SimpleBottomSheetWidget(
                                                                            question:
                                                                                'Отменить поездку?',
                                                                            primaryOption:
                                                                                'Продолжить поездку',
                                                                            secondaryOption:
                                                                                'Отменить поездку',
                                                                            primaryAction:
                                                                                () async {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            secondaryAction:
                                                                                () async {
                                                                              _model.updateOrder = await OrdersTable().update(
                                                                                data: {
                                                                                  'status': 'cancelled',
                                                                                  'cancelled_time': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                                },
                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                  'id',
                                                                                  containerOrdersRow.id,
                                                                                ),
                                                                                returnRows: true,
                                                                              );
                                                                              FFAppState().updateUserInfoStruct(
                                                                                (e) => e..currentOrderID = null,
                                                                              );
                                                                              safeSetState(() {});

                                                                              context.pushNamed(
                                                                                FinishedTripPageWidget.routeName,
                                                                                queryParameters: {
                                                                                  'isFinished': serializeParam(
                                                                                    false,
                                                                                    ParamType.bool,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Container(
                                                                width: 51.0,
                                                                height: 51.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child: Icon(
                                                                  FFIcons
                                                                      .kclose,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  size: 17.0,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  _model.updateOrderStatusArrived =
                                                                      await OrdersTable()
                                                                          .update(
                                                                    data: {
                                                                      'status':
                                                                          'arrived',
                                                                      'arrived_time':
                                                                          supaSerialize<DateTime>(
                                                                              getCurrentTimestamp),
                                                                    },
                                                                    matchingRows:
                                                                        (rows) =>
                                                                            rows.eqOrNull(
                                                                      'id',
                                                                      functions.textToInt(FFAppState()
                                                                          .userInfo
                                                                          .currentOrderID),
                                                                    ),
                                                                    returnRows:
                                                                        true,
                                                                  );
                                                                  await actions
                                                                      .currentLocationWithTimer(
                                                                    (locationinfo) async {
                                                                      FFAppState()
                                                                          .addToCoordsList(
                                                                              locationinfo!);
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.km = functions.distanceOfLocations(FFAppState()
                                                                          .coordsList
                                                                          .toList());
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                  );
                                                                  safeSetState(() =>
                                                                      _model.requestCompleter =
                                                                          null);
                                                                  await _model
                                                                      .waitForRequestCompleted();

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                text:
                                                                    'Забрал пассажира',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 51.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 10.0)),
                                                        ),
                                                      if (containerOrdersRow
                                                              .status ==
                                                          'arrived')
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            _model.finishOrder =
                                                                await OrdersTable()
                                                                    .update(
                                                              data: {
                                                                'finished_price':
                                                                    valueOrDefault<
                                                                        double>(
                                                                  functions.calculateTotalPrice(
                                                                      functions
                                                                          .distanceOfLocations(FFAppState()
                                                                              .coordsList
                                                                              .toList())
                                                                          .toString(),
                                                                      containerOrdersRow
                                                                          .startedPrice!
                                                                          .toString(),
                                                                      containerOrdersRow
                                                                          .kmPrice!
                                                                          .toString()),
                                                                  0.0,
                                                                ),
                                                                'completed_time':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                                'status':
                                                                    'completed',
                                                                'fee_cost': functions
                                                                    .getPercentValue(
                                                                        valueOrDefault<
                                                                            double>(
                                                                          functions.calculateTotalPrice(
                                                                              containerOrdersRow.ridedkm!.toString(),
                                                                              containerOrdersRow.startedPrice!.toString(),
                                                                              containerOrdersRow.kmPrice!.toString()),
                                                                          0.0,
                                                                        ),
                                                                        containerOrdersRow
                                                                            .feePercent!),
                                                                'ridedkm': functions.distanceOfLocations(
                                                                    FFAppState()
                                                                        .coordsList
                                                                        .toList()),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                'id',
                                                                containerOrdersRow
                                                                    .id,
                                                              ),
                                                              returnRows: true,
                                                            );
                                                            _model.updateUser =
                                                                await UsersTable()
                                                                    .update(
                                                              data: {
                                                                'ballance': functions.updateBallance(
                                                                    functions.calculateMinus(
                                                                        valueOrDefault<double>(
                                                                          functions.calculateTotalPrice(
                                                                              functions.distanceOfLocations(FFAppState().coordsList.toList()).toString(),
                                                                              containerOrdersRow.startedPrice!.toString(),
                                                                              containerOrdersRow.kmPrice!.toString()),
                                                                          0.0,
                                                                        ),
                                                                        functions.getPercentValue(
                                                                            valueOrDefault<double>(
                                                                              functions.calculateTotalPrice(functions.distanceOfLocations(FFAppState().coordsList.toList()).toString(), containerOrdersRow.startedPrice!.toString(), containerOrdersRow.kmPrice!.toString()),
                                                                              0.0,
                                                                            ),
                                                                            containerOrdersRow.feePercent!)),
                                                                    tripPageUsersRow!.ballance!),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                'id',
                                                                FFAppState()
                                                                    .userInfo
                                                                    .id,
                                                              ),
                                                              returnRows: true,
                                                            );
                                                            _model.insertEarned =
                                                                await HistoryTable()
                                                                    .insert({
                                                              'userid':
                                                                  tripPageUsersRow
                                                                      .id,
                                                              'value': functions
                                                                  .calculateMinus(
                                                                      valueOrDefault<
                                                                          double>(
                                                                        functions.calculateTotalPrice(
                                                                            functions.distanceOfLocations(FFAppState().coordsList.toList()).toString(),
                                                                            containerOrdersRow.startedPrice!.toString(),
                                                                            containerOrdersRow.kmPrice!.toString()),
                                                                        0.0,
                                                                      ),
                                                                      functions.getPercentValue(
                                                                          valueOrDefault<double>(
                                                                            functions.calculateTotalPrice(
                                                                                functions.distanceOfLocations(FFAppState().coordsList.toList()).toString(),
                                                                                containerOrdersRow.startedPrice!.toString(),
                                                                                containerOrdersRow.kmPrice!.toString()),
                                                                            0.0,
                                                                          ),
                                                                          containerOrdersRow.feePercent!)),
                                                              'type': 'earned',
                                                            });
                                                            _model.insertCommission =
                                                                await HistoryTable()
                                                                    .insert({
                                                              'userid':
                                                                  tripPageUsersRow
                                                                      .id,
                                                              'value': functions
                                                                  .getPercentValue(
                                                                      valueOrDefault<
                                                                          double>(
                                                                        functions.calculateTotalPrice(
                                                                            functions.distanceOfLocations(FFAppState().coordsList.toList()).toString(),
                                                                            containerOrdersRow.startedPrice!.toString(),
                                                                            containerOrdersRow.kmPrice!.toString()),
                                                                        0.0,
                                                                      ),
                                                                      containerOrdersRow
                                                                          .feePercent!),
                                                              'type':
                                                                  'commission',
                                                            });
                                                            _model.queryShift =
                                                                await ShiftsTable()
                                                                    .queryRows(
                                                              queryFn: (q) =>
                                                                  q.eqOrNull(
                                                                'id',
                                                                functions.textToInt(
                                                                    FFAppState()
                                                                        .userInfo
                                                                        .lastShiftid),
                                                              ),
                                                            );
                                                            _model.updateShift =
                                                                await ShiftsTable()
                                                                    .update(
                                                              data: {
                                                                'earned': functions
                                                                    .sumOfNumbers(
                                                                        _model
                                                                            .queryShift!
                                                                            .firstOrNull!
                                                                            .earned!,
                                                                        valueOrDefault<
                                                                            double>(
                                                                          functions.calculateTotalPrice(
                                                                              functions.distanceOfLocations(FFAppState().coordsList.toList()).toString(),
                                                                              containerOrdersRow.startedPrice!.toString(),
                                                                              containerOrdersRow.kmPrice!.toString()),
                                                                          0.0,
                                                                        )),
                                                                'ordersNum': functions.sumOfNumbers(
                                                                    _model
                                                                        .queryShift!
                                                                        .firstOrNull!
                                                                        .ordersNum!,
                                                                    1.0),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                'id',
                                                                functions.textToInt(
                                                                    FFAppState()
                                                                        .userInfo
                                                                        .lastShiftid),
                                                              ),
                                                              returnRows: true,
                                                            );

                                                            context.pushNamed(
                                                              FinishedTripPageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'isFinished':
                                                                    serializeParam(
                                                                  true,
                                                                  ParamType
                                                                      .bool,
                                                                ),
                                                                'orderId':
                                                                    serializeParam(
                                                                  containerOrdersRow
                                                                      .id,
                                                                  ParamType.int,
                                                                ),
                                                                'earned':
                                                                    serializeParam(
                                                                  functions.calculateMinus(
                                                                      valueOrDefault<double>(
                                                                        functions.calculateTotalPrice(
                                                                            functions.distanceOfLocations(FFAppState().coordsList.toList()).toString(),
                                                                            containerOrdersRow.startedPrice!.toString(),
                                                                            containerOrdersRow.kmPrice!.toString()),
                                                                        0.0,
                                                                      ),
                                                                      functions.getPercentValue(
                                                                          valueOrDefault<double>(
                                                                            functions.calculateTotalPrice(
                                                                                functions.distanceOfLocations(FFAppState().coordsList.toList()).toString(),
                                                                                containerOrdersRow.startedPrice!.toString(),
                                                                                containerOrdersRow.kmPrice!.toString()),
                                                                            0.0,
                                                                          ),
                                                                          containerOrdersRow.feePercent!)),
                                                                  ParamType
                                                                      .double,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            FFAppState()
                                                                .updateUserInfoStruct(
                                                              (e) => e
                                                                ..currentOrderID =
                                                                    null,
                                                            );
                                                            FFAppState()
                                                                .coordsList = [];
                                                            FFAppState()
                                                                .update(() {});

                                                            safeSetState(() {});
                                                          },
                                                          text:
                                                              'Завершить поездку',
                                                          options:
                                                              FFButtonOptions(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 51.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
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
                                    ),
                                  ),
                                if (FFAppState().userInfo.currentOrderID == '')
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Начните поездку. Информация будет отображаться здесь.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 13.0,
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
                  ),
                  wrapWithModel(
                    model: _model.bottomBarDriverModel,
                    updateCallback: () => safeSetState(() {}),
                    child: BottomBarDriverWidget(
                      pageName: 'trip',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
