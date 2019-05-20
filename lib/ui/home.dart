import 'package:flutter/material.dart';
import './zoom_scaffold.dart';
import './menu_page.dart';

//class Home extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//
//    return new HomeState();
//  }
//}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return new ZoomScaffold(
      menuScreen: MenuScreen(),
      contentScreen: Layout(
          contentBuilder: (cc)=> Container(
            color: Colors.grey[200],
            child: Container(
              color: Colors.grey[200],
            ),
          )
      ),
    );
  }
}





//      bottomNavigationBar: BottomAppBar(
//        child: Container(
//          color: Colors.black45,
//          height: 50.0,
//        ),
//      ),
//
//
//
//      floatingActionButton: FloatingActionButton(
//        onPressed: () => setState((){} ),
//        tooltip: 'Tip about the buton can be added here',
//        child: Icon(Icons.add),
//      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//    );
//  }
//}