library routes;

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_starter/screens/login_screen.dart';
import 'package:flutter_redux_starter/screens/main_screen.dart';

import 'models/app_state.dart';

Map<String, WidgetBuilder> getRoutes(context, store) {
  return {
    '/': (BuildContext context) => new StoreConnector<AppState, dynamic>(
        converter: (store) => store.state.auth.isAuthenticated,
        builder: (BuildContext context, isAuthenticated) =>
            isAuthenticated ? new MainScreen() : new LoginScreen()
    ),
    '/login': (BuildContext context) => new StoreBuilder<AppState>(
          builder: (context, store) {
            return new LoginScreen();
          },
        ),
    '/main': (BuildContext context) => new StoreBuilder<AppState>(
          builder: (context, store) {
            return new MainScreen();
          },
        ),
  };
}
