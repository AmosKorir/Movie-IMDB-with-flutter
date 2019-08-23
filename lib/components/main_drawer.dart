import 'package:flutter/material.dart';

import '../main.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              margin: EdgeInsets.all(40.0),

              child:Align(
                alignment: Alignment.center,
                child:  ListView(

                  children: <Widget>[
                    Icon(Icons.favorite,color: Colors.white),
                    Text("Movie IMDB",textAlign: TextAlign.center,)
                  ],
                ),
              )
            ),
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          ),
          ListTile(
            leading: Icon(Icons.beenhere,
              color: Colors.black87,),
            title: Text('Most Popular'),
            onTap: () {
              // Update the state of the app.

              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.beenhere,
            color: Colors.black87,),
            title: Text('Highest Rated'),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.beenhere,
              color: Colors.black87,),
            title: Text('Most Rated'),
            onTap: () {

              Navigator.pop(context);
            },
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.settings_applications,
              color: Colors.blue,),
            title: Text('Privacy Policy'),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(Icons.favorite,
              color: Colors.red,),
            title: Text('Rate Us'),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context);
            },
          ),



        ],
      ),
    );
  }
}

//interface to


