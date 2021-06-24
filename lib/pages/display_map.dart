import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DisplayMap extends StatefulWidget {
  @override
  _DisplayMapState createState() => _DisplayMapState();
}

class _DisplayMapState extends State<DisplayMap> {
  Map data={};
  final Map<String, Marker> _markers = {};
   GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
     mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;
    double lat = data["loc"][0];
    double lon = data["loc"][1];
    final _center =  LatLng(lat, lon);
    final marker  = Marker(markerId: MarkerId(data["name"]),
    position: LatLng(lat,lon),
      infoWindow: InfoWindow(
        title: data["name"],
        snippet: data["address"],
      ),
    );
    _markers[data["name"]] = marker;
    return WillPopScope(
      onWillPop: (){
        return new Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.green[700],
          body: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _markers.values.toSet(),
          initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
      ),
      ),
      ),
    );
  }
}
