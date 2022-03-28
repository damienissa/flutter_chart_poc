enum ChartTimeFrame {
  m1,
  m5,
  m15,
  m30,
  h1,
  h4,
  d1,
  w1,
  mn,
}

extension ChartNamedTimeFrame on ChartTimeFrame {
  String chartType() {
    switch (this) {
      case ChartTimeFrame.m1:
        return '\'1M\'';
      case ChartTimeFrame.m5:
        return '\'5M\'';
      case ChartTimeFrame.m15:
        return '\'15M\'';
      case ChartTimeFrame.m30:
        return '\'30M\'';
      case ChartTimeFrame.h1:
        return '\'1H\'';
      case ChartTimeFrame.h4:
        return '\'4H\'';
      case ChartTimeFrame.d1:
        return '\'1D\'';
      case ChartTimeFrame.w1:
        return '\'1W\'';
      case ChartTimeFrame.mn:
        return '\'1MO\'';
      default:
        return '\'M30\'';
    }
  }
}
