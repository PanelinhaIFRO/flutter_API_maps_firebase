import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class onde_estamos extends StatefulWidget {
  @override
  _onde_estamosState createState() => _onde_estamosState();
}

class _onde_estamosState extends State<onde_estamos> {

  Set<Marker> _marcadores = {};

  _carregarMarcadores() async {
    Set<Marker> _listaMarcadores = {};
    Marker marcador1 = Marker(
        markerId: MarkerId("marker-botanico"),
        position: LatLng(-9.913569649181907, -63.03595042831905),
        infoWindow: InfoWindow(
            title: "CAMBIOCÓ"
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        ),
        onTap: () {
          print("Você clicou no parque botânico de Ariquemes");
        }
    );

    _listaMarcadores.add(marcador1);

    setState(() {
      _marcadores = _listaMarcadores;
    });
  }

  @override
  Widget build(BuildContext context) {
    _carregarMarcadores();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
          centerTitle: true,
         title: Text('Conheça nosso escritorio:',
           style: TextStyle(
               color: Colors.black
           ),
         ),
        ),

      body: Container(

       child: GoogleMap(
         mapType: MapType.normal,
         initialCameraPosition: CameraPosition(
           zoom: 18,
           target: LatLng(-9.913569649181907, -63.03595042831905),
         ),
         markers: _marcadores,
       ),

      ),
    );
  }
}
