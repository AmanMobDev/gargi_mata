import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> imgList = [
    {"name": "कात्यायनी", "image": "assets/images/कात्यायनी.jpeg"},
    {"name": "कालरात्रि", "image": "assets/images/कालरात्रि.webp"},
    {"name": "कुष्मांडा", "image": "assets/images/कुष्मांडा.png"},
    {"name": "चंद्रघंटा", "image": "assets/images/चंद्रघंटा.png"},
    {"name": "ब्रह्मचारिणी", "image": "assets/images/ब्रह्मचारिणी.gif"},
    {"name": "ब्रह्मचारिणी", "image": "assets/images/ब्रह्मचारिणी.gif"},
    {"name": "महागौरी", "image": "assets/images/महागौरी.png"},
    {"name": "शैलपुत्री", "image": "assets/images/शैलपुत्री.jpeg"},
    {"name": "सिद्धिदात्री", "image": "assets/images/सिद्धिदात्री.png"},
    {"name": "स्कन्दमाता", "image": "assets/images/स्कन्दमाता.jpeg"},
    {"name": "गार्गी माता", "image": "assets/images/gargi.jpeg"},
  ];

  final List<Map<String, String>> menuOptions = [
    {"index": "0", "option": "विधि", "icons": "assets/icons/vidhi.svg"},
    {"index": "1", "option": "सामग्री", "icons": "assets/icons/samagri.svg"},
    {"index": "2", "option": "मंत्र", "icons": "assets/icons/mantra.svg"},
    //{"index": "3", "option": "पंचांग", "icons": "assets/icons/panchang.svg"},
    {"index": "4", "option": "भजन", "icons": "assets/icons/bhajan.svg"},
    {"index": "5", "option": "दान पात्र", "icons": "assets/icons/daan.svg"},
    {"index": "6", "option": "इतिहास", "icons": "assets/icons/history.svg"},
  ];

  getSelectedMenu({BuildContext? context, String? menuOptions}) {
    debugPrint(menuOptions.toString());
    switch (menuOptions) {
      case "विधि":
        setState(() {
          Navigator.pushNamed(context!, RouteName.vidhiViewScreen);
        });

      case "सामग्री":
        setState(() {
          Navigator.pushNamed(context!, RouteName.samagriScreen);
        });
      case "मंत्र":
        setState(() {
          Navigator.pushNamed(context!, RouteName.mantraScreen);
        });
      case "भजन":
        setState(() {
          Navigator.pushNamed(context!, RouteName.bhajanScreen);
        });
      case "दान पात्र":
        setState(() {
          Navigator.pushNamed(context!, RouteName.daanScreen);
        });
      case "इतिहास":
        setState(() {
          Navigator.pushNamed(context!, RouteName.historyScreen);
        });
      default:
        Navigator.pushNamed(context!, RouteName.homeScreen);
    }
  }

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  late Map<DateTime, List<String>> _events;

  List<String> _getEventsForDay(DateTime day) {
    return _events[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
            child: Text(
              "|| जय गार्गी माता ||",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            viewportFraction: 0.6,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
          items:
              imgList
                  .map(
                    (item) => Container(
                      margin: EdgeInsets.all(15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Center(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: AppColor.whiteColor,
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 8.0,
                                ),
                                child: Image.asset(
                                  item['image'].toString(),
                                  fit: BoxFit.fitHeight,
                                  scale: 1.0,
                                  width: MediaQuery.sizeOf(context).width,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColor.backgroundColor,
                                      AppColor.whiteColor,
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 20.0,
                                ),
                                child: Text(
                                  item['name'].toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
        ),

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TableCalendar(
            firstDay: DateTime.utc(2025, 1, 1),
            lastDay: DateTime.utc(2040, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: CalendarFormat.twoWeeks,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: AppColor.backgroundColorWithOpacity,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: AppColor.backgroundColor,
                shape: BoxShape.circle,
              ),
              isTodayHighlighted: true,
              canMarkersOverflow: true,
            ),
            daysOfWeekVisible: true, // Show days of the week
          ),
        ),

        GridView.builder(
          shrinkWrap: true,
          primary: true,
          padding: EdgeInsets.all(20.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 120, // Set fixed height for each item
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: menuOptions.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  getSelectedMenu(
                    context: context,
                    menuOptions: menuOptions[index]['option'],
                  );
                });
              },
              child: Card(
                color: AppColor.whiteColor,
                child: Center(
                  child: Column(
                    spacing: 20.0,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        menuOptions[index]['icons'].toString(),
                        theme: SvgTheme(currentColor: AppColor.backgroundColor),
                        fit: BoxFit.contain,
                        width: 48.0,
                        height: 48.0,
                      ),
                      Text(
                        menuOptions[index]['option'].toString(),
                        style: TextStyle(
                          color: AppColor.backgroundColor,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
