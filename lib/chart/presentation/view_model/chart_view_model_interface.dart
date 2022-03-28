import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../domain/models/chart_time_frame.dart';

abstract class IChartViewModel with ChangeNotifier {
  void onChartLoaded(WebViewController controller);
  bool get isChartReady;
  ChartTimeFrame getCurrentChartTimeFrame();
  void setChartTimeFrame(ChartTimeFrame timeFrame);
}
