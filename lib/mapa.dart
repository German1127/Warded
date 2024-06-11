import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  final LatLng celebraLocation = LatLng(-34.858741, -56.141793);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicación del Edificio Celebra'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: celebraLocation,
          zoom: 15,
        ),
        markers: {
          Marker(
            markerId: MarkerId('celebra'),
            position: celebraLocation,
            infoWindow: InfoWindow(
              title: 'Edificio Celebra',
              snippet: 'Zonamerica, Uruguay',
            ),
          ),
        },
      ),
    );
  }
}