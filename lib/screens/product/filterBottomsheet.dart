import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:woodHw/helper/constant.dart';


class FilterModalBottomSheet extends StatelessWidget {
  void close(context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(28.0),
        child: Wrap(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    child: Icon(Icons.close),
                    onTap: () {
                      close(context);
                    },
                  ),
                ),
                Text(
                  'Filter',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  width: 100,
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Text(
                      'Reset',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {},
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Price Range',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 20),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Container(
                    width: ((size.width / 2) - 55),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: Colors.black12,
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Minimum',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    width: 15,
                    height: 1,
                    color: Colors.black38,
                  ),
                  Container(
                    width: ((size.width / 2) - 55),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: Colors.black12,
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Maximum',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Item Filter',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              child: FilterList(onSelect: (selected) => print(selected)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Item Color',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ColorList(
              [
                Colors.white,
                Colors.black87,
                Colors.blue,
                Colors.cyan,
                Colors.red,
              ],
              onSelect: (color) => print(color),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                textColor: Colors.white,
                color: primaryColor,
                padding: EdgeInsets.all(20),
                child: Text('Apply Filter', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  close(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


class ColorList extends StatefulWidget {
  final List<Color> colors;
  final Function(Color) onSelect;

  const ColorList(
    this.colors, {
    Key key,
    this.onSelect,
  }) : super(key: key);

  @override
  _ColorListState createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  Color selected;
  select(color) {
    if (selected == color)
      selected = null;
    else
      selected = color;

    if (widget.onSelect != null) widget.onSelect(selected);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 20,
          children: widget.colors.map((color) {
            return InkWell(
              onTap: () {
                select(color);
              },
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    border: selected == color
                        ? Border.all(width: 3, color: primaryColor)
                        : null,
                    color: color,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset.zero,
                        blurRadius: 15,
                      )
                    ]),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}


class FilterList extends StatefulWidget {
  final Function(List<String>) onSelect;

  const FilterList({Key key, this.onSelect}) : super(key: key);

  @override
  _FilterListState createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  List<String> selected = [];
  List<dynamic> options = [
    {
      'icon': SvgPicture.asset("assets/icons/tag.svg"),
      'title': 'Discount',
    },
    {
      'icon': SvgPicture.asset("assets/icons/delivery.svg"),
      'title': 'Free Delivery'
    },
    {
      'icon': SvgPicture.asset("assets/icons/card.svg"),
      'title': 'Installment Plan'
    },
  ];

  toggle(title) {
    if (selected.contains(title))
      selected.remove(title);
    else
      selected.add(title);

    setState(() {
      widget.onSelect(selected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.map((o) {
        return FilterListItem(
          icon: o['icon'],
          title: o['title'],
          selected: this.selected.contains(o['title']),
          onTap: () {
            toggle(o['title']);
          },
        );
      }).toList(),
    );
  }
}


class FilterListItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final bool selected;
  final Function() onTap;

  const FilterListItem({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.onTap,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black12,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            icon,
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            if (selected)
              Icon(
                Icons.check,
                color: primaryColor,
              )
          ],
        ),
      ),
    );
  }
}
