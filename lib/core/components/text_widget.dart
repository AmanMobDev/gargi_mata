import '../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

class TextWidget extends StatelessWidget {
  final String value;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;

  const TextWidget({
    super.key,
    required this.value,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.textOverflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      softWrap: true,
      textAlign: textAlign,
      style: TextStyle(
        color: AppColor.blackColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        overflow: textOverflow,
      ),
    );
  }
}
