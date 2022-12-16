part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
          children: [
            Container(
              width: double.infinity,
              height: double. infinity,
              padding: EdgeInsets.all(24),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Icon masih sebagai placeholder untuk user image nanti

                    Icon(
                      Icons.person_rounded,
                      color: Colors.black,
                      size: 100.0

                      ),
                    SizedBox(height: 16,),
                    TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Username",
                      ),
                    ),
                    SizedBox(height: 16,),
                    TextField(
                      readOnly: true,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}