import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 * Created By Aman Mishra
 ******************************************************************************/

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      appTitle: "इतिहास",
      child: StreamBuilder<QuerySnapshot>(
        stream: DataBaseCollectionServices().readData(
          "database",
        ), // Removed `await`
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No data available"));
          }

          return ListView(
            children:
                snapshot.data!.docs.map((doc) {
                  return ListTile(
                    title: Text(doc['image']),
                  ); // Access your data here
                }).toList(),
          );
        },
      ),
    );
  }
}
