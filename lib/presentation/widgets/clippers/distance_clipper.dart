import 'package:flutter/cupertino.dart';

class DistanceClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Path path = Path();
    // path.lineTo(size.width, 0);

    double part4th = size.width / 4;
    double x0 = size.width;
    double y0 = 0.0;

    var firstStart = Offset(x0, y0);
    path.conicTo(size.width / 4, 3 * size.height / 4, size.width, size.height, 20);



    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  
}
