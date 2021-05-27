import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../sizeConfig.dart';

enum MenuState { home, favourite, message, profile }

const kBackgroundGradientColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.clamp,
    colors: [  Color(0xFF6A0DAD),
  Color(0xFFC167FF),
  Color(0xFFFFC0CB),]);

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kBlackAccent = Color(0xFFA3A3A3);

const kTwentyBlueColor = Color(0x201E1E99);
const kPinkColor = Color(0xFFFF70A3);
const kWhiteColor = Color(0xFFFFFFFF);
const kBlackColor = Color(0xFF3A3A3A);
const kTenBlackColor = Color(0x10000000);
// const kBackgroundColor = Color(0xFFFAFAFA);
const kGreyColor = Color(0xff8A959E);

const Color primaryColor =
    Color(0xFFFFDCE7); // const kSecondaryColor = Color(0xFFFFA41B);
const kDefaultPadding = 20.0;
const kTextLightColor = Color(0xFF747474);
const kBlueColor = Color(0xFF40BAD5);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);
const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

class VerticalSeparator extends StatelessWidget {
  const VerticalSeparator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      width: 1,
      height: 20,
    );
  }
}

class ActionButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String iconPath;
  final bool active;

  const ActionButton({
    Key key,
    this.title,
    this.iconPath,
    this.onTap,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10.0,
        children: [
          SvgPicture.asset(
            iconPath,
            color: active ? primaryColor : Colors.black87,
          ),
          Stack(
            overflow: Overflow.visible,
            children: [
              Text(title,
                  style: TextStyle(
                    color: active ? primaryColor : Colors.black87,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  )),
              if (active)
                Positioned(
                  top: -3,
                  right: -12,
                  child: Container(
                    width: 14,
                    height: 14,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/tick.svg',
                      height: 5,
                      color: Colors.white,
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}

List<String> sizeNumlist = [
  "9",
  "10",
];
List<Color> colors = [
  Color(0xFFF9362E),
  Color(0xFF003CFF),
  Color(0xFFFFB73A),
  Color(0xFF3AFFFF),
  Color(0xFF1AD12C),
  Color(0xFFD66400),
];

String desc =
    "Get maximum support, comfort and a refreshed look with these adidas energy cloud shoes for men comes wit a classic style."
    "Boost your running comfort to the next level with this supportive shoe Synthetic upper with FITFRAME midfoot cage for a locked-down fit and feel"
    "Lace-up closure Cushioned footbed CLOUDFOAM midsole provides responsive padding Durable ADIWEAR™ rubber sole.";
