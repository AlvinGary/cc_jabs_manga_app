part of 'widgets.dart';

class UiLoading {
  static Container loading() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.transparent,
      child: const SpinKitFadingCircle(
        size: 50,
        color: Color.fromARGB(255, 255, 195, 85),
      ),
    );
  }

  static Container loadingDD() {
    return Container(
      alignment: Alignment.center,
      width: 30,
      height: 30,
      color: Colors.transparent,
      child: const SpinKitFadingCircle(
        size: 30,
        color: Color.fromARGB(255, 255, 191, 0),
      ),
    );
  }

  static Container loadingBlock() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.black12,
      child: const SpinKitFadingCircle(
        size: 50,
        color: Color.fromARGB(255, 255, 191, 0),
      ),
    );
  }
}
