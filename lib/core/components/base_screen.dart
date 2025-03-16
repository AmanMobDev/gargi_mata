import 'package:gargi_mata/config/exports/app_export.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _pages = <Widget>[
    HomeScreen(),
    JoinScreen(),
    GalleryScreen(),
    // HistoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _onItemTapped(_selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
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
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColor.backgroundColor,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          selectedItemColor: AppColor.whiteColor,
          iconSize: 30.0,

          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'होम'),
            BottomNavigationBarItem(
              icon: Icon(Icons.join_right),
              label: 'जुड़े',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'गैलरी'),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.settings),
            //   label: 'Settings',
            // ),
          ],
        ),
      ),
    );
  }
}
