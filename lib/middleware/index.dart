import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../actions/actions.dart';
import '../models/model.dart';

List<Middleware<AppState>> createStoreMiddleware() {
  final loginUser = _loginUser();

  return [
    TypedMiddleware<AppState, LoginAction>(loginUser),
    new LoggingMiddleware.printer(),
  ];
}

Middleware<AppState> _loginUser() {
  return (
    Store<AppState> store,
    action,
    NextDispatcher next,
  ) async {
    next(action);
    final Login login = store.state.login;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    login.callbackFn?.call();

    store.dispatch(ChangeLoginAction(Login(loading: false)));

    await prefs.setString('token', 'mock');
  };
}
