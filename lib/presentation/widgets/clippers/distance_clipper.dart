import 'package:flutter/cupertino.dart';

class DistanceClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.close();
    // double part4th = size.width / 4;
    // double x0 = size.width;
    // double y0 = 0.0;
    //
    // var firstStart = Offset(x0, y0);
    // path.conicTo(size.width / 2, size.height, size.width, 0, 5);
    //

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
  
}
