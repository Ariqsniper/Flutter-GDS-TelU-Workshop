import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Build App',
      theme: ThemeData(
          primarySwatch: Colors.amber,
      ),
      home: Home(),
    );
  }
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold (
      appBar: AppBar(
        title: Text('Title'),
        centerTitle: true,
        actions: <Widget>[
          Icon(Icons.add_a_photo),
        ],
      ),
      body: Container(
        color: Colors.red,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
              color : Colors.white,
              height: 40,
              width: 40,
              child : Image.network('https://upload.wikimedia.org/wikipedia/commons/0/03/Logo_Telkom_University_potrait.png'),
              ),
               SizedBox(
                width: 20, 
                ),
              Expanded(
               child :  Text('Telkom University')
              ),
              Icon(Icons.more_vert),
              SizedBox(
                width: 20, 
                ),
            ],
          ),
          Container(
            child: Image.network('https://www.ayobandung.com/images-bandung/post/articles/2019/08/13/60534/gedung_tel_u_(800_x_531).jpg'),
          ),
          Row(
            children: <Widget>[
              Icon(Icons.favorite_border),
              Icon(Icons.chat_bubble_outline),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.send)
                )
              ),
              Icon(Icons.save),
              SizedBox(
                width: 10,
                ),

            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: Colors.grey,
            child: Text('Liked By 100'),
          ),
          Container(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'telkomuniversity',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ]
              ),
              TextSpan(
                text: 'Caption',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                )
              )
              ),
          )
        ],
        )
      )
    );
  }
}