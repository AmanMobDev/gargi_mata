import '../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

class TextWidget extends StatelessWidget {
  final String value;
  const TextWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Text(value);
  }
}
