import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/address_bottomsheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'new_order_page_model.dart';
export 'new_order_page_model.dart';

class NewOrderPageWidget extends StatefulWidget {
  const NewOrderPageWidget({super.key});

  static String routeName = 'NewOrderPage';
  static String routePath = '/newOrderPage';

  @override
  State<NewOrderPageWidget> createState() => _NewOrderPageWidgetState();
}

class _NewOrderPageWidgetState extends State<NewOrderPageWidget> {
  late NewOrderPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewOrderPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
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
                            'Новый заказ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 1.35,
                                ),
                          ),
                          Opacity(
                            opacity: 0.0,
                            child: Container(
                              width: 32.0,
                              height: 32.0,
                              decoration: BoxDecoration(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 22.0, 24.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 53.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Color(0xFFE3E3E3),
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              18.0, 7.0, 18.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Клиент',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0x80201E1E),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      lineHeight: 1.5,
                                    ),
                                alignLabelWithHint: false,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 6.5, 0.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                    lineHeight: 1.5,
                                  ),
                              keyboardType: TextInputType.number,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                              inputFormatters: [_model.textFieldMask],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
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
                                  FocusScope.of(context).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: AddressBottomsheetWidget(),
                                ),
                              );
                            },
                          ).then((value) =>
                              safeSetState(() => _model.outputAddress = value));

                          if (_model.outputAddress != null) {
                            _model.departureAddress =
                                _model.outputAddress?.title;
                            safeSetState(() {});
                          }

                          safeSetState(() {});
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Color(0xFFE3E3E3),
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 6.0, 18.0, 6.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Пункт отправления',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0x80201E1E),
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        lineHeight: 1.5,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    _model.departureAddress,
                                    'Выберите адрес',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF201E1E),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
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
                                  FocusScope.of(context).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: AddressBottomsheetWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(
                              () => _model.destinationAddressOutput = value));

                          if (_model.destinationAddressOutput != null) {
                            _model.destinationAddress =
                                _model.destinationAddressOutput?.title;
                            safeSetState(() {});
                          }

                          safeSetState(() {});
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Color(0xFFE3E3E3),
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 6.0, 18.0, 6.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Пункт назначения',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0x80201E1E),
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        lineHeight: 1.5,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    _model.destinationAddress,
                                    'Выберите адрес',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF201E1E),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 18.0, 24.0, 0.0),
                      child: FutureBuilder<List<RatesRow>>(
                        future: RatesTable().queryRows(
                          queryFn: (q) => q.order('id', ascending: true),
                        ),
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
                          List<RatesRow> rowRatesRowList = snapshot.data!;

                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(rowRatesRowList.length,
                                (rowIndex) {
                              final rowRatesRow = rowRatesRowList[rowIndex];
                              return Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.chosenRateID = rowRatesRow.id;
                                    _model.chosenRateName = rowRatesRow.title;
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    height: 77.25,
                                    decoration: BoxDecoration(
                                      color: valueOrDefault<Color>(
                                        _model.chosenRateID == rowRatesRow.id
                                            ? () {
                                                if (_model.chosenRateID == 1) {
                                                  return Color(0xFF26E3BA);
                                                } else if (_model
                                                        .chosenRateID ==
                                                    2) {
                                                  return Color(0xFF2C3E50);
                                                } else if (_model
                                                        .chosenRateID ==
                                                    3) {
                                                  return Color(0xFFF5C242);
                                                } else if (_model
                                                        .chosenRateID ==
                                                    4) {
                                                  return Color(0xFF3498DB);
                                                } else {
                                                  return Color(0xFFF2F2F2);
                                                }
                                              }()
                                            : FlutterFlowTheme.of(context)
                                                .accent1,
                                        Color(0xFFF6F6F6),
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Stack(
                                        children: [
                                          if (_model.chosenRateID ==
                                              rowRatesRow.id)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  rowRatesRow.title,
                                                  'title',
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                          if (_model.chosenRateID !=
                                              rowRatesRow.id)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  rowRatesRow.title,
                                                  'title',
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).divide(SizedBox(width: 6.0)),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 10.0, 24.0, 20.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if ((_model.departureAddress != null &&
                            _model.departureAddress != '') &&
                        (_model.destinationAddress != null &&
                            _model.destinationAddress != '') &&
                        (functions.getTextLength(_model.textController.text) ==
                            14) &&
                        (_model.chosenRateID != null)) {
                      _model.queryRate = await RatesTable().queryRows(
                        queryFn: (q) => q.eqOrNull(
                          'id',
                          _model.chosenRateID,
                        ),
                      );
                      _model.insertOrder = await OrdersTable().insert({
                        'created_at':
                            supaSerialize<DateTime>(getCurrentTimestamp),
                        'departure_address': _model.departureAddress,
                        'destination_address': _model.destinationAddress,
                        'client_phone': _model.textController.text,
                        'status': 'pending',
                        'rate_id': _model.chosenRateID,
                        'started_price':
                            _model.queryRate?.firstOrNull?.startingPrice,
                        'rate_text': _model.queryRate?.firstOrNull?.title,
                        'departure_latitude': _model.outputAddress?.latitude,
                        'departure_longitude': _model.outputAddress?.longitude,
                        'destination_latitude':
                            _model.destinationAddressOutput?.latitude,
                        'destination_longitude':
                            _model.destinationAddressOutput?.longitude,
                        'km_price': _model.queryRate?.firstOrNull?.kmPrice,
                        'fee_percent': _model.queryRate?.firstOrNull?.feePercent
                            ?.toDouble(),
                      });
                      _model.querydrivers = await UsersTable().queryRows(
                        queryFn: (q) => q
                            .eqOrNull(
                              'userType',
                              'driver',
                            )
                            .eqOrNull(
                              'notificationEnabled',
                              true,
                            ),
                      );
                      _model.apiResultkd2 = await SendNotificationCall.call(
                        content:
                            'от ${_model.departureAddress} до ${_model.destinationAddress}. Тариф — ${_model.chosenRateName}',
                        heading: 'Новый заказ!',
                        subtitle:
                            'Скорее примите заказ, чтобы не упустить клиента.',
                        appId: 'b6812710-01a3-4ef2-829d-7b828a9db16d',
                        useridslistList: _model.querydrivers
                            ?.map((e) => e.id.toString())
                            .toList(),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Заказ успешно создан!',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              color: Color(0xFFFDFDFD),
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),
                          ),
                          duration: Duration(milliseconds: 2000),
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                        ),
                      );
                      await Future.delayed(const Duration(milliseconds: 1000));

                      context.goNamed(AdminOrdersPageWidget.routeName);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Заполните поля!',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              color: Color(0xFFFDFDFD),
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),
                          ),
                          duration: Duration(milliseconds: 2000),
                          backgroundColor: Color(0xFFFF678B),
                        ),
                      );
                    }

                    safeSetState(() {});
                  },
                  text: 'Создать',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 52.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
    );
  }
}
