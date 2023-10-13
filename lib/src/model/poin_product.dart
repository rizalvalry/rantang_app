import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:flutter/material.dart' show Color, Colors;

class PointProduct {
  Color? cardBackgroundColor;
  Color? buttonTextColor;
  Color? buttonBackgroundColor;
  String? imagePath;
  String? keterangan;

  PointProduct({
    this.cardBackgroundColor,
    this.buttonTextColor = AppColor.baseColor,
    this.buttonBackgroundColor = Colors.white,
    this.imagePath,
    required this.keterangan, // Tambahkan 'required' di sini
  });
}

