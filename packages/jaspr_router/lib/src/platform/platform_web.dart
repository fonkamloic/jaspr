import 'dart:html';

import 'package:jaspr/jaspr.dart';

import '../route.dart';
import 'platform.dart';

class PlatformRouterImpl implements PlatformRouter {
  @override
  final HistoryManager history = HistoryManagerImpl();

  @override
  final RouteRegistry registry = RouteRegistryImpl();
}

/// Browser implementation of HistoryManager
/// Accesses the window.history api
class HistoryManagerImpl implements HistoryManager {
  @override
  void init(AppBinding binding, {void Function(Object? state, {String? url})? onChangeState}) {
    if (onChangeState != null) {
      window.onPopState.listen((event) {
        onChangeState(window.history.state);
      });
    }
  }

  @override
  void push(String url, {String? title, Object? data}) {
    window.history.pushState(data, title ?? url, url);
  }

  @override
  void replace(String url, {String? title, Object? data}) {
    window.history.replaceState(data, title ?? url, url);
  }

  @override
  void back() {
    window.history.back();
  }
}

class RouteRegistryImpl implements RouteRegistry {
  @override
  void registerRoutes(List<RouteBase> routes) {}
}
