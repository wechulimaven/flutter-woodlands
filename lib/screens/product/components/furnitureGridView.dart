import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:woodHw/helper/constant.dart';
import 'package:woodHw/models/product.dart';


class FurnitureGridItem extends StatelessWidget {
  final Product item;
  final EdgeInsets margin;

  const FurnitureGridItem({
    Key key,
    @required this.item,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin == null ? EdgeInsets.zero : margin,
      decoration: BoxDecoration(
        color: Colors.pink[200],
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset.zero,
            blurRadius: 15.0,
          )
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 37),
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage(item.image),
                    ),
                  ),
                ),
                // if (item.discountPercent != null)
                //   Positioned(
                //     top: 16,
                //     right: 16,
                //     child: Container(
                //       width: 40,
                //       height: 40,
                //       alignment: Alignment.center,
                //       decoration: BoxDecoration(
                //         color: primaryColor,
                //         shape: BoxShape.circle,
                //       ),
                //       child: Text(
                //         '${item.discountPercent}%',
                //         textAlign: TextAlign.center,
                //         style: TextStyle(color: colorWhite),
                //       ),
                //     ),
                //   ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
                Wrap(
                  spacing: 3,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '${Product.format(item.price)}',
                      style: TextStyle(
                        fontSize: 18,
                        color:Colors.black,
                        height: 1.5,
                      ),
                    ),
                    // if (item.discountPercent != null)
                    //   Text(
                    //     '${Product.format(item.originalPrice)}',
                    //     style: TextStyle(
                    //       fontSize: 12,
                    //       height: 1.5,
                    //       decoration: TextDecoration.lineThrough,
                    //       color: Colors.black38,
                    //     ),
                    //   )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      RatingBar(
                        initialRating: item.rating,
                        minRating: 1,
                        itemSize: 12,
                        ignoreGestures: true,
                        allowHalfRating: true,
                        itemCount: 5,
                        unratedColor: Colors.amber[100],
                        // itemBuilder: (context, _) => Icon(
                        //   Icons.star,
                        //   size: 2,
                        //   color: Colors.amber,
                        // ),
                        onRatingUpdate: (rating) => print(rating),
                        ratingWidget: null,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '${item.rating}',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}