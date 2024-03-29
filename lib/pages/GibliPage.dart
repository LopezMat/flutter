import 'package:flutter/material.dart';
import 'package:good_meal/helper/HttpHelper.dart';
import 'package:good_meal/models/Constantes.dart';
import 'package:good_meal/models/MakeItResponsive.dart';
import 'package:good_meal/models/Movie.dart';
import 'package:good_meal/sections/CarouselSection.dart';
import 'package:good_meal/sections/ContactSection.dart';
import 'package:good_meal/sections/EventSection.dart';
import 'package:good_meal/sections/TopStack.dart';
import 'package:good_meal/widgets/PhoneBar.dart';
import 'package:good_meal/widgets/WebBar.dart';

import '../widgets/DrawerSmall.dart';

class GibliPage extends StatefulWidget {
  const GibliPage({super.key});

  @override
  State<GibliPage> createState() => _GibliPageState();
}

class _GibliPageState extends State<GibliPage> {

  int moviesCount = 0;
  List<Movie> movies = [];
  HttpHelper helper = HttpHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  Future initialize() async {
    movies = await helper.getMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSize screenSize = MakeItResponsive().getScreenSize(context);

    return Scaffold(
      appBar: ( screenSize == ScreenSize.small ) ? PhoneBar() : WebBar(size: size),
      drawer: DrawerSmall(), // composant de menu pour tel
      body: ListView.builder(
        itemCount: moviesCount,
          itemBuilder: (BuildContext context, int pos){
            final movie = this.movies[pos];
            return Card(
              color: appBarColor,
              elevation: 2,
              child: ListTile(
                title: Text(movie.title),
                subtitle: Text(movie.description),
                leading: Image.network(movie.image),
              ),
            );
          }
      )
    );
  }
}
