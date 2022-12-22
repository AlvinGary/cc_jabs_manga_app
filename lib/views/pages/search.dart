part of 'pages.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

final searchController = TextEditingController();

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.search),
            hintText: "Search",
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                        color: Colors.black87, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
