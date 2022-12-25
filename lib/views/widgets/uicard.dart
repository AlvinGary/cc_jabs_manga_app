part of "widgets.dart";

class UiCard extends StatefulWidget {
  const UiCard({Key? key}) : super(key: key);
  @override
  _UiCardState createState() => _UiCardState();
}

class _UiCardState extends State<UiCard> {
  @override
  Widget build(BuildContext context) {
    // This is the white card.
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: Card(
          color: const Color(0xFFFFFFFF),
          margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 0,
          child: InkWell(
              onTap: () {},
              //splashColor: const Color(0xFF43A7FF),
              child: Container(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            width: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 40, 107, 53)),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          Color.fromARGB(255, 145, 145, 145)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ])))),
      decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 3,
            ),
          ]),
    );
  }
}
