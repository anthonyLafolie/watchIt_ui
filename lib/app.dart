import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/authentication/authentication.dart';
import 'package:watch_it/common/themes.dart';
import 'package:watch_it/screen/home/view/home_screen.dart';
import 'package:watch_it/screen/login/login.dart';
import 'package:watch_it/screen/splash/splash.dart';
import 'package:theme_provider/theme_provider.dart';

import 'repository/authentication_repository/authentication_repository.dart';
import 'repository/user_repository/user_repository.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.authenticationRepository,
    required this.userRepository,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: [
        AppTheme(
            id: "light", data: Themes.themeLight, description: "Light theme"),
        AppTheme(id: "dark", data: Themes.themeDark, description: "Dark theme"),
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            theme: ThemeProvider.themeOf(themeContext).data,
            title: 'Watch It',
            debugShowCheckedModeBanner: false,
            navigatorKey: _navigatorKey,
            builder: (context, child) {
              return BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  switch (state.status) {
                    case AuthenticationStatus.authenticated:
                      _navigator.pushAndRemoveUntil<void>(
                        HomeScreen.route(),
                        (route) => false,
                      );
                      break;
                    case AuthenticationStatus.unauthenticated:
                      _navigator.pushAndRemoveUntil<void>(
                        LoginScreen.route(),
                        (route) => false,
                      );
                      break;
                    default:
                      break;
                  }
                },
                child: child,
              );
            },
            onGenerateRoute: (_) => SplashScreen.route(),
          ),
        ),
      ),
    );
  }
}
