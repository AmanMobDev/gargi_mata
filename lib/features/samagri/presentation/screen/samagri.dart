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
  final List<String> samagri = [
    "लाल चुनरी",
    "लाल वस्त्र",
    "मौली",
    "श्रृंगार का सामान",
    "दीपक",
    "घी/ तेल",
    "धूप",
    "नारियल",
    "साफ चावल",
    "कुमकुम",
    "फूल",
    "देवी की प्रतिमा या फोटो",
    "पान",
    "सुपारी",
    "लौंग",
    "इलायची",
    "बताशे या मिसरी",
    "कपूर",
    "फल-मिठाई",
    "कलावा",
  ];

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      appTitle: "",
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: samagri.length,
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          itemBuilder: (context, index) {
            return Text(
              samagri[index],
              style: TextStyle(
                color: AppColor.blackColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            );
          },
          physics: BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
