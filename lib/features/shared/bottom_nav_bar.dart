import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigationBar extends StatefulWidget{
  @override
  State<BottomNavigationBar> createState() => _BottomNavBar();
}



class _BottomNavBar extends State<BottomNavigationBar> {
    int _idx = 0;
    static const List<Widget> _widgetOpts = <Widget>[
      Text(
        'Login',
        style: TextStyle(fontFamily: 'Manrope-Bold')
      ),
      Text(
        'Register',
        style: TextStyle(fontFamily: 'Manrope-Bold')
      ),
      Text(
        'New Password',
        style: TextStyle(fontFamily: 'Manrope-Bold')
      )
    ];

    void _activeItem(int i){
      setState(() => _idx = i);
    }

    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}