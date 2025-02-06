import 'package:flutter/material.dart';
import 'package:on_point_executions/common/config/configuration.dart';
import 'package:on_point_executions/common/widgets/index.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Color? backgroundColor;
  final Drawer? endDrawer;
  final String? title;

  const BaseScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
    this.backgroundColor,
    this.endDrawer,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ?? _defaultAppBar(),
      body: body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      drawer: drawer,
      backgroundColor: backgroundColor ,
      endDrawer: endDrawer,
    );
  }

  PreferredSizeWidget _defaultAppBar() {
    return AppBar(
      centerTitle: true,
      title: BaseText.titleText(title ?? Config.appName, bold: true),
      backgroundColor: Colors.yellow,
    );
  }
}
