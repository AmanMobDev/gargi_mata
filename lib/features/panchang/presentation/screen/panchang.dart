import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/
class PanchangScreen extends StatefulWidget {
  const PanchangScreen({super.key});

  @override
  State<PanchangScreen> createState() => _PanchangScreenState();
}

class _PanchangScreenState extends State<PanchangScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  late Map<DateTime, List<String>> _events;

  @override
  void initState() {

    _events = {
      DateTime.utc(2025, 2, 24): ["Meeting at 10 AM", "Project Deadline"],
      DateTime.utc(2025, 2, 25): ["Doctor Appointment", "Team Standup"],
      DateTime.utc(2025, 2, 26): ["Lunch with Client", "Gym Session"],
    };
    super.initState();
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }
  @override
  Widget build(BuildContext context) {
    return  TableCalendar(
      firstDay: DateTime.utc(2025, 1, 1),
      lastDay: DateTime.utc(2040, 12, 31),
      focusedDay: _focusedDay,
      calendarFormat: CalendarFormat.month,
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
    );
  }
}
