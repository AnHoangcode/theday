
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:theday/app/resource/base_define.dart';
import 'package:theday/app/resource/reponsive_utils.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: UtilsReponsive.height(100, context),
        width: UtilsReponsive.width(100, context),
        child: SpinKitFadingCircle(
          color: ColorManager.primaryColor, // Màu của nét đứt
          size: 50.0, // Kích thước của CircularProgressIndicator
        ),
      ),
    );
  }
}
