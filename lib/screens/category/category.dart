import 'package:flutter/material.dart';

import 'package:woodHw/models/category.dart';
import 'package:woodHw/screens/product/products.dart';

class CategoryListPage extends StatefulWidget {
  // final Category category;

  // CategoryListPage({this.category});

  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  List<Category> categories = [
    Category(
        begin: Color(0xffAF2D68),
        end: Color(0xff632376),
        category: 'Fitting Materials',
        image: 'assets/jeans_5.png',
        rating: 5,
        type: 'Roofing'),
    Category(
        begin: Color(0xff00E9DA),
        end: Color(0xff5189EA),
        category: 'Blocks',
        image: 'assets/jeans_5.png',
        rating: 5,
        type: 'Housing'),
    Category(
        begin: Color(0xffFCE183),
        end: Color(0xffF68D7F),
        category: 'Roofing ',
        image: 'assets/jeans_5.png',
        rating: 5,
        type: 'Construction'),
    Category(
        begin: Color(0xffF749A2),
        end: Color(0xffFF7375),
        category: 'Cealing Boards',
        image: 'assets/jeans_5.png',
        rating: 5,
        type: 'wood'),
    Category(
        begin: Color(0xff00E9DA),
        end: Color(0xff5189EA),
        category: 'Glasses',
        image: 'assets/jeans_5.png',
        rating: 5,
        type: 'Housing'),
    Category(
        begin: Color(0xffAF2D68),
        end: Color(0xff632376),
        category: 'Doors',
        image: 'assets/jeans_5.png',
        rating: 5,
        type: 'Roofing'),
    Category(
        begin: Color(0xff36E892),
        end: Color(0xff33B2B9),
        category: 'Frames',
        image: 'assets/jeans_5.png',
        rating: 5,
        type: 'Painting'),
    Category(
        begin: Color(0xffF123C4),
        end: Color(0xff668CEA),
        category: 'Building Materials',
        image: 'assets/jeans_5.png',
        rating: 5,
        type: 'Building'),
    
    Category(
        begin: Color(0xff36E892),
        end: Color(0xff33B2B9),
        category: 'Fitting Materials',
        image: 'assets/jeans_5.png',
        rating: 5,
        type: 'Painting'),
  ];

  @override
  Widget build(BuildContext context) {
    // var cat = categories.asMap().entries.map((f) {;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: categories,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage('assets/woodlandlogo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.black,
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: Icon(Icons.sort_outlined),
                          iconSize: 25.0,
                          color: Colors.black,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //         Text(
                    // // ignore: todo
                    // // TODO: implement category name
                    // 'Roofing Material',
                    //           // categories.category,
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 35.0,
                    //             fontWeight: FontWeight.w600,
                    //             letterSpacing: 1.2,
                    //           ),
                    //         ),
                    // Row(
                    //   children: <Widget>[
                    //     Icon(
                    //       Icons.location_disabled_sharp,
                    //       size: 15.0,
                    //       color: Colors.white70,
                    //     ),
                    //     SizedBox(width: 5.0),
                    //     Text(
                    //       widget.category.,
                    //       style: TextStyle(
                    //         color: Colors.white70,
                    //         fontSize: 20.0,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 25.0,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                Category category = categories[index];
                return Stack(
                  children: <Widget>[
                    InkWell(
                      onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => CategoryScreen())),
                                          child: Container(
                        margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                        height: 170.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [category.begin, category.end],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 120.0,
                                    child: Text(
                                      category.category,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  // Column(
                                  //   children: <Widget>[
                                  //     Text(
                                  //       '\$${category.}',
                                  //       style: TextStyle(
                                  //         fontSize: 22.0,
                                  //         fontWeight: FontWeight.w600,
                                  //       ),
                                  //     ),
                                  //     Text(
                                  //       'per pax',
                                  //       style: TextStyle(
                                  //         color: Colors.grey,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                              Text(
                                category.type,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              _buildRatingStars(category.rating),
                              SizedBox(height: 10.0),
                              //   Row(
                              //     children: <Widget>[
                              //       Container(
                              //         padding: EdgeInsets.all(5.0),
                              //         width: 70.0,
                              //         decoration: BoxDecoration(
                              //           color: Theme.of(context).accentColor,
                              //           borderRadius: BorderRadius.circular(10.0),
                              //         ),
                              //         alignment: Alignment.center,
                              //         child: Text(
                              //           category.startTimes[0],
                              //         ),
                              //       ),
                              //       SizedBox(width: 10.0),
                              //       Container(
                              //         padding: EdgeInsets.all(5.0),
                              //         width: 70.0,
                              //         decoration: BoxDecoration(
                              //           color: Theme.of(context).accentColor,
                              //           borderRadius: BorderRadius.circular(10.0),
                              //         ),
                              //         alignment: Alignment.center,
                              //         child: Text(
                              //           category.startTimes[1],
                              //         ),
                              //       ),
                              //     ],
                              //   )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.0,
                      top: 15.0,
                      bottom: 15.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          width: 110.0,
                          image: AssetImage(
                            category.image,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
