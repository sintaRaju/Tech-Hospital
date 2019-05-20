import 'package:flutter/material.dart';

class Hospital extends StatefulWidget {
  final Widget menuScreen;
  final Layout contentScreen;

  Hospital({
    this.menuScreen,
    this.contentScreen,
  });
  @override
  _HospitalState createState() => new _HospitalState();
}

class _HospitalState extends State<Hospital> {

  MenuController menuController;
  Curve scaleDownCurve = new Interval(0.0, 0.3, curve: Curves.easeOut);
  Curve scaleUpCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  createContentDisplay() {
    return zoomAndSlideContent(new Container(
      child: new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black87,
        elevation: 0.0,
        title: new Text("Tech Hospital"),
        leading: new IconButton(
            icon: new Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              menuController.toggle();
            }),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.access_time,
              color: Colors.white,
            ),
          )
        ],
      ),
//          body: widget.contentScreen.contentBuilder(context),
      body: new Center(
        child: new Container(
          alignment: Alignment.center,
          width: 412,
          color: Colors.black87,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Padding(
                  padding:
                  const EdgeInsets.only(left: 4.0, top: 20.0, right: 4.0,bottom: 10),
                  child: new MaterialButton(
                    height: 100.0,
                    minWidth: 350.0,
                    color: Colors.blueGrey,
                    textColor: Colors.white,
                    child: new Text(
                      "HOSPITAL",
                      style: TextStyle(fontSize: 40, fontFamily: 'Gilroy'),
                    ),
                    onPressed: () => {},
                    splashColor: Colors.blueAccent,
                  )),
              new Padding(
                  padding:
                  const EdgeInsets.only(left: 4.0, top: 20.0, right: 4.0, bottom: 10),
                  child: new MaterialButton(
                    height: 100.0,
                    minWidth: 350.0,
                    color: Colors.blueGrey,
                    textColor: Colors.white,
                    child: new Text(
                      "PHARMACY",
                      style: TextStyle(fontSize: 45, fontFamily: 'Gilroy'),
                    ),
                    onPressed: () => {},
                    splashColor: Colors.blueAccent,
                  )),
              new Padding(
                  padding:
                  const EdgeInsets.only(left: 4.0, top: 20.0, right: 4.0),
                  child: new MaterialButton(
                    height: 100.0,
                    minWidth: 350.0,
                    color: Colors.blueGrey,
                    textColor: Colors.white,
                    child: new Text(
                      "TELEMEDICINE",
                      style: TextStyle(fontSize: 40, fontFamily: 'Gilroy'),
                    ),
                    onPressed: () => {},
                    splashColor: Colors.blueAccent,
                  )),
            ],
          ),
        ),
      ),

      //          backgroundColor: Colors.black87,
//            bottomNavigationBar: BottomNavigationBar(
//              type: BottomNavigationBarType.fixed,
//              currentIndex: 0,
//              items: [
//                BottomNavigationBarItem(
//                  title: Text(''),
//                  icon: Icon(Icons.home, color: Colors.grey,)
//                ),
//                BottomNavigationBarItem(
//                    title: Text(''),
//                    icon: Icon(Icons.shopping_basket, color: Colors.grey)
//                ),
//                BottomNavigationBarItem(
//                    title: Text(''),
//                    icon: Icon(Icons.shopping_cart, color: Colors.grey)
//                ),BottomNavigationBarItem(
//                    title: Text(''),
//                    icon: Icon(Icons.person, color: Colors.grey)
//                ),
//              ],
//            ),
    );
  }
}