import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'bottom_bar_admin_model.dart';
export 'bottom_bar_admin_model.dart';

class BottomBarAdminWidget extends StatefulWidget {
  const BottomBarAdminWidget({
    super.key,
    required this.pageName,
  });

  final String? pageName;

  @override
  State<BottomBarAdminWidget> createState() => _BottomBarAdminWidgetState();
}

class _BottomBarAdminWidgetState extends State<BottomBarAdminWidget> {
  late BottomBarAdminModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomBarAdminModel());
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
      height: 56.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 0.0,
            color: Color(0xFFC0C0C0),
            offset: Offset(
              0.0,
              -0.48,
            ),
            spreadRadius: 0.0,
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.goNamed(AllDriversPageWidget.routeName);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          FFIcons.kdrivers,
                          color: widget.pageName == 'drivers'
                              ? FlutterFlowTheme.of(context).primary
                              : Color(0xFFC3C3C3),
                          size: 22.0,
                        ),
                        Text(
                          'Водители',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: widget.pageName == 'drivers'
                                        ? FlutterFlowTheme.of(context).primary
                                        : Color(0xFFC3C3C3),
                                    fontSize: 10.0,
                                    letterSpacing: 0.03,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.8,
                                  ),
                        ),
                      ],
                    ),
                  ],
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
                  context.goNamed(RatesPageWidget.routeName);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          FFIcons.ktariffs,
                          color: widget.pageName == 'tariffs'
                              ? FlutterFlowTheme.of(context).primary
                              : Color(0xFFC3C3C3),
                          size: 22.0,
                        ),
                        Text(
                          'Тарифы',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: widget.pageName == 'tariffs'
                                        ? FlutterFlowTheme.of(context).primary
                                        : Color(0xFFC3C3C3),
                                    fontSize: 10.0,
                                    letterSpacing: 0.03,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.8,
                                  ),
                        ),
                      ],
                    ),
                  ],
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
                  context.goNamed(AdminOrdersPageWidget.routeName);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          FFIcons.kordersAdmin,
                          color: widget.pageName == 'orders'
                              ? FlutterFlowTheme.of(context).primary
                              : Color(0xFFC3C3C3),
                          size: 24.0,
                        ),
                        Text(
                          'Заказы',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: widget.pageName == 'orders'
                                        ? FlutterFlowTheme.of(context).primary
                                        : Color(0xFFC3C3C3),
                                    fontSize: 10.0,
                                    letterSpacing: 0.03,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.8,
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
    );
  }
}
