import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/
class VidhiScreen extends StatefulWidget {
  const VidhiScreen({super.key});

  @override
  State<VidhiScreen> createState() => _VidhiScreenState();
}

class _VidhiScreenState extends State<VidhiScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      appTitle: "विधि",
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              spacing: 10.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "मंत्र जाप के लिए माला अलग हो \n दीपक प्रज्वल्लित ऐसे करें \n सर्वप्रथम ईश्वर से करें ये प्रार्थना \n सबसे पहले किसकी उपासना करें \n इस बात का रखें विशेष ध्‍यान \n सबसे अंत में करें आरती \n किसकी करें आरती",
                  style: TextStyle(
                    color: AppColor.blackColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
