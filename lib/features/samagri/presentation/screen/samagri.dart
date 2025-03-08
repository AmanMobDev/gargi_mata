import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/
class SamagriScreen extends StatefulWidget {
  const SamagriScreen({super.key});

  @override
  State<SamagriScreen> createState() => _SamagriScreenState();
}

class _SamagriScreenState extends State<SamagriScreen> {
  final List<Map<String, dynamic>> samagri = [
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "साफ चावली", "weight": "100", "unit": "g"},
    {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
    {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
    {"item": "दीपक", "weight": "3", "unit": "p"},
  ];

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      appTitle: "",
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: samagri.length,
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10.0,
                children: [
                  Text(
                    samagri[index]["item"],
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Row(
                    spacing: 5.0,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        samagri[index]["weight"],
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        samagri[index]["unit"],
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          physics: BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
