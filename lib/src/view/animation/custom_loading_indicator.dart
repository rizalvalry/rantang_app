import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
        backgroundColor: AppColor.baseColor,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
  }
}
