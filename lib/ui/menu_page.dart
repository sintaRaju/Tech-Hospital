import './circular_image.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget{

  final String imageUrl = "https://img.etimg.com/thumb/msid-68843926,width-643,imgsize-566072,resizemode-4/katiebouman.jpg";

  final List<MenuItem> options = [
    MenuItem(Icons.search, 'Search'),
    MenuItem(Icons.shopping_basket, 'Medicines Taken'),
    MenuItem(Icons.favorite, 'Reports'),
    MenuItem(Icons.local_hospital, 'Hospitals Visited'),
    MenuItem(Icons.format_list_bulleted, 'Billing'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 62, left: 32,bottom: 8,
          right: MediaQuery.of(context).size.width/2.9),
      color: Colors.blueAccent,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: CircularImage(
                  NetworkImage(imageUrl),
                ),
              ),
              Text('UserName Here',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              )
            ],
          ),
          Spacer(),
          Column(
            children: options.map((item) {
              return ListTile(
                onTap: (){},
                leading: Icon(item.icon, color: Colors.white, size: 20,),
                title: Text(item.title,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              );
            }).toList(),
          ),

          Spacer(),

          ListTile(
            onTap: (){},
            leading: Icon(Icons.settings, color: Colors.white, size: 20,),
            title: Text('Settings',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white
                )),),
          ListTile(
            leading: Icon(Icons.headset_mic, color: Colors.white, size: 20,),
            title: Text('Support',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white
                )),),
        ],
      ),
    );
  }
}


class MenuItem{
  String title;
  IconData icon;

  MenuItem(this.icon, this.title);
}