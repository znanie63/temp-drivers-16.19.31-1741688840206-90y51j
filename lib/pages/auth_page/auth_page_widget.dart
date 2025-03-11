import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'auth_page_model.dart';
export 'auth_page_model.dart';

class AuthPageWidget extends StatefulWidget {
  const AuthPageWidget({super.key});

  static String routeName = 'AuthPage';
  static String routePath = '/authPage';

  @override
  State<AuthPageWidget> createState() => _AuthPageWidgetState();
}

class _AuthPageWidgetState extends State<AuthPageWidget> {
  late AuthPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthPageModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textFieldFocusNode1!.addListener(() => safeSetState(() {}));
    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
    _model.textFieldFocusNode2!.addListener(() => safeSetState(() {}));
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Добро пожаловать!',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              lineHeight: 1.35,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                        child: Text(
                          'Введите номер телефона и пароль.',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 13.0,
                                letterSpacing: 0.0,
                                lineHeight: 1.35,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
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
                                18.0, 0.0, 18.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              child: TextFormField(
                                controller: _model.textController1,
                                focusNode: _model.textFieldFocusNode1,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController1',
                                  Duration(milliseconds: 0),
                                  () => safeSetState(() {}),
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'Номер телефона',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0x80201E1E),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                  alignLabelWithHint: false,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.5, 0.0, 0.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                                keyboardType: TextInputType.phone,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model.textController1Validator
                                    .asValidator(context),
                                inputFormatters: [_model.textFieldMask1],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
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
                                18.0, 0.0, 18.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              child: TextFormField(
                                controller: _model.textController2,
                                focusNode: _model.textFieldFocusNode2,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController2',
                                  Duration(milliseconds: 0),
                                  () => safeSetState(() {}),
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'Пароль',
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
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.5, 0.0, 0.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                      lineHeight: 1.5,
                                    ),
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model.textController2Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 75.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if ((_model.textController1.text != '') &&
                          (_model.textController2.text != '')) {
                        await actions.supabaselogin();
                        _model.queryUsers = await UsersTable().queryRows(
                          queryFn: (q) => q
                              .eqOrNull(
                                'phoneNum',
                                _model.textController1.text,
                              )
                              .eqOrNull(
                                'password',
                                _model.textController2.text,
                              ),
                        );
                        if (_model.queryUsers != null &&
                            (_model.queryUsers)!.isNotEmpty) {
                          FFAppState().userInfo = UserInfoStruct(
                            id: _model.queryUsers?.firstOrNull?.id,
                            createdAt:
                                _model.queryUsers?.firstOrNull?.createdAt,
                            phoneNum: _model.queryUsers?.firstOrNull?.phoneNum,
                            password: _model.queryUsers?.firstOrNull?.password,
                            userType: _model.queryUsers?.firstOrNull?.userType,
                            name: _model.queryUsers?.firstOrNull?.name,
                            surname: _model.queryUsers?.firstOrNull?.surname,
                            carModel: _model.queryUsers?.firstOrNull?.carModel,
                            carNumber:
                                _model.queryUsers?.firstOrNull?.carNumber,
                          );
                          safeSetState(() {});
                          await actions.onesignalLogin(
                            FFAppState().userInfo.id.toString(),
                          );
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
                            if (_model.queryShifts != null &&
                                (_model.queryShifts)!.isNotEmpty) {
                              FFAppState().updateUserInfoStruct(
                                (e) => e
                                  ..lastShiftid = _model
                                      .queryShifts?.firstOrNull?.id
                                      .toString(),
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
                            if (_model.queryOrders != null &&
                                (_model.queryOrders)!.isNotEmpty) {
                              FFAppState().updateUserInfoStruct(
                                (e) => e
                                  ..currentOrderID = _model
                                      .queryOrders?.firstOrNull?.id
                                      .toString(),
                              );
                              safeSetState(() {});
                            }

                            context.goNamed(OrdersPageWidget.routeName);
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Неверный логин или пароль!',
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
                    text: 'Войти',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 52.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
      ),
    );
  }
}
