import 'package:flutter/material.dart';

import 'package:payflow/home/home_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class BottonNavigatorWidget extends StatefulWidget {
  final VoidCallback onTapFrist;
  final VoidCallback onTapLast;
  const BottonNavigatorWidget({
    Key? key,
    required this.onTapFrist,
    required this.onTapLast,
  }) : super(key: key);

  @override
  _BottonNavigatorWidgetState createState() => _BottonNavigatorWidgetState();
}

class _BottonNavigatorWidgetState extends State<BottonNavigatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              icon: Icon(
                Icons.home,
                color: AppColors.primary,
              ),
              onPressed: widget.onTapFrist),
          InkWell(
            child: Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(color: AppColors.primary),
              child: Icon(
                Icons.add_box_outlined,
                color: AppColors.background,
              ),
            ),
            onTap: () {
              print("clicou");
            },
          ),
          IconButton(
              icon: Icon(Icons.description_outlined, color: AppColors.body),
              onPressed: widget.onTapLast),
        ],
      ),
    );
  }
}
