/* import 'package:flutter/cupertino.dart';
import 'package:neerp/app/bloc/auth_bloc_bloc.dart';
import 'package:neerp/config/services/api_service.dart';
import 'package:neerp/screens/Dashboard/dashboard_view.dart';
import 'package:neerp/screens/Login/login_screen.dart';

List<Page>? onGenerateAppViewPages(
    AuthenticationStatus state, List<Page<dynamic>> page) {
  switch (state) {
    case AuthenticationStatus.authenticated:
      return [DashboardView.page()];
    case AuthenticationStatus.unauthenticated:
      return [LoginScreen.page()];
    case AuthenticationStatus.unknown:
      break;
  }
}
 */