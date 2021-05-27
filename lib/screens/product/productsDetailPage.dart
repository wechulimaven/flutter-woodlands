import 'package:flutter/material.dart';
import 'package:woodHw/helper/constant.dart';
import 'package:woodHw/models/product.dart';
import 'package:woodHw/screens/cart/cartScreen.dart';

import '../../app_properties.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => new _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF696D77), Color(0xFF292C36)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.clamp)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: screenAwareSize(20, context),
                ),
                onPressed: () {},
              ),
              title: Text(widget.product.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenAwareSize(18, context),
                      fontFamily: "NunitoSans")),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    size: screenAwareSize(20, context),
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ProductScreenTopPart(product:widget.product),
                  ProductScreenBottomPart(products:widget.product)
                ],
              ),
            )));
  }
}

class ProductScreenTopPart extends StatefulWidget {
  final Product product;

  const ProductScreenTopPart({Key key, this.product}) : super(key: key);

  @override
  _ProductScreenTopPartState createState() => new _ProductScreenTopPartState();
}

class _ProductScreenTopPartState extends State<ProductScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: screenAwareSize(245, context),
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Image.asset(widget.product.image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 35),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: screenAwareSize(50, context),
                    height: screenAwareSize(50, context),
                    decoration: BoxDecoration(
                        color: Colors.black26, shape: BoxShape.circle),
                    child: Image.asset("assets/360.png"),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            left: screenAwareSize(18, context),
            bottom: screenAwareSize(15, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Rating",
                    style: TextStyle(
                        color: Color(0xFF949598),
                        fontSize: screenAwareSize(10, context),
                        fontFamily: "Montserrat")),
                SizedBox(
                  height: screenAwareSize(8, context),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.star, color: Color(0xFFFFE600)),
                    SizedBox(
                      width: screenAwareSize(5, context),
                    ),
                    Text('${widget.product.rating}',
                        style: TextStyle(color: Color(0xFFFFE600))),
                    SizedBox(
                      width: screenAwareSize(5, context),
                    ),
                    Text("(250 People)",
                        style: TextStyle(color: Colors.white, fontSize: 14))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductScreenBottomPart extends StatefulWidget {
  final Product products;

  const ProductScreenBottomPart({Key key, this.products}) : super(key: key);

  @override
  _ProductScreenBottomPartState createState() =>
      new _ProductScreenBottomPartState();
}

class _ProductScreenBottomPartState extends State<ProductScreenBottomPart> {
  bool isExpanded = false;
  int currentSizeIndex = 0;
  int currentColorIndex = 0;
  int _counter = 0;

  void _increase() {
    setState(() {
      _counter++;
    });
  }

  void _decrease() {
    setState(() {
      _counter--;
    });
  }

  void _expand() {
    setState(() {
      isExpanded ? isExpanded = false : isExpanded = true;
    });
  }

