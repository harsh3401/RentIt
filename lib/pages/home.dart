import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rentofy/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;
  late GoogleMapController mapController;
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(19.0760, 72.8777),
    zoom: 14.4746,
  );
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(19.0760, 72.8777),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
  ];

  final LatLng _center = const LatLng(19.0760, 72.8777);

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Dashboard');
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF4b39ef),
        textTheme: GoogleFonts.lexendDecaTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Colors.white,
            title: Padding(
              padding: EdgeInsets.fromLTRB(20, 40, 0, 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Choose ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Service Area',
                              style: TextStyle(
                                  color: Color(0xFF4b39ef),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ],
                      ),
                    ),
                    Text('To Browse our rental listings',
                        style: TextStyle(
                          color: Color(0xFF8B97A2),
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ))
                  ]),
            ),
            elevation: 2,
          ),
        ),
        body: Container(
          child: SafeArea(
            // on below line creating google maps
            child: GoogleMap(
              myLocationButtonEnabled: false,
              // on below line setting camera position
              initialCameraPosition: _kGoogle,
              // on below line we are setting markers on the map
              markers: Set<Marker>.of(_markers),
              // on below line specifying map type.
              mapType: MapType.normal,
              // on below line setting user location enabled.
              myLocationEnabled: true,
              // on below line setting compass enabled.
              compassEnabled: true,
              // on below line specifying controller on map complete.
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FloatingActionButton(
              backgroundColor: Color(0xFF4b39ef),
              onPressed: () async {
                getUserCurrentLocation().then((value) async {
                  print(value.latitude.toString() +
                      " " +
                      value.longitude.toString());

                  // marker added for current users location
                  _markers.add(Marker(
                    markerId: MarkerId("2"),
                    position: LatLng(value.latitude, value.longitude),
                    infoWindow: InfoWindow(
                      title: 'My Current Location',
                    ),
                  ));

                  // specified current users location
                  CameraPosition cameraPosition = new CameraPosition(
                    target: LatLng(value.latitude, value.longitude),
                    zoom: 14,
                  );

                  final GoogleMapController controller =
                      await _controller.future;
                  controller.animateCamera(
                      CameraUpdate.newCameraPosition(cameraPosition));
                  setState(() {});
                });
              },
              child: Icon(Icons.gps_fixed),
            ),
            FloatingActionButton(
              backgroundColor: Color(0xFF4b39ef),
              onPressed: () async {
                getUserCurrentLocation().then((value) async {
                  print(value.latitude.toString() +
                      " " +
                      value.longitude.toString());

                  // marker added for current users location
                  _markers.add(Marker(
                    markerId: MarkerId("2"),
                    position: LatLng(value.latitude, value.longitude),
                    infoWindow: InfoWindow(
                      title: 'My Current Location',
                    ),
                  ));

                  // specified current users location
                  CameraPosition cameraPosition = new CameraPosition(
                    target: LatLng(value.latitude, value.longitude),
                    zoom: 14,
                  );

                  final GoogleMapController controller =
                      await _controller.future;
                  controller.animateCamera(
                      CameraUpdate.newCameraPosition(cameraPosition));
                  print("Location: ${value.latitude} ${value.longitude}");
                });
              },
              child: Icon(Icons.gps_fixed),
            )
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: _title(),
    //   ),
    //   body: Container(
    //     height: double.infinity,
    //     width: double.infinity,
    //     padding: const EdgeInsets.all(20),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         _userUid(),
    //         _signOutButton(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
