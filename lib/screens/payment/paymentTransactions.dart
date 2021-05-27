import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:woodHw/helper/constant.dart';
import 'package:woodHw/models/card.dart';
import 'package:woodHw/models/operational.dart';
import 'package:woodHw/models/transaction.dart';
import 'package:woodHw/screens/orderSucess/orderSucsess.dart';

import '../../app_properties.dart';
import 'addCard.dart';


class CardScreen extends StatefulWidget {
  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  // Current selected
  int current = 0;

  // Handle Indicator
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    Widget finishButton = InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => OrderSuccessScreen())),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            gradient: mainButton,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text("Place Order",
              style: const TextStyle(
                  color: const Color(0xfffefefe),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Stack(
                  children: [Container(
            margin: EdgeInsets.only(top: 8),
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                // Custom AppBar
                Container(
                  margin: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset('assets/icons/back.svg')),
                      Container(
                        height: 59,
                        width: 59,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/icons/profile.png'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                // Card Section
                SizedBox(
                  height: 15,
                ),

                Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Your Cards',
                        style: TextStyle(
                            fontFamily: "Gotik",
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: kBlackColor),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () => 
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddCard(),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Add Card',
                              style: TextStyle(
                                  fontFamily: 'Gotik',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: kBlackColor)),
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  height: 199,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 16, right: 6),
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 199,
                        width: 344,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: Color(cards[index].cardBackground),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: SvgPicture.asset(
                                  cards[index].cardElementTop),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: SvgPicture.asset(
                                  cards[index].cardElementBottom),
                            ),
                            Positioned(
                              left: 29,
                              top: 48,
                              child: Text(
                                'CARD NUMBER',
                                style: TextStyle(
                                    fontFamily: "Gotik",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: kWhiteColor),
                              ),
                            ),
                            Positioned(
                              left: 29,
                              top: 65,
                              child: Text(
                                cards[index].cardNumber,
                                style: TextStyle(
                                    fontFamily: "Gotik",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: kWhiteColor),
                              ),
                            ),
                            Positioned(
                              right: 21,
                              top: 35,
                              child: Image.asset(
                                cards[index].cardType,
                                width: 27,
                                height: 27,
                              ),
                            ),
                            Positioned(
                              left: 29,
                              bottom: 45,
                              child: Text(
                                'CARD HOLDERNAME',
                                style: TextStyle(
                                    fontFamily: "Gotik",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: kWhiteColor),
                              ),
                            ),
                            Positioned(
                              left: 29,
                              bottom: 21,
                              child: Text(
                                cards[index].user,
                                style: TextStyle(
                                    fontFamily: "Gotik",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: kWhiteColor),
                              ),
                            ),
                            Positioned(
                              left: 202,
                              bottom: 45,
                              child: Text(
                                'EXPIRY DATE',
                                style: TextStyle(
                                    fontFamily: "Gotik",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: kWhiteColor),
                              ),
                            ),
                            Positioned(
                              left: 202,
                              bottom: 21,
                              child: Text(
                                cards[index].cardExpired,
                                style: TextStyle(
                                    fontFamily: "Gotik",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: kWhiteColor),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Operation Section
                Padding(
                  padding:
                      EdgeInsets.only(left: 16, bottom: 13, top: 29, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Choose Mode Of Payments',
                        style: TextStyle(
                            fontFamily: "Gotik",
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: kBlackColor),
                      ),
                      Row(
                        children: map<Widget>(
                          datas,
                          (index, selected) {
                            return Container(
                              alignment: Alignment.centerLeft,
                              height: 9,
                              width: 9,
                              margin: EdgeInsets.only(right: 6),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: current == index
                                      ? kBlueColor
                                      : kTwentyBlueColor),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  height: 123,
                  child: ListView.builder(
                    itemCount: datas.length,
                    padding: EdgeInsets.only(left: 16),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: OperationCard(
                            operation: datas[index].name,
                            selectedIcon: datas[index].selectedIcon,
                            unselectedIcon: datas[index].unselectedIcon,
                            isSelected: current == index,
                            context: this),
                      );
                    },
                  ),
                ),

                // Transaction Section
                Padding(
                  padding:
                      EdgeInsets.only(left: 16, bottom: 13, top: 29, right: 10),
                  child: Text(
                    'Transaction Histories',
                    style: TextStyle(
                        fontFamily: "Gotik",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: kBlackColor),
                  ),
                ),
                ListView.builder(
                  itemCount: transactions.length,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 76,
                      margin: EdgeInsets.only(bottom: 13),
                      padding: EdgeInsets.only(
                          left: 24, top: 12, bottom: 12, right: 22),
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: kTenBlackColor,
                            blurRadius: 10,
                            spreadRadius: 5,
                            offset: Offset(8.0, 8.0),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                height: 57,
                                width: 57,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        transactions[index].photo),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    transactions[index].name,
                                    style: TextStyle(
                                        fontFamily: "Gotik",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: kBlackColor),
                                  ),
                                  Text(
                                    transactions[index].date,
                                    style: TextStyle(
                                        fontFamily: "Gotik",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: kGreyColor),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                transactions[index].amount,
                                style: TextStyle(
                                    fontFamily: "Gotik",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: kBlueColor),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(
                  top: 8.0, bottom: MediaQuery.of(context).padding.bottom != 20 ? 20 : MediaQuery.of(context).padding.bottom),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                    Color.fromRGBO(255, 255, 255, 0),
                    Color.fromRGBO(253, 192, 84, 0.5),
                    Color.fromRGBO(253, 192, 84, 1),
                  ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter)),
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: Center(
                  child: finishButton),
            ),
          ),]
        ),
      ),
    );
  }
}

class OperationCard extends StatefulWidget {
  final String operation;
  final String selectedIcon;
  final String unselectedIcon;
  final bool isSelected;
  _CardScreenState context;

  OperationCard(
      {this.operation,
      this.selectedIcon,
      this.unselectedIcon,
      this.isSelected,
      this.context});

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 123,
      height: 123,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: kTenBlackColor,
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(8.0, 8.0),
            )
          ],
          borderRadius: BorderRadius.circular(15),
          color: widget.isSelected ? kBlueColor : kWhiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
              widget.isSelected ? widget.selectedIcon : widget.unselectedIcon),
          SizedBox(
            height: 9,
          ),
          Text(
            widget.operation,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Gotik",
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: widget.isSelected ? kWhiteColor : kBlueColor),
          )
        ],
      ),
    );
  }
}