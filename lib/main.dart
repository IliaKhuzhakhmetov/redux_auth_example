import 'package:auth_app/models/app_state.dart';
import 'package:auth_app/reducers/app_state_reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './container/login.dart';
import './middleware/index.dart';
import './presentation/home_page.dart';
import './presentation/protected_screen.dart';

void main() async {
  final res = await SharedPreferences.getInstance();

  runApp(App(prefs: res));
}

class App extends StatelessWidget {
  
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.init(),
    middleware: createStoreMiddleware(),
  );

  final SharedPreferences prefs;

  App({required this.prefs});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Redux Auth app',
        routes: {
          '/': (context) {
            return HomePage();
          },
          '/protected': (context) {
            return _handleCurrentScreen(prefs);
          }
        },
      ),
    );
  }

  Widget _handleCurrentScreen(SharedPreferences prefs) {
    dynamic loginedIn = (prefs.getString('token') ?? false);
    if (loginedIn != null && loginedIn != false) {
      return ProtectedScreen(
        prefs: prefs,
      );
    } else {
      return LoginContainer();
    }
  }
}
