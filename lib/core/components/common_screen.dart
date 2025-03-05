import '../../config/exports/app_export.dart';

class CommonScreen extends StatefulWidget {
  String? appTitle;
  Widget? child;
   CommonScreen({super.key, this.appTitle, this.child});

  @override
  State<CommonScreen> createState() => _CommonScreenState();
}

class _CommonScreenState extends State<CommonScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(60.0), child: CustomAppBar(appTitle: widget.appTitle ==  null ?"" : widget.appTitle.toString(),)),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.2, 0.5, 1.0],
              tileMode: TileMode.clamp,
              colors: [
                AppColor.backgroundColorWithOpacity,
                AppColor.whiteColor,
                AppColor.backgroundColorWithOpacity,
              ],
            ),
          ),
          child: widget.child,
        ),

      ),
    );
  }
}
