import 'package:flutter/material.dart';
import 'package:woodHw/models/category.dart';
import 'package:woodHw/screens/product/products.dart';

import 'category_card.dart';
import 'featured.dart';
import 'recommended_list.dart';

class TabView extends StatelessWidget {
  List<Category> categories = [
    Category(
      begin:Color(0xffFCE183),
      end:Color(0xffF68D7F),
      category:'Roofing ',
      image:'assets/jeans_5.png',
      rating: 5,
      type: 'Construction'
    ),
    Category(
      begin:Color(0xffF749A2),
      end:Color(0xffFF7375),
      category:'Cealing Boards',
      image:'assets/jeans_5.png',
      rating: 5,
      type: 'wood'
    ),
    Category(
      begin: Color(0xff00E9DA),
      end: Color(0xff5189EA),
      category:'Glasses',
      image:'assets/jeans_5.png',
      rating: 5,
      type: 'Housing'
    ),
    Category(
      begin: Color(0xffAF2D68),
      end: Color(0xff632376),
      category: 'Doors',
      image: 'assets/jeans_5.png',
      rating: 5,
      type: 'Roofing'
    ),
    Category(
      begin:Color(0xff36E892),
      end:Color(0xff33B2B9),
      category:'Frames',
      image:'assets/jeans_5.png',
      rating: 5,
      type: 'Painting'
    ),
    Category(
      begin:Color(0xffF123C4),
      end:Color(0xff668CEA),
      category:'Building Materials',
      image:'assets/jeans_5.png',
      rating: 5,
      type: 'Building'
    ),
    Category(
      begin: Color(0xffAF2D68),
      end: Color(0xff632376),
      category: 'Fitting Materials',
      image: 'assets/jeans_5.png',
      rating: 5,
      type: 'Roofing'
    ),
    Category(
      begin: Color(0xff00E9DA),
      end: Color(0xff5189EA),
      category:'Blocks',
      image:'assets/jeans_5.png',
      rating: 5,
      type: 'Housing'
    ),
    Category(
      begin:Color(0xff36E892),
      end:Color(0xff33B2B9),
      category:'Fitting Materials',
      image:'assets/jeans_5.png',
      rating: 5,
      type: 'Painting'
    ),
  ];

  final TabController tabController;

  TabView({Key key, this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height / 9);
    return TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(8.0),
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (_, index) => InkWell(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => CategoryScreen())),
                              child: CategoryCard(
                                category: categories[index],
                              ),
                            ))),
                SizedBox(
                  height: 16.0,
                ),
                Flexible(child: FeaturedSection('Featured Products')),
              ],
            ),
          ),
          // Column(children: <Widget>[
          //   SizedBox(
          //     height: 16.0,
          //   ),
          //   Flexible(child: RecommendedList())
          // ]),
        ]);
  }
}
