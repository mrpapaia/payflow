import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:payflow/modules/barcode_scanner/widgets/bottom_sheet_widget.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/divider_vertical/divider_vertical_widget.dart';
import 'package:payflow/shared/widgets/label_button/label_button_widget.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons_widget.dart';

class BarCodeScannerPage extends StatefulWidget {
  const BarCodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarCodeScannerPageState createState() => _BarCodeScannerPageState();
}

class _BarCodeScannerPageState extends State<BarCodeScannerPage> {
  final controller = BarcodeScannerController();
  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, "/insertBoleto");
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /* return BottomSheetWidget(
        title: "Não foi possível identificar um código de barras.",
        subTitle: "Tente escanear novamente ou digite o código do seu boleto.",
        primaryLabel: "Escanear novamente",
        primaryOnTap: () {},
        secondLabel: "Digitar código",
        secondOnTap: () {});*/
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    child: controller.cameraController!.buildPreview(),
                  );
                } else {
                  return Container();
                }
              }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: true,
                leading: BackButton(
                  color: AppColors.background,
                ),
                backgroundColor: Colors.black,
                title: Text(
                  "Escaneie o código de barras de boleto",
                  style: TextStyles.buttonBackground,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: Container(
                height: 56,
                child: SetLabelButtons(
                  primaryLabel: "Inserir código do boleto",
                  primaryOnTap: () {},
                  secondLabel: "Adicionar da galeria",
                  secondOnTap: () {},
                ),
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.hasError) {
                  return BottomSheetWidget(
                      title:
                          "Não foi possível identificar um código de barras.",
                      subTitle:
                          "Tente escanear novamente ou digite o código do seu boleto.",
                      primaryLabel: "Escanear novamente",
                      primaryOnTap: () {
                        controller.scanWithCamera();
                      },
                      secondLabel: "Digitar código",
                      secondOnTap: () {});
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
