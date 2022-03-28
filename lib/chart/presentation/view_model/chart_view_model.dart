import 'package:flutter_chart_poc/chart/domain/models/chart_time_frame.dart';
import 'package:flutter_chart_poc/chart/domain/usecase/chart_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../domain/usecase/chart_controller_interface.dart';
import 'chart_view_model_interface.dart';

class ChartViewModel extends IChartViewModel {
  late final ChartController _chartController;

  @override
  bool isChartReady = false;

  @override
  void onChartLoaded(WebViewController controller) {
    _chartController = ChartControllerImplementation(controller);
    _chartController.init();
    isChartReady = true;
    notifyListeners();
  }

  @override
  ChartTimeFrame getCurrentChartTimeFrame() {
    return _chartController.getCurrentChartTimeFrame();
  }

  @override
  void setChartTimeFrame(ChartTimeFrame timeFrame) {
    _chartController.setTimeFrame(timeFrame);
    notifyListeners();
  }
}
