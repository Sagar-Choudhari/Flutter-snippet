import 'package:flutter/material.dart';

///
/// @author Sagar Choudhary
/// @created 01 August 2023
/// @purpose Creates a Navigation Service which can be helpful to navigate
/// without context through the activities
class NavigationService {
  /// Creating the first instance
  static final NavigationService _instance = NavigationService._internal();
  NavigationService._internal();

  /// With this factory setup, any time  NavigationService() is called
  /// within the application _instance will be returned and not a new instance
  factory NavigationService() => _instance;

  ///This would allow the app to monitor the current screen state during navigation.

  ///This is where the singleton setup we did
  ///would help as the state is internally maintained
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  /// For navigating back to the previous screen
  dynamic goBack([dynamic popValue]) {
    return navigationKey.currentState?.pop(popValue);
  }

  /// This allows to navigate to the next screen by passing the screen widget
  Future<dynamic> navigateToScreen(Widget page, {arguments}) async => navigationKey.currentState?.push(
    MaterialPageRoute(
      builder: (_) => page,
    ),
  );

  /// This allows you to navigate to the next screen and
  /// also replace the current screen by passing the screen widget
  Future<dynamic> replaceScreen(Widget page, {arguments}) async => navigationKey.currentState?.pushReplacement(
    MaterialPageRoute(
      builder: (_) => page,
    ),
  );

  /// This allows you to navigate to the next screen and
  /// also replace the current screen by passing the screen widget
  Future<dynamic> replaceToLoginScreen({arguments}) async => navigationKey.currentState?.pushNamedAndRemoveUntil("/login",(route) => false);

  /// Allows pop to the first screen to when the app first launched.
  /// This is useful when you need to log out a user,
  /// and also remove all the screens on the navigation stack.
  void popToFirst() => navigationKey.currentState?.popUntil((route) => route.isFirst);
}

// NavigationService().navigateToScreen(MyHomePage());
// NavigationService().replaceScreen(MyHomePage());
// NavigationService().goBack();
// NavigationService().popToFirst();
