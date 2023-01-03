part of 'widgets.dart';

class UIChips {
  static Widget chip(String text, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      // avatar: CircleAvatar(
      //   backgroundColor: Colors.white70,
      //   child: Text(text[0].toUpperCase()),
      // ),
      label: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }
}
