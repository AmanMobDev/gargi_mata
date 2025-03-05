import '../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

class CustomAppBar extends StatelessWidget {
  String? appTitle;
  IconData? icon;

  CustomAppBar({super.key, this.appTitle, this.icon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //foregroundColor: AppColor.backgroundColor,
      backgroundColor: AppColor.backgroundColorWithOpacity,
      // automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Text(
        appTitle!,
        style: TextStyle(
          color: AppColor.blackColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevation: 5.0,
    );
  }
}
