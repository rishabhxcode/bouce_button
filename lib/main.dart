import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
 debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with  SingleTickerProviderStateMixin{
  int animflag = 0;
AnimationController _animationController;
Animation _animation;
@override
void initState(){
  super.initState();
  _animationController = AnimationController(
    vsync: this, duration: Duration(milliseconds: 100
    ),
    lowerBound: 0.0,
    upperBound: 0.1
    );


    // _animation = Tween(begin: 1.0, end: 1.2).animate(CurvedAnimation(
    //   parent: _animationController, 
    // curve: Curves.bounceInOut));

    _animationController.addListener((){
      setState(() {
      });

    });

    _animation = CurvedAnimation(parent: _animationController , curve:  Curves.bounceInOut);
}

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
  double scale = 1 + _animationController.value;
    return Scaffold(
      body: Center(
       child: GestureDetector(
         onTapUp: ontapup,
         onTapDown: ontapdown,
         onTapCancel: ontapcancel,
         child: Transform.scale(
          scale: scale,
          child: Container(
            alignment: Alignment.center,
             height: 50,
             width: 150,

             child: Text('Click', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(50))
            )
             ,),
         ),),
      )
    );
  }

ontapup(TapUpDetails details){
  _animationController.reverse();
}
ontapdown(TapDownDetails){
  _animationController.forward();
}

  ontapcancel(){
    _animationController.reverse();
  }

}
