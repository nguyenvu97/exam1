import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Trip {
  final String title;
  final String price;
  final String nights;
  // final String img;

  Trip({
    required this.title,
    required this.price,
    required this.nights,
    // required this.img
  });
}

class TripList extends StatefulWidget {
  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<Widget> _tripTiles = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addTrips();
    });
  }

  void _addTrips() {
    // get data from db
    List<Trip> _trips = [
      Trip(title: 'Beach Paradise', price: '350', nights: '3'),
      Trip(title: 'City Break', price: '400', nights: '5'),
      Trip(title: 'Ski Adventure', price: '750', nights: '2'),
      Trip(title: 'Space Blast', price: '600', nights: '4'),
    ];
    Future ft = Future(() {});

    _trips.forEach((Trip trip) {
      ft.then((_) {
        return Future.delayed(const Duration(microseconds: 100), () {
          _tripTiles.add(_buildTile(trip));
          _listKey.currentState!.insertItem(_tripTiles.length - 1);
        });
      });
    });
  }

  Widget _buildTile(Trip trip) {
    return ListTile(
      onTap: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) => Details(trip: trip)));
      },
      contentPadding: EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${trip.nights} nights',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[300])),
          Text(trip.title,
              style: TextStyle(fontSize: 20, color: Colors.grey[600])),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: FlutterLogo(),
      ),
      trailing: Text('\$${trip.price}'),
    );
  }

  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        key: _listKey,
        initialItemCount: _tripTiles.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: animation.drive(_offset),
            child: _tripTiles[index],
          );
        });
  }
}
