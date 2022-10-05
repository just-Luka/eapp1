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
            mapId: const MapObjectId('start_placemark'),
            point: const Point(latitude: 55.7558, longitude: 37.6173),
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(""),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
