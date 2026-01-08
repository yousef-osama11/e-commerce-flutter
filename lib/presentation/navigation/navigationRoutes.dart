import 'package:e_commerce_flutter/presentation/screens/home/homeScreen.dart';
import 'package:e_commerce_flutter/presentation/screens/sign_up/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../screens/loginScreen.dart';
part 'navigationRoutes.g.dart';


@TypedGoRoute<LoginScreenRoute>(path: '/')
@immutable
class LoginScreenRoute extends GoRouteData with $LoginScreenRoute{
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginScreen(
      onClickJoin: () {
        SignupScreenRoute().push(context);
      },
      onClickSignIn: (){
        HomeScreenRoute().push(context);
      },
    );
  }
}

@TypedGoRoute<SignupScreenRoute>(path: '/signup')
@immutable
class SignupScreenRoute extends GoRouteData with $SignupScreenRoute{
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SignUp(
      onClickCreateAccount: (){
        LoginScreenRoute().go(context);
      },
      onClickLogin: (){
        LoginScreenRoute().go(context);
      },
    );
  }
}

@TypedGoRoute<HomeScreenRoute>(path: '/home')
@immutable
class HomeScreenRoute extends GoRouteData with $HomeScreenRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Homescreen();
  }
}