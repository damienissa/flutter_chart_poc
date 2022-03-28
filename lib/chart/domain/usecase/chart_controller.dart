import 'package:webview_flutter/webview_flutter.dart';
import '../models/chart_action.dart';
import '../models/chart_time_frame.dart';
import 'chart_controller_interface.dart';
import 'helpers.dart';

class ChartControllerImplementation implements ChartController {
  ChartControllerImplementation(this._webViewController);
  ChartTimeFrame _currentTimeFrame = ChartTimeFrame.m5;
  final WebViewController _webViewController;

  @override
  void init() {
    Future.delayed(const Duration(seconds: 1), () {
      setTimeFrame(_currentTimeFrame);
      _webViewController.execute(ChartAction.setSymbol, args: ['\'EURUSD\'']);
    });
  }

  @override
  void changeChartType() {}

  @override
  void setTimeFrame(ChartTimeFrame timeFrame) {
    _currentTimeFrame = timeFrame;
    _webViewController
        .execute(ChartAction.setTimeFrame, args: [timeFrame.chartType()]);
  }

  @override
  ChartTimeFrame getCurrentChartTimeFrame() => _currentTimeFrame;
}
