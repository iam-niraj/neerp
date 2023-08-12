// ignore_for_file: unused_import, must_be_immutable, prefer_const_constructors

import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/app/bloc/auth_bloc_bloc.dart';
import 'package:neerp/config/routes.dart';
import 'package:neerp/config/services/api_service.dart';
import 'package:neerp/config/services/customer_repository.dart';
import 'package:neerp/screens/Add%20Lift/add_lift.dart';
import 'package:neerp/screens/Completed%20Activity/completed_activity.dart';
import 'package:neerp/screens/Dashboard/dashboard_view.dart';
import 'package:neerp/screens/Lift%20List/lift_list_view.dart';
import 'package:neerp/screens/Login/login_screen.dart';
import 'package:neerp/screens/Welcome/welcomePage.dart';
import 'package:neerp/screens/splash.dart';
import 'package:neerp/utils/scrollBehaviour.dart';
import 'package:neerp/utils/theme/theme.dart';
import 'bloc_observer.dart';
import 'package:neerp/utils/theme/theme_settings.dart';

Future<void> main() async {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final apiService = APIService();
      final customerRepository = UserRepository();
      runApp(MyApp(apiService: apiService, userRepository: customerRepository));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  MyApp(
      {super.key,
      required APIService apiService,
      required UserRepository userRepository})
      : _apiService = apiService,
        _userRepository = userRepository;

  final APIService _apiService;
  final UserRepository _userRepository;
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;

  ThemeMode themeMode = ThemeMode.light;
  bool longLabel = false;
  TextDirection textDirection = TextDirection.ltr;
  ThemeSettings settings = const ThemeSettings(
    useMaterial3: true,
    useCustomTheme: true,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _apiService,
      child: BlocProvider(
        create: (_) => AuthBlocBloc(
          apiService: _apiService,
          customerRepository: _userRepository,
        ),
        child: ScreenUtilInit(
          designSize: const Size(428, 882),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp(
            navigatorKey: _navigatorKey,
            debugShowCheckedModeBanner: false,
            scrollBehavior: MyBehavior(),
            title: 'Neerp',
            themeMode: themeMode,
            theme: theme(ThemeMode.light, settings),
            darkTheme: theme(ThemeMode.dark, settings),
            builder: (context, child) {
              return BlocListener<AuthBlocBloc, AuthBlocState>(
                listener: (context, state) {
                  switch (state.status) {
                    case AuthenticationStatus.authenticated:
                      _navigator.pushAndRemoveUntil<void>(
                        DashboardView.route(),
                        (route) => false,
                      );
                      break;
                    case AuthenticationStatus.unauthenticated:
                      _navigator.pushAndRemoveUntil<void>(
                        LoginScreen.route(),
                        (route) => false,
                      );
                      break;
                    case AuthenticationStatus.unknown:
                      break;
                  }
                },
                child: child,
              );
            },
            onGenerateRoute: (_) => SplashPage.route(),
            /* FlowBuilder(
              state: context.select((AuthBlocBloc bloc) => bloc.state.status),
              onGeneratePages: onGenerateAppViewPages,
            ), */
          ),
        ),
      ),
    );
  }
}
