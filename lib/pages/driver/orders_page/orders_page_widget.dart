import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/bottom_bar_driver_widget.dart';
import '/components/simple_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'orders_page_model.dart';
export 'orders_page_model.dart';

class OrdersPageWidget extends StatefulWidget {
  const OrdersPageWidget({super.key});

  static String routeName = 'OrdersPage';
  static String routePath = '/ordersPage';

  @override
  State<OrdersPageWidget> createState() => _OrdersPageWidgetState();
}

class _OrdersPageWidgetState extends State<OrdersPageWidget> {
  late OrdersPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrdersPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<UsersRow>>(
      stream: _model.ordersPageSupabaseStream ??= SupaFlow.client
          .from("users")
          .stream(primaryKey: ['id'])
          .eqOrNull(
            'id',
            FFAppState().userInfo.id,
          )
          .map((list) => list.map((item) => UsersRow(item)).toList()),
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
        List<UsersRow> ordersPageUsersRowList = snapshot.data!;

        final ordersPageUsersRow = ordersPageUsersRowList.isNotEmpty
            ? ordersPageUsersRowList.first
            : null;

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
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 18.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${FFAppState().userInfo.name} ${FFAppState().userInfo.surname}',
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (ordersPageUsersRow
                                          .notificationEnabled!) {
                                        _model.deactivate =
                                            await UsersTable().update(
                                          data: {
                                            'notificationEnabled': false,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            ordersPageUsersRow.id,
                                          ),
                                          returnRows: true,
                                        );
                                      } else {
                                        _model.activate =
                                            await UsersTable().update(
                                          data: {
                                            'notificationEnabled': true,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            ordersPageUsersRow.id,
                                          ),
                                          returnRows: true,
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: 34.0,
                                      height: 34.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF2F2F2),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          if (ordersPageUsersRow
                                                  ?.notificationEnabled ??
                                              true)
                                            FaIcon(
                                              FontAwesomeIcons.bell,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16.0,
                                            ),
                                          if (!ordersPageUsersRow!
                                              .notificationEnabled!)
                                            FaIcon(
                                              FontAwesomeIcons.bellSlash,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16.0,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
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
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor: Color(0x4D000000),
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: SimpleBottomSheetWidget(
                                                  question: 'Выйти?',
                                                  primaryOption:
                                                      'Выйти из аккаунта',
                                                  secondaryOption: 'Отмена',
                                                  primaryAction: () async {
                                                    if (FFAppState()
                                                                .userInfo
                                                                .currentOrderID ==
                                                            '') {
                                                      Navigator.pop(context);
                                                      FFAppState().userInfo =
                                                          UserInfoStruct();
                                                      safeSetState(() {});
                                                      await actions
                                                          .onesignalLogout();

                                                      context.goNamed(
                                                          NavPageWidget
                                                              .routeName);
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Вы должны завершить заказ',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  1000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  secondaryAction: () async {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Icon(
                                        FFIcons.klogout,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 14.0,
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          PaymentsWidget.routeName,
                                          queryParameters: {
                                            'isDep': serializeParam(
                                              true,
                                              ParamType.bool,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 112.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            child: SvgPicture.asset(
                                              'assets/images/balance_bg.svg',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 112.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Ваш баланс',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        lineHeight: 1.35,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              ordersPageUsersRow
                                                                  .ballance,
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .periodDecimal,
                                                            ),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 35.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                lineHeight:
                                                                    1.35,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: ' TMT',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 22.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                lineHeight:
                                                                    1.35,
                                                              ),
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: Stack(
                                        children: [
                                          if (FFAppState()
                                                      .userInfo
                                                      .lastShiftid ==
                                                  '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Вы можете начать смену. Комиссия спишется после подтверждения поездки',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.35,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        if (ordersPageUsersRow
                                                                .ballance! >
                                                            0.0) {
                                                          context.goNamed(
                                                              ChooseTariffPageWidget
                                                                  .routeName);
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Недостаточно средств',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      1000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                            ),
                                                          );
                                                        }
                                                      },
                                                      text: 'Начать смену',
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 52.0,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  lineHeight:
                                                                      1.5,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          if (FFAppState()
                                                      .userInfo
                                                      .lastShiftid !=
                                                  '')
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Активные тарифы',
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
                                                              lineHeight: 1.35,
                                                            ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.goNamed(
                                                                ChooseTariffPageWidget
                                                                    .routeName);
                                                          },
                                                          child: Icon(
                                                            FFIcons.kedit,
                                                            color: Color(
                                                                0xFFC3C3C3),
                                                            size: 17.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24.0, 13.0,
                                                          24.0, 0.0),
                                                  child: FutureBuilder<
                                                      List<RatesRow>>(
                                                    future:
                                                        RatesTable().queryRows(
                                                      queryFn: (q) => q.order(
                                                          'id',
                                                          ascending: true),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<RatesRow>
                                                          rowRatesRowList =
                                                          snapshot.data!;

                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            rowRatesRowList
                                                                .length,
                                                            (rowIndex) {
                                                          final rowRatesRow =
                                                              rowRatesRowList[
                                                                  rowIndex];
                                                          return InkWell(
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
                                                              if (FFAppState()
                                                                  .userInfo
                                                                  .rateidlist
                                                                  .contains(
                                                                      rowRatesRow
                                                                          .id
                                                                          .toString())) {
                                                                FFAppState()
                                                                    .updateUserInfoStruct(
                                                                  (e) => e
                                                                    ..updateRateidlist(
                                                                      (e) => e.remove(
                                                                          rowRatesRow
                                                                              .id
                                                                              .toString()),
                                                                    ),
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                FFAppState()
                                                                    .updateUserInfoStruct(
                                                                  (e) => e
                                                                    ..updateRateidlist(
                                                                      (e) => e.add(
                                                                          rowRatesRow
                                                                              .id
                                                                              .toString()),
                                                                    ),
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            child: Container(
                                                              width: 73.0,
                                                              height: 24.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FFAppState()
                                                                        .userInfo
                                                                        .rateidlist
                                                                        .contains(rowRatesRow
                                                                            .id
                                                                            .toString())
                                                                    ? valueOrDefault<
                                                                        Color>(
                                                                        functions
                                                                            .textToColor(rowRatesRow.color!),
                                                                        Color(
                                                                            0xFFF3F3F3),
                                                                      )
                                                                    : Color(
                                                                        0xFFF3F3F3),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            11.85),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    rowRatesRow
                                                                        .title,
                                                                    'title',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FFAppState().userInfo.rateidlist.contains(rowRatesRow.id.toString())
                                                                            ? Colors.white
                                                                            : FlutterFlowTheme.of(context).primaryText,
                                                                        fontSize:
                                                                            11.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        lineHeight:
                                                                            1.35,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }).divide(SizedBox(
                                                            width: 5.0)),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0,
                                                                24.0, 0.0, 0.0),
                                                    child: Text(
                                                      'Вы можете завершить смену. ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            lineHeight: 1.35,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24.0, 12.0,
                                                          24.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: (FFAppState()
                                                                    .userInfo
                                                                    .currentOrderID !=
                                                                '')
                                                        ? null
                                                        : () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        SimpleBottomSheetWidget(
                                                                      question:
                                                                          'Завершить смену?',
                                                                      primaryOption:
                                                                          'Завершить',
                                                                      secondaryOption:
                                                                          'Отмена',
                                                                      primaryAction:
                                                                          () async {
                                                                        if (FFAppState().userInfo.currentOrderID ==
                                                                                '') {
                                                                          _model.updateShift =
                                                                              await ShiftsTable().update(
                                                                            data: {
                                                                              'finished_time': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eqOrNull(
                                                                              'id',
                                                                              functions.textToInt(FFAppState().userInfo.lastShiftid),
                                                                            ),
                                                                            returnRows:
                                                                                true,
                                                                          );
                                                                          FFAppState()
                                                                              .updateUserInfoStruct(
                                                                            (e) => e
                                                                              ..lastShiftid = null,
                                                                          );
                                                                          safeSetState(
                                                                              () {});
                                                                          Navigator.pop(
                                                                              context);

                                                                          context
                                                                              .pushNamed(FinishedShiftPageWidget.routeName);
                                                                        } else {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'Вы должны завершить заказ',
                                                                                style: TextStyle(
                                                                                  color: Colors.white,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 1000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).error,
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                                      secondaryAction:
                                                                          () async {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            safeSetState(() {});
                                                          },
                                                    text: 'Завершить смену',
                                                    options: FFButtonOptions(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 52.0,
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                lineHeight: 1.5,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      disabledColor:
                                                          Color(0x86000000),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<OrdersRow>>(
                                                    stream: _model
                                                            .containerSupabaseStream ??=
                                                        SupaFlow.client
                                                            .from("orders")
                                                            .stream(
                                                                primaryKey: [
                                                                  'id'
                                                                ])
                                                            .eqOrNull(
                                                              'status',
                                                              'pending',
                                                            )
                                                            .order('created_at')
                                                            .map((list) => list
                                                                .map((item) =>
                                                                    OrdersRow(
                                                                        item))
                                                                .toList()),
                                                    builder:
                                                        (context, snapshot) {
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
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<OrdersRow>
                                                          containerOrdersRowList =
                                                          snapshot.data!;

                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final order = (FFAppState()
                                                                            .userInfo
                                                                            .rateidlist
                                                                            .isNotEmpty
                                                                        ? functions
                                                                            .filterorders(
                                                                                ordersPageUsersRow.cancelledOrdersID
                                                                                    .toList(),
                                                                                containerOrdersRowList
                                                                                    .toList())
                                                                            ?.where((e) => FFAppState().userInfo.rateidlist.contains(e.rateId
                                                                                ?.toString()))
                                                                            .toList()
                                                                        : functions.filterorders(
                                                                            ordersPageUsersRow.cancelledOrdersID.toList(),
                                                                            containerOrdersRowList.toList()))
                                                                    ?.toList() ??
                                                                [];

                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                      order
                                                                          .length,
                                                                      (orderIndex) {
                                                                final orderItem =
                                                                    order[
                                                                        orderIndex];
                                                                return Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            25.0,
                                                                        color: Color(
                                                                            0x1111110A),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          4.0,
                                                                        ),
                                                                        spreadRadius:
                                                                            0.0,
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            20.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              child: SvgPicture.asset(
                                                                                'assets/images/fromTo.svg',
                                                                                width: 11.0,
                                                                                height: 45.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(13.0, 0.0, 10.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          orderItem.departureAddress,
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
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 9.0),
                                                                                        child: Container(
                                                                                          width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                          height: 1.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0xFFF8F8F8),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          orderItem.destinationAddress,
                                                                                          'text',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              lineHeight: 1.35,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.5, 0.0),
                                                                              child: Container(
                                                                                width: 66.0,
                                                                                height: 16.0,
                                                                                decoration: BoxDecoration(
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
                                                                                  borderRadius: BorderRadius.circular(11.85),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      orderItem.rateText,
                                                                                      'text',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: Colors.white,
                                                                                          fontSize: 9.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          lineHeight: 1.5,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              24.0,
                                                                              0.0,
                                                                              15.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              orderItem.clientPhone,
                                                                              'phone',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  lineHeight: 1.5,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children:
                                                                              [
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                _model.addToCancelList = await UsersTable().update(
                                                                                  data: {
                                                                                    'cancelledOrdersID': functions.addToList(ordersPageUsersRow.cancelledOrdersID.toList(), orderItem.id),
                                                                                  },
                                                                                  matchingRows: (rows) => rows.eqOrNull(
                                                                                    'id',
                                                                                    FFAppState().userInfo.id,
                                                                                  ),
                                                                                  returnRows: true,
                                                                                );

                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Container(
                                                                                width: 51.0,
                                                                                height: 51.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Icon(
                                                                                  FFIcons.kclose,
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  size: 17.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  _model.checkPermissionRes = await actions.checkPermissions();
                                                                                  if (_model.checkPermissionRes == true) {
                                                                                    if (FFAppState().userInfo.currentOrderID == '') {
                                                                                      if (ordersPageUsersRow.ballance! > 0.0) {
                                                                                        FFAppState().updateUserInfoStruct(
                                                                                          (e) => e..currentOrderID = orderItem.id.toString(),
                                                                                        );
                                                                                        safeSetState(() {});
                                                                                        _model.updateorderstatus = await OrdersTable().update(
                                                                                          data: {
                                                                                            'status': 'assigned',
                                                                                            'driver_id': FFAppState().userInfo.id,
                                                                                            'assigned_time': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                                            'driver_phone': FFAppState().userInfo.phoneNum,
                                                                                            'driver_name': '${FFAppState().userInfo.name} ${FFAppState().userInfo.surname}',
                                                                                          },
                                                                                          matchingRows: (rows) => rows.eqOrNull(
                                                                                            'id',
                                                                                            orderItem.id,
                                                                                          ),
                                                                                          returnRows: true,
                                                                                        );

                                                                                        context.goNamed(TripPageWidget.routeName);
                                                                                      } else {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'Недостаточно средств',
                                                                                              style: TextStyle(
                                                                                                color: Colors.white,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 1000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                    } else {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'Вы должны завершить предыдущий заказ',
                                                                                            style: TextStyle(
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 1000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  } else {
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
                                                                                          'Для работы функции требуется доступ к местоположению. Пожалуйста, включите разрешения в настройках устройства.',
                                                                                          style: TextStyle(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                        ),
                                                                                        duration: Duration(milliseconds: 4000),
                                                                                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                      ),
                                                                                    );
                                                                                  }

                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  height: 51.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Text(
                                                                                      'Принять',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            lineHeight: 1.5,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 10.0)),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              })
                                                                  .divide(SizedBox(
                                                                      height:
                                                                          14.0))
                                                                  .addToStart(
                                                                      SizedBox(
                                                                          height:
                                                                              14.0)),
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 22.0)),
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
      },
    );
  }
}
