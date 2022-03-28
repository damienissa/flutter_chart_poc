enum ChartAction {
  setTimeFrame,
  setSymbol,
}

extension ChartActionName on ChartAction {
  String get method {
    switch (this) {
      case ChartAction.setTimeFrame:
        return 'window.chart.setTimeframe';
      case ChartAction.setSymbol:
        return 'window.chart.setSymbol';
    }
  }
}
