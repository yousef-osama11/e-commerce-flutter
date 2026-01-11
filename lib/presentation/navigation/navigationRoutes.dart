import 'package:e_commerce_flutter/presentation/screens/cart/CartScreen.dart';
import 'package:e_commerce_flutter/presentation/screens/cart/widgets/CartItemCard.dart';
import 'package:e_commerce_flutter/presentation/screens/home/homeScreen.dart';
import 'package:e_commerce_flutter/presentation/screens/product_details/product_details.dart';
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

@TypedGoRoute<CartRoute>(path: '/cart')
@immutable
class CartRoute extends GoRouteData  with $CartRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CartScreen();
  }
}

  @TypedGoRoute<ProductDetailsScreenRoute>(
    path: '/home/product-details',
  )
  class ProductDetailsScreenRoute extends GoRouteData
      with $ProductDetailsScreenRoute {

    const ProductDetailsScreenRoute();

    @override
    Widget build(BuildContext context, GoRouterState state) {
      final item = state.extra as WearableItem;

      return ProductDetails(
        image: item.imagePath,
        price: item.price,
        title: item.name,
        description: item.description,
        rate: item.rate,
        reviewerCount: item.reviewsCount
      );
    }
  }
