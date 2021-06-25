import 'package:flutter/material.dart';
import 'package:payflow/modules/home/widgets/boleto_tile_widget.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';

class BoletoListWidget extends StatefulWidget {
  BoletoListWidget({Key? key}) : super(key: key);

  @override
  _BoletoListWidgetState createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = BoletoListController();

    return ValueListenableBuilder<List<BoletoModel>>(
      valueListenable: controller.boletoNotifier,
      builder: (_, boletos, __) => Column(
          children:
              boletos.map((e) => BoletoTileWidget(boletoModel: e)).toList()),
    );
  }
}
