import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test01/main.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MaterialApp(


    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => FirstPage(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => SecondPage(),

      '/NavToNewpagePopupMenu': (context) => NavToNewpagePopupMenu(),
    },
  ),
  );
}


enum PageEnum {
  firstPage,
  secondPage,
}

class NavToNewpagePopupMenu extends StatefulWidget {
  @override
  NavToNewpagePopupMenuState createState() {
    return new NavToNewpagePopupMenuState();
  }
}



class NavToNewpagePopupMenuState extends State<NavToNewpagePopupMenu> {
  _onSelect(PageEnum value) {
    switch (value) {
      case PageEnum.firstPage:
        Navigator.of(context).push(
            CupertinoPageRoute(builder: (BuildContext context) => FirstPage()));
        break;
      case PageEnum.secondPage:
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (BuildContext context) => SecondPage()));
        break;
      default:
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (BuildContext context) => SecondPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test Case"),
          actions: <Widget>[
            PopupMenuButton<PageEnum>(
            onSelected: _onSelect,
            itemBuilder: (context) => <PopupMenuEntry<PageEnum>>[
                  PopupMenuItem<PageEnum>(
                    value: PageEnum.firstPage,
                    child: Text("Go to First Page"),
                  ),
                ],
          ),
          ],
        ),
        body: Center(
          ),
          drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Text(''),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
        );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Press for next site'),
          onPressed: (){
            Navigator.pushAndRemoveUntil(
              context, 
              MaterialPageRoute(builder: (context) => NextSite()),
              (Route<dynamic> route) => false,
              );
          },
          )
      ),
    );
  }
}

class NextSite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.adjust), 
            onPressed: (){
              Navigator.push(
                context, 
              MaterialPageRoute(builder: (context) => SecondPage()));
            },
            )
        ],
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Press for go back.'),
          onPressed: (){
            Navigator.pushAndRemoveUntil(
              context, 
              MaterialPageRoute(builder: (context) => FirstPage()),
              (Route<dynamic> route) => false, //entfernt man dies plus das "andRemoveUntil" errscheint oben links ein go back zeichen womit man wieder normal zurück kann
              );
          },
          )
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final items = List<String>.generate(10000, (i) => "Item $i");


  


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text'),
        actions: <Widget>[
           IconButton(icon: Icon(Icons.adjust),
             onPressed: (){
               Navigator.pushNamed(context, '/');
             })
        ],
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text('${items[index]}'),
            );
          }
        ),
          
      
    );
  }
}