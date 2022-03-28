import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../view_model/chart_view_model_interface.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({Key? key, required this.viewModel}) : super(key: key);
  final IChartViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: '',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController controller) async {
        await controller.loadFlutterAsset('assets/index.html');
        viewModel.onChartLoaded(controller);
      },
    );
  }
}
