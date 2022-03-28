import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/chart_action.dart';

extension JSExecutable on WebViewController {
  Future<void> execute(ChartAction method, {required List args}) async =>
      runJavascript(_generateJS(method.method, args: args));

  String _generateJS(String method, {required List args}) {
    final str = '$method(${args.argsString})';
    debugPrint(str);
    return str;
  }
}

extension on List {
  String get argsString => toString().replaceAll('[', '').replaceAll(']', '');
}
