import '../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

class TextWidget extends StatelessWidget {
  final String value;
  final double? fontSize;
  final FontWeight? fontWeight;
  const TextWidget({
    super.key,
    required this.value,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      softWrap: true,
      style: TextStyle(
        color: AppColor.blackColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
