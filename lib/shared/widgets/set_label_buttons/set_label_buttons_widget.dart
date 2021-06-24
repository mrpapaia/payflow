import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

import 'package:payflow/shared/widgets/divider_vertical/divider_vertical_widget.dart';
import 'package:payflow/shared/widgets/label_button/label_button_widget.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnTap;
  final String secondLabel;
  final VoidCallback secondOnTap;
  final bool enablePrimaryColor;
  const SetLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnTap,
    required this.secondLabel,
    required this.secondOnTap,
    this.enablePrimaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.stroke,
      height: 56,
      child: Row(
        children: [
          Expanded(
              child: LabelButtonWidget(
            label: primaryLabel,
            onTap: primaryOnTap,
            style: enablePrimaryColor ? TextStyles.buttonPrimary : null,
          )),
          DividerVerticalWidget(),
          Expanded(
              child: LabelButtonWidget(label: secondLabel, onTap: secondOnTap)),
        ],
      ),
    );
  }
}
