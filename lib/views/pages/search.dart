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
        title:
            Text("Browse", style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
      body: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 80,
                  child: ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ActionGenrePage()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          elevation: 5,
                          shadowColor: Colors.black,
                          textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )),
                      child: Text('Action')),
                ),
                Container(
                  width: 150,
                  height: 80,
                  child: ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdventureGenrePage()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          elevation: 5,
                          shadowColor: Colors.black,
                          textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )),
                      child: Text('Adventure')),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 80,
                  child: ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComedyGenrePage()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          elevation: 5,
                          shadowColor: Colors.black,
                          textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )),
                      child: Text('Comedy')),
                ),
                Container(
                  width: 150,
                  height: 80,
                  child: ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DramaGenrePage()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          elevation: 5,
                          shadowColor: Colors.black,
                          textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )),
                      child: Text('Drama')),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 80,
                  child: ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FantasyGenrePage()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          elevation: 5,
                          shadowColor: Colors.black,
                          textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )),
                      child: Text('Fantasy')),
                ),
                Container(
                  width: 150,
                  height: 80,
                  child: ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HaremGenrePage()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          elevation: 5,
                          shadowColor: Colors.black,
                          textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )),
                      child: Text('Harem')),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 80,
                  child: ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IsekaiGenrePage()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          elevation: 5,
                          shadowColor: Colors.black,
                          textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )),
                      child: Text('Isekai')),
                ),
                Container(
                  width: 150,
                  height: 80,
                  child: ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SliceOfLifeGenrePage()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          elevation: 5,
                          shadowColor: Colors.black,
                          textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )),
                      child:
                          Text('Slice Of Life', textAlign: TextAlign.center)),
                ),
              ],
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