  List<Widget> colorSelector() {
    List<Widget> colorItemList = new List();

    for (var i = 0; i < colors.length; i++) {
      colorItemList
          .add(colorItem(colors[i], i == currentColorIndex, context, () {
        setState(() {
          currentColorIndex = i;
        });
      }));
    }

    return colorItemList;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(18, context)),
            child: Text(
              "Product Description",
              style: TextStyle(
                  color: Color(0xFF949598),
                  fontSize: screenAwareSize(10, context),
                  fontFamily: "Montserrat"),
            ),
          ),
          SizedBox(
            height: screenAwareSize(8, context),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(26, context),
                right: screenAwareSize(18, context)),
            child: AnimatedCrossFade(
              firstChild: Text(
                desc,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenAwareSize(10, context),
                    fontFamily: "Montserrat"),
              ),
              secondChild: Text(
                desc,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenAwareSize(10, context),
                    fontFamily: "Montserrat"),
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: kThemeAnimationDuration,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(26, context),
                right: screenAwareSize(18, context)),
            child: GestureDetector(
                onTap: _expand,
                child: Text(
                  isExpanded ? "less" : "more..",
                  style: TextStyle(
                      color: Color(0xFFFB382F), fontWeight: FontWeight.w700),
                )),
          ),
          SizedBox(
            height: screenAwareSize(12, context),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(15, context),
                right: screenAwareSize(75, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Size",
                    style: TextStyle(
                        color: Color(0xFF949598),
                        fontSize: screenAwareSize(10, context),
                        fontFamily: "Montserrat")),
                Text("Quantity",
                    style: TextStyle(
                        color: Color(0xFF949598),
                        fontSize: screenAwareSize(10, context),
                        fontFamily: "Montserrat"))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(20, context),
                right: screenAwareSize(10, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: screenAwareSize(38, context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: sizeNumlist.map((item) {
                      var index = sizeNumlist.indexOf(item);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentSizeIndex = index;
                          });
                        },
                        child:
                            sizeItem(item, index == currentSizeIndex, context),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    width: screenAwareSize(82, context),
                    height: screenAwareSize(30, context),
                    decoration: BoxDecoration(
                        color: Color(0xFF525663),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: GestureDetector(
                            onTap: _decrease,
                            child: Container(
                              height: double.infinity,
                              child: Center(
                                child: Text("-",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: "NunitoSans")),
                              ),
                            ),
                          ),
                        ),
                        divider(),
                        Flexible(
                          flex: 3,
                          child: Container(
                            height: double.infinity,
                            child: Center(
                              child: Text(_counter.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: "NunitoSans")),
                            ),
                          ),
                        ),
                        divider(),
                        Flexible(
                          flex: 3,
                          child: GestureDetector(
                            onTap: _increase,
                            child: Container(
                              height: double.infinity,
                              child: Center(
                                child: Text("+",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: "NunitoSans")),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(18, context)),
            child: Text("Select Color",
                style: TextStyle(
                    color: Color(0xFF949598),
                    fontSize: screenAwareSize(10, context),
                    fontFamily: "Montserrat")),
          ),
          SizedBox(
            height: screenAwareSize(8, context),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: screenAwareSize(20, context)),
            height: screenAwareSize(34, context),
            child: Row(
              children: colorSelector(),
            ),
          ),
          SizedBox(
            height: screenAwareSize(8, context),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(20, context)),
            child: Text("Price",
                style: TextStyle(
                    color: Color(0xFF949598), fontFamily: "Montserrat")),
          ),
          Container(
            width: double.infinity,
            height: screenAwareSize(120, context),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: screenAwareSize(22, context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(left: screenAwareSize(18, context)),
                        child: Row(
                          children: <Widget>[
                            Text("ksh",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenAwareSize(26, context),
                                    fontFamily: "Montserrat")),
                            SizedBox(width: screenAwareSize(2, context)),
                            Text("${widget.products.price}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenAwareSize(35, context),
                                    fontFamily: "Montserrat"))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenAwareSize(10, context),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          color: Color(0xFFFB382F),
                          padding: EdgeInsets.symmetric(
                            vertical: screenAwareSize(14, context),
                          ),
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => CartScreen())),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: screenAwareSize(35, context)),
                              child: Center(
                                child: Text("Add To Cart",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenAwareSize(15, context))),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // Positioned(
                //   right: -40,
                //   bottom: -60,
                //   child: Image.asset("assets/cart.png",
                //       width: screenAwareSize(190, context),
                //       height: screenAwareSize(155, context),
                //       fit: BoxFit.cover),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget sizeItem(String size, bool isSelected, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 12),
    child: Container(
      width: screenAwareSize(30, context),
      height: screenAwareSize(30, context),
      decoration: BoxDecoration(
          color: isSelected ? Color(0xFFFC3930) : Color(0xFF525663),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color:
                    isSelected ? Colors.black.withOpacity(.5) : Colors.black12,
                offset: Offset(0, 10),
                blurRadius: 10)
          ]),
      child: Center(
        child: Text(size,
            style: TextStyle(color: Colors.white, fontFamily: "NunitoSans")),
      ),
    ),
  );
}

Widget colorItem(
    Color color, bool isSelected, BuildContext context, VoidCallback _ontab) {
  return GestureDetector(
    onTap: _ontab,
    child: Padding(
      padding: EdgeInsets.only(left: screenAwareSize(10, context)),
      child: Container(
        width: screenAwareSize(30, context),
        height: screenAwareSize(30, context),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                        color: Colors.black.withOpacity(.8),
                        blurRadius: 10,
                        offset: Offset(0, 10))
                  ]
                : []),
        child: ClipPath(
          clipper: MClipper(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: color,
          ),
        ),
      ),
    ),
  );
}

class MClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

Widget divider() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
    child: Container(
      width: 0.8,
      color: Colors.black,
    ),
  );
}
