import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mproject/Screens/Login/Login.dart';


class Gps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GpsPage(title: 'Location'),
    );
  }
}

class GpsPage extends StatefulWidget {
  GpsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  GpsPageState createState() => GpsPageState();
}

class GpsPageState extends State<GpsPage> {
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Circle circle;
  GoogleMapController _controller;

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(17.3972, 78.4900),
    zoom: 14.4746,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/location.png");
    return byteData.buffer.asUint8List();
  }

  Future<Uint8List> getMarkerForCllg() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/dot.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("user"),
          position: latlng,
          //rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
    });
  }

  void showCllgLocation(Uint8List imageData) {
    LatLng latlng = LatLng(17.3972, 78.4900);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("cllg"),
          position: latlng,
          //rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circle = Circle(
          circleId: CircleId("areaCllg"),
          radius: 100,
          //radius:latlng.latitude,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      Uint8List imageDataCllg = await getMarkerForCllg();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);
      showCllgLocation(imageDataCllg);
      double distanceInMeters = await Geolocator().distanceBetween(
          location.latitude, location.longitude, 17.3972, 78.4900);
      print('distanceInMeters');
      print(distanceInMeters);
      if(distanceInMeters<=300){
        flag=true;
        print('within range');
      }
      if(distanceInMeters>300){
        flag=false;
        print('not in range');
      }
      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription =
          _locationTracker.onLocationChanged().listen((newLocalData) {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(
              new CameraPosition(
                  bearing: 192.8334901395799,
                  target: LatLng(newLocalData.latitude, newLocalData.longitude),
                  tilt: 0,
                  zoom: 18.00)));
          updateMarkerAndCircle(newLocalData, imageData);
          //showCllgLocation(imageDataCllg);
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue[800],
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: initialLocation,
        markers: Set.of((marker != null) ? [marker] : []),
        circles: Set.of((circle != null) ? [circle] : []),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[800],
          child: Icon(Icons.location_searching),
          onPressed: () {
            getCurrentLocation();
          }),
    );
  }
}
