import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'homePage.dart';
import 'register.dart';
import 'loading.dart';
//import 'package:getflutter/getflutter.dart';

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 30.0, top: 70.0, right: 30.0),
      color: Colors.deepOrange,
        child: Align(
          alignment: Alignment.center,
          child:
            ListView(
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.ac_unit, size: 90.0, color: Colors.deepOrange,),
                    radius: 80.0,
                  ),
                ),
                Text('TICKET\'O', textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Alike',
                      fontSize: 30.0,
                      decoration: TextDecoration.none,
                    color: Colors.white
                  ),),
                Blink(
                  duration: const Duration(milliseconds: 1000),
                  child: new Text(
                    'LIVE CONCERT TICKET',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: "Alike",
                      color: Colors.white
                    ),),
                ),
                Card(
                    elevation: 10.0,
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child: Text('No more straggle again to buy ticket for concert in your city. Easily book it here and simply buy it via your account.',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Alike'
                        ),
                      ),
                    )
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        child: RaisedButton(
                          color: Colors.white,
                          elevation: 10.0,
                          child: Text('Sign in',
                          style: TextStyle(
                            fontFamily: 'Alike',
                            fontSize: 17.0
                          ),),
                          onPressed: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => loadingView(),
                            ));
                            },
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0)
                        ),
                        child: /*GFButton(
                            onPressed: (){
                              Navigator.push(context, new  MaterialPageRoute(builder: (BuildContext context)=>userRegisterPage()));
                            },
                            text:"Register"
                        ),
                        */

                        RaisedButton(
                          padding: EdgeInsets.all(10.0),
                          color: Colors.white,
                          elevation: 10.0,
                          child: Text('Register',
                            style: TextStyle(
                                fontFamily: 'Alike',
                                fontSize: 17.0
                            ),),
                          onPressed: (){
                            Navigator.push(context, new  MaterialPageRoute(builder: (BuildContext context)=>userRegisterPage()));

                          },
                        ),

                      )
                    ],
                  ),
                )
                  ],
                )
        ),
    );
  }
}

/*
  Blinking Animation
 */

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

