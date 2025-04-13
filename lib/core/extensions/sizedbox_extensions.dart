import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Gaps on num {
  Widget get hGap => SizedBox(width: toDouble().w);
  Widget get vGap => SizedBox(height: toDouble().h);
}
