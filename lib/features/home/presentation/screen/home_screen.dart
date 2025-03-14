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
  // final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //
  // Future<void> uploadData() async {
  //   CollectionReference collectionRef = firestore.collection('home');
  //
  //   for (var item in imgList) {
  //     await collectionRef.add(item);
  //   }
  //
  //   debugPrint("Data uploaded successfully!");
  // }

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: StreamBuilder<List<HomeResponseModel>>(
        stream: context.read<HomeBloc>().homeUseCase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return customCircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: TextWidget(value: "No data available"));
          } else {
            final homeDataList = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 15.0,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 5.0),
                    child: Text(
                      "|| जय गार्गी माता ||",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
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
                      HomeBloc.imgList
                          .map(
                            (item) => Container(
                              margin: EdgeInsets.all(15.0),
                              child: ClipRRect(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Center(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: AppColor.whiteColor,
                                        ),
                                        // padding: EdgeInsets.symmetric(
                                        //   vertical: 10.0,
                                        //   horizontal: 8.0,
                                        // ),
                                        child: Image.asset(
                                          item['image'].toString(),
                                          fit: BoxFit.contain,
                                          scale: 1.0,
                                          width:
                                              MediaQuery.sizeOf(context).width,
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
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TableCalendar(
                    locale: 'hi',
                    firstDay: DateTime.utc(2025, 1, 1),
                    lastDay: DateTime.utc(2040, 12, 31),
                    focusedDay: _focusedDay,
                    calendarFormat: CalendarFormat.week,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },

                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.backgroundColor,
                      ),
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
                    ),
                    daysOfWeekVisible: true,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(
                    height: 25,
                    child: Marquee(
                      text: homeDataList[0].eventInfo,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      blankSpace: 50.0,
                      velocity: 100.0,
                      pauseAfterRound: Duration(seconds: 2),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    primary: true,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
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
                                  theme: SvgTheme(
                                    currentColor: AppColor.backgroundColor,
                                  ),
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
                ),
              ],
            );
          }
        },
      ),
    );

    // child: SingleChildScrollView(
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 10.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       spacing: 15.0,
    //       children: [
    //         Center(
    //           child: Padding(
    //             padding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
    //             child: Text(
    //               "|| जय गार्गी माता ||",
    //               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    //             ),
    //           ),
    //         ),
    //
    //         CarouselSlider(
    //           options: CarouselOptions(
    //             aspectRatio: 16 / 9,
    //             viewportFraction: 0.6,
    //             initialPage: 0,
    //             enableInfiniteScroll: true,
    //             reverse: false,
    //             autoPlay: true,
    //             autoPlayInterval: Duration(seconds: 3),
    //             autoPlayAnimationDuration: Duration(milliseconds: 800),
    //             autoPlayCurve: Curves.fastOutSlowIn,
    //             enlargeCenterPage: true,
    //             enlargeFactor: 0.3,
    //             scrollDirection: Axis.horizontal,
    //           ),
    //           items:
    //               imgList
    //                   .map(
    //                     (item) => Container(
    //                       margin: EdgeInsets.all(15.0),
    //                       child: ClipRRect(
    //                         borderRadius: BorderRadius.all(
    //                           Radius.circular(15.0),
    //                         ),
    //                         child: Stack(
    //                           fit: StackFit.expand,
    //                           children: [
    //                             Center(
    //                               child: Container(
    //                                 decoration: const BoxDecoration(
    //                                   color: AppColor.whiteColor,
    //                                 ),
    //                                 padding: EdgeInsets.symmetric(
    //                                   vertical: 10.0,
    //                                   horizontal: 8.0,
    //                                 ),
    //                                 child: Image.asset(
    //                                   item['image'].toString(),
    //                                   fit: BoxFit.fitHeight,
    //                                   scale: 1.0,
    //                                   width: MediaQuery.sizeOf(context).width,
    //                                 ),
    //                               ),
    //                             ),
    //                             Positioned(
    //                               bottom: 0.0,
    //                               left: 0.0,
    //                               right: 0.0,
    //                               child: Container(
    //                                 decoration: BoxDecoration(
    //                                   gradient: LinearGradient(
    //                                     colors: [
    //                                       AppColor.backgroundColor,
    //                                       AppColor.whiteColor,
    //                                     ],
    //                                     begin: Alignment.bottomCenter,
    //                                     end: Alignment.topCenter,
    //                                   ),
    //                                 ),
    //                                 padding: EdgeInsets.symmetric(
    //                                   vertical: 10.0,
    //                                   horizontal: 20.0,
    //                                 ),
    //                                 child: Text(
    //                                   item['name'].toString(),
    //                                   style: TextStyle(
    //                                     color: Colors.black,
    //                                     fontSize: 20.0,
    //                                     fontWeight: FontWeight.bold,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   )
    //                   .toList(),
    //         ),
    //
    //         TableCalendar(
    //           locale: 'hi',
    //           firstDay: DateTime.utc(2025, 1, 1),
    //           lastDay: DateTime.utc(2040, 12, 31),
    //           focusedDay: _focusedDay,
    //           calendarFormat: CalendarFormat.week,
    //           selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
    //           onDaySelected: (selectedDay, focusedDay) {
    //             setState(() {
    //               _selectedDay = selectedDay;
    //               _focusedDay = focusedDay;
    //             });
    //           },
    //
    //           headerStyle: HeaderStyle(
    //             formatButtonVisible: false,
    //             titleCentered: true,
    //             titleTextStyle: TextStyle(
    //               fontSize: 18,
    //               fontWeight: FontWeight.bold,
    //               color: AppColor.backgroundColor,
    //             ),
    //           ),
    //           calendarStyle: CalendarStyle(
    //             todayDecoration: BoxDecoration(
    //               color: AppColor.backgroundColorWithOpacity,
    //               shape: BoxShape.circle,
    //             ),
    //             selectedDecoration: BoxDecoration(
    //               color: AppColor.backgroundColor,
    //               shape: BoxShape.circle,
    //             ),
    //           ),
    //           daysOfWeekVisible: true, // Show days of the week
    //         ),
    //
    //         // Marquee Text
    //         SizedBox(
    //           height: 30,
    //           child: Marquee(
    //             text: '   ●   10 अप्रैल 2025 को गार्गी पूजन है।',
    //             style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    //             scrollAxis: Axis.horizontal,
    //             blankSpace: 50.0,
    //             velocity: 100.0,
    //             pauseAfterRound: Duration(seconds: 2),
    //           ),
    //         ),
    //
    //         GridView.builder(
    //           shrinkWrap: true,
    //           primary: true,
    //           padding: EdgeInsets.symmetric(horizontal: 5.0),
    //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //             crossAxisCount: 3,
    //             mainAxisExtent: 120, // Set fixed height for each item
    //             crossAxisSpacing: 10.0,
    //             mainAxisSpacing: 10.0,
    //           ),
    //           itemCount: menuOptions.length,
    //           itemBuilder: (context, index) {
    //             return GestureDetector(
    //               onTap: () {
    //                 setState(() {
    //                   getSelectedMenu(
    //                     context: context,
    //                     menuOptions: menuOptions[index]['option'],
    //                   );
    //                 });
    //               },
    //               child: Card(
    //                 color: AppColor.whiteColor,
    //                 child: Center(
    //                   child: Column(
    //                     spacing: 20.0,
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     mainAxisSize: MainAxisSize.min,
    //                     children: [
    //                       SvgPicture.asset(
    //                         menuOptions[index]['icons'].toString(),
    //                         theme: SvgTheme(
    //                           currentColor: AppColor.backgroundColor,
    //                         ),
    //                         fit: BoxFit.contain,
    //                         width: 48.0,
    //                         height: 48.0,
    //                       ),
    //                       Text(
    //                         menuOptions[index]['option'].toString(),
    //                         style: TextStyle(
    //                           color: AppColor.backgroundColor,
    //                           fontSize: 18.0,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             );
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // ),
  }
}
