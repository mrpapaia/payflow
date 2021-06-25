import 'package:flutter/material.dart';

import 'package:payflow/modules/extract/extract_page.dart';
import 'package:payflow/modules/home/widgets/boleto_tile_widget.dart';
import 'package:payflow/modules/meu_boletos/meus_boletos_page.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_widget.dart';

import 'home_controller.dart';
import 'widgets/app_bar_widget.dart';
import 'widgets/botton_navigator_widget.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    final pages = [
      MeusBoletosPage(
        key: UniqueKey(),
      ),
      ExtractPage(key: UniqueKey())
    ];
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(
          user: widget.user,
        ),
        preferredSize: Size.fromHeight(152),
      ),
      body: pages[homeController.currentPage],
      bottomNavigationBar: BottonNavigatorWidget(
        currentPage: homeController.currentPage,
        primaryOnTap: () {
          homeController.setPage(0);
          setState(() {});
        },
        secondOnTap: () async {
          await Navigator.pushNamed(context, "/barcodeScanner");
          setState(() {});
        },
        thirdOnTap: () {
          homeController.setPage(1);
          setState(() {});
        },
      ),
    );
  }
}
