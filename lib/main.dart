import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  Future<bool> exitDialog(){
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to exit from the app?'),
        actions: [
          TextButton(onPressed: (){
            SystemNavigator.pop();
          }, child: Text('Yes')),
          TextButton(onPressed: (){
            Navigator.of(context).pop(false);
          }, child: Text('No'))
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return exitDialog();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('First Page'),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
              }, child: Text('Go Page 2')),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (BuildContext context) => ThirdPage()));
              }, child: Text('Go Page 3'))
            ],
          ),
        ));
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Third Page'),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Go Page 1'))
            ],
          ),
        ));
  }
}
