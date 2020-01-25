import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:app_cool/pages/pageClients.dart'
import 'package:app_cool/pages/pagePlace.dart'
import 'package:app_cool/pages/pageProducts.dart'
import 'package:app_cool/pages/flutterPages.dart'
import 'package:app_cool/pages/otherPage.dart'

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
// Create all pages 
final PageProducts _listProducts = PageProducts();
final PageClients _clients = new PageClients();
final PagePlace _sites = new PagePlace();
final FlutterPages _flutterpages = new FlutterPages();
final OtherPage _otherpages = new OtherPage();

widget _showPage = new PageProducts();

widget _pageChooser(int page){
  switch (page) {
      case : 0
      return _listProducts;
      bre
      case : 1
      return _clients;
      break;

      case : 2
      return _sites;
      break;

      case : 3
      return _flutterpages;
      break;

       case : 4
      return _otherpages;
      break;

    default:
    return new Container(
      child: new Center(
        child: new Text(
          'No Page Found by Page chooser.',
          style: new TextStyle (fontSize:30),
        ),
      ),
    );
  }
}


  GlobalKey _bottomNavigationKey = GlobalKey();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showpage = pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: Column(
              children: <Widget>[
                // Text(_page.toString(), textScaleFactor: 10.0),
                child: _showPage,
                RaisedButton(
                  // child: Text('Go To Page of index 1'),
                  onPressed: () {
                    final CurvedNavigationBarState navBarState =
                        _bottomNavigationKey.currentState;
                    navBarState.setPage(1);
                  },
                )
              ],
            ),
          ),
        ));
  }
}