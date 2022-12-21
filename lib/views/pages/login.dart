part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginKey = GlobalKey<FormState>();
  bool isHide = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.fromLTRB(24, 48, 24, 0),
            child: Center(
              child: Form(
                key: _loginKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Welcome to Wow! Manga You can get your Daily Manga here!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.orange[600],
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(24, 4, 24, 4),
                      child: ElevatedButton(
                          onPressed: () async {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuPage()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange[50],
                              elevation: 3,
                              shadowColor: Colors.orange,
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              )),
                          child: Text('Login as Guest')),
                    ),
                    SizedBox(height: 16),
                    Divider(thickness: 2),
                    SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(24, 4, 24, 4),
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          await AuthService.signInWithGoogle().then((value) {
                            UiToast.toastOk("Welcome Back");
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuPage()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            elevation: 5,
                            textStyle: TextStyle(fontSize: 16),
                            shadowColor: Colors.black,
                            padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            )),
                        label: Text(
                          'Sign In with Google',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
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
            ),
          ),
        ],
      ),
    );
  }
}
