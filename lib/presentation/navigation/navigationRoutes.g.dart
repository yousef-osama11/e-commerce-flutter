// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigationRoutes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $loginScreenRoute,
  $signupScreenRoute,
  $homeScreenRoute,
  $cartRoute,
  $productDetailsScreenRoute,
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

RouteBase get $cartRoute =>
    GoRouteData.$route(path: '/cart', factory: $CartRoute._fromState);

mixin $CartRoute on GoRouteData {
  static CartRoute _fromState(GoRouterState state) => CartRoute();

  @override
  String get location => GoRouteData.$location('/cart');

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

RouteBase get $productDetailsScreenRoute => GoRouteData.$route(
  path: '/home/product-details',
  factory: $ProductDetailsScreenRoute._fromState,
);

mixin $ProductDetailsScreenRoute on GoRouteData {
  static ProductDetailsScreenRoute _fromState(GoRouterState state) =>
      const ProductDetailsScreenRoute();

  @override
  String get location => GoRouteData.$location('/home/product-details');

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
