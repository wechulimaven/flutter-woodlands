import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:woodHw/helper/constant.dart';

import '../filterBottomsheet.dart';

class HeaderSliver implements SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;

  HeaderSliver({
    this.minExtent,
    @required this.maxExtent,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0.0, 10.0),
            blurRadius: 10.0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    child: SvgPicture.asset('assets/icons/back.svg'),
                    onTap: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
                Text(
                  'Woodland products',
                  style: TextStyle(fontSize: 18.0),
                ),
                Container(
                  width: 60.0,
                  alignment: Alignment.centerRight,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10.0,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/search.svg',
                        height: 18,
                      ),
                      // Cart(
                      //   numberOfItemsInCart: Fake.numberOfItemsInCart,
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ActionButton(
                  title: 'Filter',
                  iconPath: 'assets/icons/controls.svg',
                  onTap: () {
                    _settingModalBottomSheet(context);
                  },
                  active: true,
                ),
                VerticalSeparator(),
                ActionButton(
                  title: 'Sort',
                  iconPath: 'assets/icons/sort.svg',
                  onTap: () {},
                ),
                VerticalSeparator(),
                ActionButton(
                  title: 'List',
                  iconPath: 'assets/icons/list.svg',
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration =>
      null;

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

  @override
  TickerProvider get vsync => null;
}
void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (BuildContext bc) {
        return FilterModalBottomSheet();
      });
}

