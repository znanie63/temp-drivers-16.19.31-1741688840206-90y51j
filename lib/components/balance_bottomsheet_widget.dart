import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'balance_bottomsheet_model.dart';
export 'balance_bottomsheet_model.dart';

class BalanceBottomsheetWidget extends StatefulWidget {
  const BalanceBottomsheetWidget({
    super.key,
    required this.driverphone,
  });

  final String? driverphone;

  @override
  State<BalanceBottomsheetWidget> createState() =>
      _BalanceBottomsheetWidgetState();
}

class _BalanceBottomsheetWidgetState extends State<BalanceBottomsheetWidget> {
  late BalanceBottomsheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BalanceBottomsheetModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 268.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 15.0, 24.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Container(
                width: 80.0,
                height: 5.0,
                decoration: BoxDecoration(
                  color: Color(0xFFE5E5EB),
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 33.0, 0.0, 0.0),
              child: Text(
                'Пополнить баланс',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      lineHeight: 1.35,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 19.0, 0.0, 0.0),
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
                  padding: EdgeInsetsDirectional.fromSTEB(18.0, 7.0, 18.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Сумма пополнения',
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
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
                            EdgeInsetsDirectional.fromSTEB(0.0, 6.5, 0.0, 0.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            letterSpacing: 0.0,
                            lineHeight: 1.5,
                          ),
                      keyboardType: TextInputType.number,
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (_model.textController.text != '') {
                    _model.queryDriver = await UsersTable().queryRows(
                      queryFn: (q) => q.eqOrNull(
                        'phoneNum',
                        widget.driverphone,
                      ),
                    );
                    _model.updateBallance = await UsersTable().update(
                      data: {
                        'ballance': functions.sumOfNumbers(
                            _model.queryDriver!.firstOrNull!.ballance!,
                            double.parse(_model.textController.text)),
                      },
                      matchingRows: (rows) => rows.eqOrNull(
                        'phoneNum',
                        widget.driverphone,
                      ),
                      returnRows: true,
                    );
                    _model.insertHistory = await HistoryTable().insert({
                      'userid': _model.queryDriver?.firstOrNull?.id,
                      'value': double.tryParse(_model.textController.text),
                      'type': 'replenishment',
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Балланс успешно пополнен',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            color: Color(0xFFFDFDFD),
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                          ),
                        ),
                        duration: Duration(milliseconds: 2000),
                        backgroundColor: Color(0xFF26E3BA),
                      ),
                    );
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Заполните поле!',
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
                text: 'Пополнить',
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
    );
  }
}
