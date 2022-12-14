part of 'pages.dart';

class LatestPage extends StatefulWidget {
  const LatestPage({Key? key}) : super(key: key);

  @override
  _LatestPageState createState() => _LatestPageState();
}

class _LatestPageState extends State<LatestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latest Updates"),
      ),
      body: Container(
        child: Center(
          child: Text("Latest Updates Page"),
        ),
      ),
    );
  }
}
