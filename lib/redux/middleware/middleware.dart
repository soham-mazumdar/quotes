import 'package:flutter/material.dart';
import 'package:quotes/redux/middleware/init_middleware.dart';
import 'package:quotes/redux/middleware/navigation_middleware.dart';
import 'package:quotes/redux/models/app_state.dart';
import 'package:quotes/redux/services/favqs.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createMiddleWare(
  GlobalKey<NavigatorState> navigatorKey,
  QuoteApiService quoteApiService,
)
{
  return [
    ...createInitMiddleware(quoteApiService),
    ...createNavigationMiddleware(navigatorKey),
  ];
}