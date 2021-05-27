import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:woodHw/helper/constant.dart';
import 'package:woodHw/models/carousel.dart';


class CarouselWidget extends StatelessWidget {
  
  List<Carousel> carouselList = [
    Carousel(image: "assets/furniture/05cbcw9cp4o0rqbcnvb2ofz-1fit-limsize-1280x720v-1584707541-1-35bb5677454115b1b29b0a0e7290f5da_600x400.jpg"),
    Carousel(image: "assets/head.jpg"),
    Carousel(image: "assets/crshoe.jpg"),
    Carousel(
        image:
            "assets/50304057-colourful-shopping-vector-flat-banner-for-your-business-web-sites-etc-quality-design-illustrations-e.jpg"),
    Carousel(
        image:
            "assets/1568133411_956194_1568138794_noticia_normal.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.white,
      child: Swiper(
        itemCount: carouselList.length,
        autoplay: true,
        pagination: SwiperPagination(),
        itemBuilder: (context, index) {
          var carousel = carouselList[index];
          return Container(
            // Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        image: DecorationImage(
                            image: AssetImage(carousel.image),
                            fit: BoxFit.cover)),
                    height: 400.0,
                    width: 300.0,
                  // )
            // margin: EdgeInsets.only(left: 10.0),
            //   padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            // // margin: EdgeInsets.only(right: 15),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(25),
            //   // color: Colors.amberAccent,
            //   image: DecorationImage(
            //     image: AssetImage(carousel.image),
            //     fit: BoxFit.fill,
            //   ),
            // ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    height: 30.0,
                    color: kBlackAccent.withOpacity(.5),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
