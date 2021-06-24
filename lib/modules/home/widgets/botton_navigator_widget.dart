import 'package:flutter/material.dart';

import 'package:payflow/shared/themes/app_colors.dart';

class BottonNavigatorWidget extends StatefulWidget {
  final VoidCallback primaryOnTap;
  final VoidCallback secondOnTap;
  final VoidCallback thirdOnTap;
  const BottonNavigatorWidget({
    Key? key,
    required this.primaryOnTap,
    required this.secondOnTap,
    required this.thirdOnTap,
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
              onPressed: widget.primaryOnTap),
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
            onTap: widget.secondOnTap,
          ),
          IconButton(
              icon: Icon(Icons.description_outlined, color: AppColors.body),
              onPressed: widget.thirdOnTap),
        ],
      ),
    );
  }
}
