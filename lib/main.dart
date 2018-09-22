import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'package:flutter_redux_starter/presentation/platform_adaptive.dart';
import 'package:flutter_redux_starter/screens/loading_screen.dart';
import 'package:flutter_redux_starter/store/store.dart';
import 'package:flutter_redux_starter/middleware/middleware.dart';
import 'package:flutter_redux_starter/models/app_state.dart';
import 'package:flutter_redux_starter/routes.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
    final store = createStore();

    MyApp();

    @override
    Widget build(BuildContext context) {
        return new PersistorGate(
            persistor: persistor,
            loading: new LoadingScreen(),
            builder: (context) => new StoreProvider<AppState>(
                store: store,
                child: new MaterialApp(
                    title: 'Flutter test App',
                    theme: defaultTargetPlatform == TargetPlatform.iOS
                        ? kIOSTheme
                        : kDefaultTheme,
                routes: getRoutes(context, store),
                    initialRoute: '/login',
                )
            ),
        );
    }

}