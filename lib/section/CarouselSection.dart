import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intro_flutter/models/CarouselImage.dart';
import 'package:intro_flutter/models/Constantes.dart';
import 'package:intro_flutter/widgets/TitleText.dart';

class CarouselSection extends StatefulWidget {

  int depthIndex;
  CarouselSection({required this.depthIndex});

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
 final CarouselController btnCarousel = CarouselController(); // création des bouton du carousel
  @override
  Widget build(BuildContext context) {
    int index = widget.depthIndex; //définition de l'index de départ

    final items = cimages.map((image) => card(image)).toList(); //récupèration de l'image

    CarouselOptions options = CarouselOptions(
      autoPlay: true,
      aspectRatio: 16/9,
      enlargeCenterPage: true,
      onPageChanged: (newIndex, reason){
        setState(() {
          index = newIndex;
        });
      }
    );

    return Column(
      children: [
        Row( //titre de section
          children: [
            TitleText(string: "Le carousel des toutous"),
            Expanded(child: Container())
          ],
        ),
        CarouselSlider(
            items: items,
            options: options,
            carouselController: btnCarousel,
        ),
        Padding(
            padding: EdgeInsets.all(20),
            child: Card(
              color: appBarColor,
              elevation: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...Iterable<int>.generate(cimages.length).map(
                          (int pageIndex)=> Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: (){
                                  btnCarousel.animateToPage(pageIndex);
                                },
                                child: Text(cimages[pageIndex].name),
                              ),
                              Visibility(
                                  maintainAnimation: true,
                                  maintainState: true,
                                  visible: (index == pageIndex),
                                  child: AnimatedOpacity(
                                   opacity: 1,
                                   duration: Duration(milliseconds: 750),
                                   child: Container(
                                     height: 5,
                                     width: 50,
                                     decoration: BoxDecoration(
                                       color: Colors.black12,
                                       borderRadius: BorderRadius.circular(2.5)
                                     ),
                                   ), 
                                  )
                              )
                            ],
                          )
                  )
                ],
              ),
            )
        )
      ],
    );
  }

  Widget card(CarouselImage image){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.asset(image.path, fit: BoxFit.cover,).image
        )
      ),
      child: Center(
        child: Text(
          image.name,
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
    );
  }
}
