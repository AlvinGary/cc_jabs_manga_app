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
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          (AuthService.auth.currentUser != null)
              ? IconButton(
                  onPressed: () async {
                    await AuthService.SignOut().then((value) {
                      if (value) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                        UiToast.toastOk("Logout successful!");
                      } else {
                        UiToast.toastErr("Logout failed!");
                      }
                    });
                  },
                  icon: Icon(Icons.logout))
              : Container()
        ],
      ),
      body: Stack(
        children: [
          (AuthService.auth.currentUser != null)
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: EdgeInsets.fromLTRB(24, 0, 24, 32),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 65,
                          backgroundColor: Colors.orange,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                                "${AuthService.auth.currentUser!.photoURL}"),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 4),
                          alignment: Alignment.centerLeft,
                          child: Text("Username",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black87, width: 2),
                            ),
                            border: OutlineInputBorder(),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 20),
                            labelText:
                                "${AuthService.auth.currentUser!.displayName}",
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 4),
                          alignment: Alignment.centerLeft,
                          child: Text("Email",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextField(
                          readOnly: true,
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black87, width: 2),
                            ),
                            border: OutlineInputBorder(),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 20),
                            labelText: "${AuthService.auth.currentUser!.email}",
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: EdgeInsets.all(24),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Icon masih sebagai placeholder untuk user image nanti
                        Icon(Icons.person_rounded,
                            color: Colors.black, size: 100.0),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Username",
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          readOnly: true,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email",
                          ),
                        ),
                        SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              await AuthService.signInWithGoogle()
                                  .then((value) {
                                UiToast.toastOk("Welcome back");
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MenuPage()));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                elevation: 3,
                                textStyle: TextStyle(fontSize: 16),
                                shadowColor: Colors.black,
                                padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            label: Text(
                              'Login Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            icon: FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            ),
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
