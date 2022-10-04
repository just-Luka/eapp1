import 'package:flutter/cupertino.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: YandexMap(
        mapObjects: [
          PlacemarkMapObject(
            mapId: MapObjectId('start_placemark'),
            point: Point(latitude: 55.7558, longitude: 37.6173),
            icon: PlacemarkIcon.single(PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                    'assets/images/map-mark-sign.png'))),
          ),
          PlacemarkMapObject(
            mapId: MapObjectId('stop_by_placemark'),
            point: Point(latitude: 55.755173, longitude: 37.619097),
            icon: PlacemarkIcon.single(PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                    'assets/images/map-mark-sign.png'))),
          ),
        ],
      ),
    );
  }
}
