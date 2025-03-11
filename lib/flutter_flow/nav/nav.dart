import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.transparent,
                child: Image.asset(
                  'assets/images/splash.png',
                  fit: BoxFit.cover,
                ),
              ),
            )
          : NavPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.transparent,
                    child: Image.asset(
                      'assets/images/splash.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : NavPageWidget(),
        ),
        FFRoute(
          name: AuthPageWidget.routeName,
          path: AuthPageWidget.routePath,
          builder: (context, params) => AuthPageWidget(),
        ),
        FFRoute(
          name: OrdersPageWidget.routeName,
          path: OrdersPageWidget.routePath,
          builder: (context, params) => OrdersPageWidget(),
        ),
        FFRoute(
          name: TripPageWidget.routeName,
          path: TripPageWidget.routePath,
          builder: (context, params) => TripPageWidget(),
        ),
        FFRoute(
          name: StatisticsPageWidget.routeName,
          path: StatisticsPageWidget.routePath,
          builder: (context, params) => StatisticsPageWidget(),
        ),
        FFRoute(
          name: ChooseTariffPageWidget.routeName,
          path: ChooseTariffPageWidget.routePath,
          builder: (context, params) => ChooseTariffPageWidget(),
        ),
        FFRoute(
          name: FinishedShiftPageWidget.routeName,
          path: FinishedShiftPageWidget.routePath,
          builder: (context, params) => FinishedShiftPageWidget(),
        ),
        FFRoute(
          name: FinishedTripPageWidget.routeName,
          path: FinishedTripPageWidget.routePath,
          builder: (context, params) => FinishedTripPageWidget(
            isFinished: params.getParam(
              'isFinished',
              ParamType.bool,
            ),
            orderId: params.getParam(
              'orderId',
              ParamType.int,
            ),
            earned: params.getParam(
              'earned',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: AllDriversPageWidget.routeName,
          path: AllDriversPageWidget.routePath,
          builder: (context, params) => AllDriversPageWidget(),
        ),
        FFRoute(
          name: DriverPageWidget.routeName,
          path: DriverPageWidget.routePath,
          builder: (context, params) => DriverPageWidget(
            driverInfo: params.getParam<UsersRow>(
              'driverInfo',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: InfoPageWidget.routeName,
          path: InfoPageWidget.routePath,
          builder: (context, params) => InfoPageWidget(
            driverInfo: params.getParam<UsersRow>(
              'driverInfo',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: NewDriverPageWidget.routeName,
          path: NewDriverPageWidget.routePath,
          builder: (context, params) => NewDriverPageWidget(),
        ),
        FFRoute(
          name: HistoryPageWidget.routeName,
          path: HistoryPageWidget.routePath,
          builder: (context, params) => HistoryPageWidget(
            driverInfo: params.getParam<UsersRow>(
              'driverInfo',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: DriverStatisticsPageWidget.routeName,
          path: DriverStatisticsPageWidget.routePath,
          builder: (context, params) => DriverStatisticsPageWidget(
            driverInfo: params.getParam<UsersRow>(
              'driverInfo',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: RatesPageWidget.routeName,
          path: RatesPageWidget.routePath,
          builder: (context, params) => RatesPageWidget(),
        ),
        FFRoute(
          name: RateEditWidget.routeName,
          path: RateEditWidget.routePath,
          builder: (context, params) => RateEditWidget(
            rateInfo: params.getParam<RatesRow>(
              'rateInfo',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: AdminOrdersPageWidget.routeName,
          path: AdminOrdersPageWidget.routePath,
          builder: (context, params) => AdminOrdersPageWidget(),
        ),
        FFRoute(
          name: NewOrderPageWidget.routeName,
          path: NewOrderPageWidget.routePath,
          builder: (context, params) => NewOrderPageWidget(),
        ),
        FFRoute(
          name: NavPageWidget.routeName,
          path: NavPageWidget.routePath,
          builder: (context, params) => NavPageWidget(),
        ),
        FFRoute(
          name: PaymentsWidget.routeName,
          path: PaymentsWidget.routePath,
          builder: (context, params) => PaymentsWidget(
            isDep: params.getParam(
              'isDep',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: NewAdminWidget.routeName,
          path: NewAdminWidget.routePath,
          builder: (context, params) => NewAdminWidget(),
        ),
        FFRoute(
          name: InfoPageAdminWidget.routeName,
          path: InfoPageAdminWidget.routePath,
          builder: (context, params) => InfoPageAdminWidget(
            driverInfo: params.getParam<UsersRow>(
              'driverInfo',
              ParamType.SupabaseRow,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
