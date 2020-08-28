import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data:ModalRoute.of(context).settings.arguments;


    //set Background
    print(data);
    String bgImage = data['isDayTime']?'testDay.png':'test.png';
    Color bgColor = data['isDayTime']?Colors.white:Colors.black;


    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(
          child:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image : AssetImage('assets/images/$bgImage'),
                fit:BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,40.0,0,0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context,'/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDayTime': result['isDayTime'],
                          'flag': result['flag']
                        };
                      });
                      },
                    icon:Icon(Icons.edit_location,
                    color: Colors.red[700],
                      size: 100.0,
                    ),
                    label:Text('',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                  ),
                  SizedBox(height:20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style:TextStyle(
                          fontSize:28.0,
                          letterSpacing: 2.0,
                          color: Colors.red[700],
                        )
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),

      ),
    );
  }
}
