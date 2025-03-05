/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

import 'package:flutter/cupertino.dart';

import '../../config/exports/app_export.dart';

class LoadingWidget extends StatelessWidget {
  final dynamic height;
  const LoadingWidget({super.key, this.height = 50});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Platform.isAndroid
              ? const CircularProgressIndicator()
              : const CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
