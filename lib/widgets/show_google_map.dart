// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowGoogleMap extends StatelessWidget {
  final double lat;
  final double lng;
  const ShowGoogleMap({
    Key? key,
    required this.lat,
    required this.lng,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<MarkerId, Marker> markers = {};
    MarkerId markerId = const MarkerId('id');
    Marker marker = Marker(
      markerId: markerId,
      position: LatLng(lat, lng),
      infoWindow: InfoWindow(title: 'คุณอยู่ที่นี่', snippet: '$lat, $lng'),
    );
    markers[markerId] = marker;

    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(lat, lng),
        zoom: 16,
      ),
      onMapCreated: (controller) {},
      markers: Set<Marker>.of(markers.values),
    );
  }
}
