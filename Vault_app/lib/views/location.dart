import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_vault/routes/routes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  String routeName = "/location";
  Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late GoogleMapController _mapController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          'Location',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 25),
        ),
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              // Routes().signUp,
              Routes().orderDetails,
              (route) => false,
            );
          },
        ),
      ),
      body: Stack(
        children: [
          // GoogleMap(
          //   initialCameraPosition: CameraPosition(
          //     target:
          //         LatLng(35.7015638,139.6312565), 
          //     zoom: 15,
          //   ),
          //   onMapCreated: (GoogleMapController controller) {
          //     _mapController = controller;
          //   },
          //   myLocationButtonEnabled: false,
          //   myLocationEnabled: false,
          // ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/map.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 35,
            left: 32,
            right: 32,
            child: Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18, top: 8, bottom: 2),
                    child: Text(
                      'Property Name',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2, bottom: 8, left: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.cyan,
                          size: 29,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '7926 Old Blackburn Court Littleton, \nCO 80123',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.8,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            // Routes().ciHome,
            Routes().orderDetails,
            (route) => false,
          );
        },
        child: Icon(Icons.arrow_forward, size: 32, color: Colors.white),
        tooltip: 'View',
        backgroundColor: Colors.cyan,
        shape: CircleBorder(), // Make the button round
      ),
    );
  }
}
