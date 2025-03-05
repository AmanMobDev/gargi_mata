import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/
class MantraScreen extends StatefulWidget {
  const MantraScreen({super.key});

  @override
  State<MantraScreen> createState() => _MantraScreenState();
}

class _MantraScreenState extends State<MantraScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      appTitle: "",
      child:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          spacing: 10.0,
          children: [
            Text(
              "ॐ अपवित्रः पवित्रो वा सर्वावस्थां गतोऽपि वा। यः स्मरेत् पुण्डरीकाक्षं स बाह्याभ्यन्तरः शुचिः॥ \n ऊं शांति सुशान्ति: सर्वारिष्ट शान्ति भवतु \n ऊं लक्ष्मीनारायणाभ्यां नमः \n ऊं उमामहेश्वराभ्यां नमः \n वाणी हिरण्यगर्भाभ्यां नमः \n ऊं शचीपुरन्दराभ्यां नमः \n ऊं मातापितृ चरण कमलभ्यो नमः \n ऊं इष्टदेवाताभ्यो नमः \n ऊं कुलदेवताभ्यो नमः",
              style: TextStyle(
                color: AppColor.blackColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      )
    );
  }
}
