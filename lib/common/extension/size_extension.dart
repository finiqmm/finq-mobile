import 'package:finq/common/screenutil/screenutil.dart';
import 'package:flutter/material.dart';

extension SizeExtension on double {
  double get w => ScreenUtil().setWidth(this);
  double get h => ScreenUtil().setHeight(this);
  double get sp => ScreenUtil().setSp(this);
}

extension ContextExtension on BuildContext {
  double getFullHeight() => MediaQuery.of(this).size.height;
  
}
