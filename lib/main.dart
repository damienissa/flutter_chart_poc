import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chart_poc/chart/domain/models/chart_time_frame.dart';
import 'package:flutter_chart_poc/chart/presentation/view/chart_widget.dart';
import 'package:flutter_chart_poc/chart/presentation/view_model/chart_view_model.dart';

import 'chart/presentation/view_model/chart_view_model_interface.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Chart')),
            body: WebViewLoad(
              viewModel: ChartViewModel(),
            )));
  }
}

class WebViewLoad extends StatelessWidget {
  final IChartViewModel viewModel;
  const WebViewLoad({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (_, __) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: ChartWidget(viewModel: viewModel),
                ),
                if (viewModel.isChartReady)
                  Wrap(
                    children: ChartTimeFrame.values
                        .map((e) => CupertinoButton(
                            child: Text(
                              e.name,
                              style: TextStyle(
                                  fontWeight:
                                      e == viewModel.getCurrentChartTimeFrame()
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                            ),
                            onPressed: () {
                              viewModel.setChartTimeFrame(e);
                            }))
                        .toList(),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
