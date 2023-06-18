import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

final mapController  = MapController.withPosition(
            initPosition: GeoPoint(
              latitude: 47.9,
              longitude: 11.7,
          ),
);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: OSMFlutter( 
        controller: mapController,
        userTrackingOption: UserTrackingOption(
           enableTracking: true,
           unFollowUser: false,
        ),
        initZoom: 11,
        minZoomLevel: 10,
        maxZoomLevel: 19,
        stepZoom: 1.0,
        userLocationMarker: UserLocationMaker(
            personMarker: MarkerIcon(
                icon: Icon(
                    Icons.location_history_rounded,
                    color: Colors.red,
                    size: 48,
                ),
            ),
            directionArrowMarker: MarkerIcon(
                icon: Icon(
                    Icons.double_arrow,
                    size: 48,
                ),
            ),
        ),
         roadConfiguration: RoadOption(
                roadColor: Colors.yellowAccent,
        ),
        markerOption: MarkerOption(
            defaultMarker: MarkerIcon(
                icon: Icon(
                  Icons.person_pin_circle,
                  color: Colors.blue,
                  size: 56,
                  ),
                )
        ),
    ),
    );
  }
} //Video @ 5:00