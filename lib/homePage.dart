import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget> [
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> images = [
    "images/2.png",
    "images/1.jpg",
    "images/shatta.jpg",
    "images/1.jpg",
    "images/shatta.jpg",
    "images/2.jpg",
  ];

  List<String> des = [
    "API Deve & Integration",
    "Psychology Lecture",
    "Don't miss this show",
    "Upcoming Jams.",
    "Don't miss, come witha friend",
    "AAB Hit upcoming...",
  ];

  Widget customcard(String langname, String image, String des){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(

            //builder: (context) => getjson(langname),
          ));
        },
        child: Material(
          color: Colors.white,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.0,),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      color: Colors.deepOrange,
                      //height: 200.0,
                      //width: 350.0,
                      child: Image.asset(image)
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    langname,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    des,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontFamily: "Alike"
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  trailing: Column(
                    children: <Widget>[
                      Text('€45',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontFamily: "Alike"
                        ),),
                      Icon(Icons.share,)
                    ],
                  ),
                  onTap: (){

                  },
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket\'O',
          style: TextStyle(
            fontSize: 22.0,
            fontFamily: "Alike",
          ),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: (){

            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.deepOrange,
                child: Icon(Icons.ac_unit, size: 70.0, color: Colors.white,),
                radius: 40.0,
              ),
            ),
            Text('TICKET\'O', textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Alike',
                  fontSize: 20.0,
                  decoration: TextDecoration.none,
                  color: Colors.deepOrange
              ),),
            Blink(
              duration: const Duration(milliseconds: 1000),
              child: new Text(
                'LIVE CONCERT TICKET',
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "Alike",
                    color: Colors.black
                ),),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.home, color: Colors.deepOrange,),
              title: Text('Home'),
              onTap: (){

              },
            ),
            ListTile(
              leading: Icon(Icons.event, color: Colors.deepOrange,),
              title: Text('Upcoming Events'),
              onTap: (){

              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart, color: Colors.deepOrange,),
              title: Text('My Tickets'),
              onTap: (){

              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.deepOrange,),
              title: Text('Profile'),
              onTap: (){

              },
            ),
            ListTile(
              leading: Icon(Icons.apps, color: Colors.deepOrange,),
              title: Text('Version: 1.0.0'),
              onTap: (){

              },
            ),


          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Flutter Meetup", images[0], des[0]),
          customcard("FI Psychology", images[1], des[1]),
          customcard("Shata Live Jams", images[2], des[2]),
          customcard("Upcoming..", images[3], des[3]),
          customcard("AI Hub", images[4], des[4]),
          customcard("Live Computing", images[5], des[5]),
        ],
      ),

      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget get bottomNavigationBar {
    return Container(
      height: 77,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        boxShadow: [BoxShadow(
          blurRadius: 8,
          color: Colors.grey,
        )],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        child: BottomNavigationBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.deepOrange,), title: Text("Home", style: TextStyle(
            fontFamily: "Quando", fontWeight: FontWeight.w700, color: Colors.deepOrange),)),
          BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.deepOrange,), title: Text("Search", style: TextStyle(
            fontFamily: "Quando", fontWeight: FontWeight.w700, color: Colors.deepOrange),)),
          BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.deepOrange,),title: Text("Profile", style: TextStyle(
            fontFamily: "Quando", fontWeight: FontWeight.w700, color: Colors.deepOrange),)),
        ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepOrange,
          onTap: _onItemTapped,

        ),
      ),
    );
  }
}


class Blink extends StatefulWidget {
  Blink({this.child, this.duration});
  final Widget child;
  final Duration duration;

  @override
  createState() => new BlinkState();
}

class BlinkState extends State<Blink> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller =
    new AnimationController(duration: widget.duration, vsync: this);
    final CurvedAnimation curve =
    new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = new Tween(begin: 2.0, end: 0.0).animate(curve);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        controller.reverse();
      else if (status == AnimationStatus.dismissed) controller.forward();
    });
    controller.forward();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new FadeTransition(
          opacity: animation,
          child: widget.child,
        ),
      ),
    );
  }
}

