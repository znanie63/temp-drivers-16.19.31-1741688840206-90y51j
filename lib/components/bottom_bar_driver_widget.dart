import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'bottom_bar_driver_model.dart';
export 'bottom_bar_driver_model.dart';

class BottomBarDriverWidget extends StatefulWidget {
  const BottomBarDriverWidget({
    super.key,
    required this.pageName,
  });

  final String? pageName;

  @override
  State<BottomBarDriverWidget> createState() => _BottomBarDriverWidgetState();
}

class _BottomBarDriverWidgetState extends State<BottomBarDriverWidget> {
  late BottomBarDriverModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomBarDriverModel());
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
      height: 48.0,
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
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.goNamed(OrdersPageWidget.routeName);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            if (widget.pageName != 'orders')
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: SvgPicture.asset(
                                  'assets/images/orders_driver.svg',
                                  width: 22.0,
                                  height: 22.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if (widget.pageName == 'orders')
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: SvgPicture.asset(
                                  'assets/images/orders_driver_on.svg',
                                  width: 22.0,
                                  height: 22.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                          ],
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
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(TripPageWidget.routeName);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          FFIcons.ktrip,
                          color: widget.pageName == 'trip'
                              ? FlutterFlowTheme.of(context).primary
                              : Color(0xFFC3C3C3),
                          size: 22.0,
                        ),
                        Text(
                          'Поездка',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: widget.pageName == 'trip'
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
                  context.pushNamed(StatisticsPageWidget.routeName);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          FFIcons.kstatistics,
                          color: widget.pageName == 'statistics'
                              ? FlutterFlowTheme.of(context).primary
                              : Color(0xFFC3C3C3),
                          size: 24.0,
                        ),
                        Text(
                          'Статистика',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: widget.pageName == 'statistics'
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
