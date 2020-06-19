import 'package:flutter/material.dart';
import './style.dart';
Widget drawerbox (Size size) {
  return Container(
      width:size.width/5,
      height: size.height,
      color:Colors.black87,
      child:Column(
        children: <Widget>[
          Container(
            height:size.height/4,
            child:Image.asset(
                'image/mlogo.jpg',fit:BoxFit.contain,
            ),),
          Container(
              height:size.height - size.height/4,
              child:ListView(
                padding: const EdgeInsets.all(10.0),

                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.home,size: 20.0,color:Colors.white),

                    title: Text('Home',style:Style.substyle),
                    trailing: Icon(Icons.arrow_forward_ios,size:20.0,color:Colors.white),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.scatter_plot,size: 20.0,color:Colors.white),

                    title: Text('Status',style:Style.substyle),
                    trailing: Icon(Icons.arrow_forward_ios,size:20.0,color:Colors.white),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.verified_user,size: 20.0,color:Colors.white),


                    title: Text('Verify',style:Style.substyle),
                    trailing: Icon(Icons.arrow_forward_ios,size:20.0,color:Colors.white),

                    onTap: (){ print("Verify Pressed");},
                  ),
                  ListTile(
                    leading: Icon(Icons.add_alert,size: 20.0,color:Colors.white),

                    title: Text('Notification',style:Style.substyle),
                    trailing: Icon(Icons.arrow_forward_ios,size:20.0,color:Colors.white),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.account_box,size: 20.0,color:Colors.white),

                    title: Text('About',style:Style.substyle),
                    trailing: Icon(Icons.arrow_forward_ios,size:20.0,color:Colors.white),
                    onTap: (){},
                  ),
                ],
              ))
        ],
      )

  );
}