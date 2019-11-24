import 'package:app_movies/data/api_provider.dart';
import 'package:app_movies/model/popular_movies.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() => runApp(MoviesApp());

class MoviesApp extends StatefulWidget {
  @override
  _MoviesAppState createState() => _MoviesAppState();
}



class _MoviesAppState extends State<MoviesApp> {
@override
Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Movies App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: Home(),
      );
    
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiProvider apiProvider = ApiProvider();
  Future<PopularMovies> popularMovies;
    String imageBaseUrl = 'http://image.tmdb.org/t/p/w500';
    String poster;
    String title;
    String date;
    String voteAverage;
  
  
  @override
  void initState(){
    popularMovies = apiProvider.getPopularMovies();
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies App'),
        ),
        body: FutureBuilder(
          future: popularMovies,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if (snapshot.hasData){
              print("Has Data: {$snapshot.hasData}");
              return ListView.builder(
                itemCount: snapshot.data.results.length,
                itemBuilder: (BuildContext context, int index){
                  return movieItem(
                  poster: '$imageBaseUrl${snapshot.data.results[index].posterPath}',
                  title: '${snapshot.data.results[index].title}',
                  date: '${snapshot.data.results[index].releaseDate}',
                  voteAverage : '${snapshot.data.results[index].voteAverage}',
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context)=> MovieDetail(
                          movie: snapshot.data.results[index],
                        )
                      )               
                    );
                  }
                  
                 );
                },
              );
             
            } else if (snapshot.hasError){
              print("Has Error: {$snapshot.hasError}");
              return Text("Error");
            }else{
              print("Lagi loading");
              return CircularProgressIndicator();
            }
          },
        ),
    );
  }

  Widget movieItem({
    String poster,
    String title,
    String date,
    String voteAverage,
    Function onTap}) {
    return InkWell(
          onTap: onTap,
          child: Container(
          margin: EdgeInsets.all(10),
          child :Card(
          child: Container(
            child: Row(
            children: <Widget>[
              Container(
                color: Colors.indigo,
                width: 120,
                child: CachedNetworkImage(
                  imageUrl: poster,
              ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 20
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                  Text(title, 
                       style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.w600 
                       ) ,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                    height: 10,
                  ),
                  Icon(Icons.calendar_today, size: 12,),
                  Text(date),
                    ]        
                  ),
                  SizedBox(
                    height: 10,
                  ),
                   Row(
                    children: <Widget>[
                      SizedBox(
                    height: 10,
                  ),
                  Icon(Icons.star, size: 12,),
                  Text(voteAverage),
                    ]        
                  ),
                  
                  SizedBox(
                    height: 10,
                  ),
                ],
                ),
              )
            ],
          ),
          ),
          )
        ),
    );
  }
}

class MovieDetail extends StatelessWidget{
  final Results movie;

  const MovieDetail({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Container(
        child:  Text(movie.overview),
      ),
    );
  }

}