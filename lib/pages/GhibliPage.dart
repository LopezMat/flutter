import 'package:flutter/material.dart';
import 'package:intro_flutter/helper/HttpHelper.dart';
import 'package:intro_flutter/models/Constantes.dart';
import 'package:intro_flutter/models/MakeItResponsive.dart';
import 'package:intro_flutter/section/CarouselSection.dart';
import 'package:intro_flutter/section/ContactSection.dart';
import 'package:intro_flutter/section/EventSection.dart';
import 'package:intro_flutter/section/TopStack.dart';
import 'package:intro_flutter/widgets/PhoneBar.dart';
import 'package:intro_flutter/widgets/WebBar.dart';

import '../models/Movie.dart';
import '../widgets/DrawerSmall.dart';

class GhibliPage extends StatefulWidget {
  const GhibliPage({super.key});

  @override
  State<GhibliPage> createState() => GhibliPageState();
}

class GhibliPageState extends State<GhibliPage> {

  int moviesCount = 0;
  List<Movie> movies = [];
  HttpHelper helper = HttpHelper();

  @override
  void initState() {

    super.initState();
    initialize();
  }

  void initialize() async {
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
      drawer: DrawerSmall(), //composant de menu pour tel
      body: ListView.builder(
          itemBuilder: (BuildContext context, int pos){
            final movie = movies[pos];
            return Card(
              color: appBarColor,
              elevation: 2,
              child: ListTile(
                title: Text(movie.title),
                subtitle: Text(movie.description),
                leading: Image.network(movie.image),
              )
           );
      })
    );
  }
}
