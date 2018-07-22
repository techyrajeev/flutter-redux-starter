import 'package:redux/redux.dart';

import 'package:flutter_redux_starter/reducers/app_reducer.dart';
import 'package:flutter_redux_starter/models/app_state.dart';
import 'package:flutter_redux_starter/middleware/middleware.dart';

Store<AppState> createStore() { 
    Store<AppState> store = new Store(
        appReducer,
        initialState: new AppState(),
        middleware: createMiddleware(),
    );
    persistor.start(store);

    return store;
}