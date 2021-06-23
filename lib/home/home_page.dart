import 'package:flutter/material.dart';
import 'package:payflow/home/home_controller.dart';
import 'package:payflow/home/widgets/app_bar_widget.dart';

import 'widgets/botton_navigator_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    final pages = [
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.blue,
      )
    ];
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(),
        preferredSize: Size.fromHeight(152),
      ),
      body: pages[homeController.currentPage],
      bottomNavigationBar: BottonNavigatorWidget(
        onTapFrist: () {
          homeController.setPage(0);
          setState(() {});
        },
        onTapLast: () {
          homeController.setPage(1);
          setState(() {});
        },
      ),
    );
  }
}
