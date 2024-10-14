import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      markers.add(
        const Marker(
          markerId: MarkerId("1"),
          position: LatLng(
            37.7749,
            -122.4194,
          ),
          infoWindow: InfoWindow(title: "My Location"),
        ),
      );
      markers.add(
        const Marker(
          markerId: MarkerId("2"),
          position: LatLng(
            37.7749,
            -122.4694,
          ),
          infoWindow: InfoWindow(title: "My Location 2"),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maps Screen"),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
            target: LatLng(
              37.7749,
              -122.4194,
            ),
            zoom: 12.0),
        onMapCreated: _onMapCreated,
        markers: markers,
      ),
    );
  }
}
