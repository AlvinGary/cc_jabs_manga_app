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
        title: Text("Sign In"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(24),
            child: Center(
              child: Form(
                key: _loginKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              elevation: 0,
                              textStyle: TextStyle(fontSize: 16),
                              padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              )),
                          child: Text('Sign In')),
                    ),
                    SizedBox(height: 16),
                    Divider(thickness: 2),
                    SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          await AuthService.signInWithGoogle().then((value) {
                            UiToast.toastOk("Welcome Back");
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 3,
                            textStyle: TextStyle(fontSize: 16),
                            shadowColor: Colors.green,
                            padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            )),
                        label: Text(
                          'Sign In with Google',
                          style: TextStyle(color: Colors.green),
                        ),
                        icon: FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.96),
            child: GestureDetector(
              onTap: () {},
              child: Text("Belum Punya Akun ? Daftar di Sini !",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
