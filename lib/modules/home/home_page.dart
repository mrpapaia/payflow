import 'package:flutter/material.dart';
import 'package:payflow/modules/home/widgets/boleto_tile_widget.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_widget.dart';
import 'package:payflow/shared/widgets/meu_boletos/meus_boletos_page.dart';

import 'home_controller.dart';
import 'widgets/app_bar_widget.dart';
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
      MeusBoletosPage(),
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
        primaryOnTap: () {
          homeController.setPage(0);
          setState(() {});
        },
        secondOnTap: () {
          Navigator.pushNamed(context, "/insertBoleto");
        },
        thirdOnTap: () {
          homeController.setPage(1);
          setState(() {});
        },
      ),
    );
  }
}
