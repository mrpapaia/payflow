import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      height: 152,
      child: Center(
        child: ListTile(
          title: Text.rich(TextSpan(
              text: "Ola",
              style: TextStyles.titleRegular,
              children: [
                TextSpan(text: " Diogo", style: TextStyles.titleBoldBackground)
              ])),
          subtitle: Text(
            "Matenha suas contas em dia",
            style: TextStyles.captionShape,
          ),
          trailing: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
    );
  }
}
