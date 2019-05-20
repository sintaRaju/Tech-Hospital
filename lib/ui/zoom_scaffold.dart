import 'package:flutter/material.dart';

class ZoomScaffold extends StatefulWidget {
  final Widget menuScreen;
  final Layout contentScreen;

  ZoomScaffold({
    this.menuScreen,
    this.contentScreen,
  });

  @override
  _ZoomScaffoldState createState() => new _ZoomScaffoldState();
}

class _ZoomScaffoldState extends State<ZoomScaffold>
    with TickerProviderStateMixin {
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
        //backgroundColor: Colors.transparent,
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
      ),
    ));
  }

  zoomAndSlideContent(Widget content) {
    var slidePercent, scalePercent;
    switch (menuController.state) {
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent = slideOutCurve.transform(menuController.percentOpen);
        scalePercent = scaleDownCurve.transform(menuController.percentOpen);
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(menuController.percentOpen);
        scalePercent = scaleUpCurve.transform(menuController.percentOpen);
        break;
    }

    final slideAmount = 275.0 * slidePercent;
    final contentScale = 1.0 - (0.2 * scalePercent);
    final cornerRadius = 16.0 * menuController.percentOpen;

    return new Transform(
      transform: new Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(contentScale, contentScale),
      alignment: Alignment.centerLeft,
      child: new Container(
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              offset: const Offset(0.0, 5.0),
              blurRadius: 15.0,
              spreadRadius: 10.0,
            ),
          ],
        ),
        child: new ClipRRect(
            borderRadius: new BorderRadius.circular(cornerRadius),
            child: content),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Scaffold(
            body: widget.menuScreen,
          ),
        ),
        createContentDisplay()
      ],
    );
  }
}

class ZoomScaffoldMenuController extends StatefulWidget {
  final ZoomScaffoldBuilder builder;

  ZoomScaffoldMenuController({
    this.builder,
  });

  @override
  ZoomScaffoldMenuControllerState createState() {
    return new ZoomScaffoldMenuControllerState();
  }
}

class ZoomScaffoldMenuControllerState
    extends State<ZoomScaffoldMenuController> {
  MenuController menuController;

  @override
  void initState() {
    super.initState();

    menuController = getMenuController(context);
    menuController.addListener(_onMenuControllerChange);
  }

  @override
  void dispose() {
    menuController.removeListener(_onMenuControllerChange);
    super.dispose();
  }

  getMenuController(BuildContext context) {
    final scaffoldState =
        context.ancestorStateOfType(new TypeMatcher<_ZoomScaffoldState>())
            as _ZoomScaffoldState;
    return scaffoldState.menuController;
  }

  _onMenuControllerChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, getMenuController(context));
  }
}

typedef Widget ZoomScaffoldBuilder(
    BuildContext context, MenuController menuController);

class Layout {
  final WidgetBuilder contentBuilder;

  Layout({
    this.contentBuilder,
  });
}

class MenuController extends ChangeNotifier {
  final TickerProvider vsync;
  final AnimationController _animationController;
  MenuState state = MenuState.closed;

  MenuController({
    this.vsync,
  }) : _animationController = new AnimationController(vsync: vsync) {
    _animationController
      ..duration = const Duration(milliseconds: 250)
      ..addListener(() {
        notifyListeners();
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            state = MenuState.opening;
            break;
          case AnimationStatus.reverse:
            state = MenuState.closing;
            break;
          case AnimationStatus.completed:
            state = MenuState.open;
            break;
          case AnimationStatus.dismissed:
            state = MenuState.closed;
            break;
        }
        notifyListeners();
      });
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  get percentOpen {
    return _animationController.value;
  }

  open() {
    _animationController.forward();
  }

  close() {
    _animationController.reverse();
  }

  toggle() {
    if (state == MenuState.open) {
      close();
    } else if (state == MenuState.closed) {
      open();
    }
  }
}

enum MenuState {
  closed,
  opening,
  open,
  closing,
}
