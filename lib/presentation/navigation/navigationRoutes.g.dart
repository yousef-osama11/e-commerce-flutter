// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigationRoutes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $loginScreenRoute,
  $signupScreenRoute,
  $homeScreenRoute,
];

RouteBase get $loginScreenRoute =>
    GoRouteData.$route(path: '/', factory: $LoginScreenRoute._fromState);

mixin $LoginScreenRoute on GoRouteData {
  static LoginScreenRoute _fromState(GoRouterState state) => LoginScreenRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $signupScreenRoute =>
    GoRouteData.$route(path: '/signup', factory: $SignupScreenRoute._fromState);

mixin $SignupScreenRoute on GoRouteData {
  static SignupScreenRoute _fromState(GoRouterState state) =>
      SignupScreenRoute();

  @override
  String get location => GoRouteData.$location('/signup');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeScreenRoute =>
    GoRouteData.$route(path: '/home', factory: $HomeScreenRoute._fromState);

mixin $HomeScreenRoute on GoRouteData {
  static HomeScreenRoute _fromState(GoRouterState state) => HomeScreenRoute();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
