import 'package:flutter_chart_poc/initialazible.dart';

import '../models/chart_time_frame.dart';

abstract class ChartController implements Initializable {
  void changeChartType();
  void setTimeFrame(ChartTimeFrame timeFrame);
  ChartTimeFrame getCurrentChartTimeFrame();
}
