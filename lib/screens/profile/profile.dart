import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:woodHw/screens/auth/signIn.dart';
import 'package:woodHw/screens/payment/paymentTransactions.dart';
import 'package:woodHw/screens/settings/legal_about_page.dart';
import 'package:woodHw/screens/settings/settings_page.dart';

import 'components/prof_list.dart';
import 'components/theeme.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit * 10,
            width: kSpacingUnit * 10,
            margin: EdgeInsets.only(top: kSpacingUnit * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit * 5,
                  backgroundImage: AssetImage('assets/background.jpg'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit * 2.5,
                    width: kSpacingUnit * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit * 1.5,
                      widthFactor: kSpacingUnit * 1.5,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: kDarkPrimaryColor,
                        size: ScreenUtil().setSp(kSpacingUnit * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit * 2),
          Text(
            'Nicolas Adams',
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit * 0.5),
          Text(
            'nicolasadams@gmail.com',
            style: kCaptionTextStyle,
          ),
          SizedBox(height: kSpacingUnit * 2),
          Container(
            height: kSpacingUnit * 4,
            width: kSpacingUnit * 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSpacingUnit * 3),
              color: Theme.of(context).accentColor,
            ),
            child: Center(
              child: Text(
                'Upgrade to PRO',
                style: kButtonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );

    // var themeSwitcher = ThemeSwitcher(
    //   builder: (context) {
    //     return AnimatedCrossFade(
    //       duration: Duration(milliseconds: 200),
    //       crossFadeState:
    //           ThemeProvider.of(context).brightness == Brightness.dark
    //               ? CrossFadeState.showFirst
    //               : CrossFadeState.showSecond,
    //       firstChild: GestureDetector(
    //         onTap: () =>
    //             ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
    //         child: Icon(
    //           LineAwesomeIcons.sun,
    //           size: ScreenUtil().setSp(kSpacingUnit * 3),
    //         ),
    //       ),
    //       secondChild: GestureDetector(
    //         onTap: () =>
    //             ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
    //         child: Icon(
    //           LineAwesomeIcons.moon,
    //           size: ScreenUtil().setSp(kSpacingUnit * 3),
    //         ),
    //       ),
    //     );
    //   },
    // );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit * 3),
        Icon(
          LineAwesomeIcons.arrow_left,
          size: ScreenUtil().setSp(kSpacingUnit * 3),
        ),
        profileInfo,
        // themeSwitcher,
        SizedBox(width: kSpacingUnit * 3),
      ],
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: kSpacingUnit * 5),
          header,
          Expanded(
            child: ListView(
              children: <Widget>[
                ProfileListItem(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LegalAboutPage())),
                  icon: LineAwesomeIcons.user_shield,
                  text: 'Privacy',
                ),
                ProfileListItem(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CardScreen())),
                  icon: LineAwesomeIcons.history,
                  text: 'Wallet',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.history,
                  text: 'Purchase History',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.question_circle,
                  text: 'Help & Support',
                ),
                ProfileListItem(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SettingsPage())),
                  icon: LineAwesomeIcons.cog,
                  text: 'Settings',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.user_plus,
                  text: 'Invite a Friend',
                ),
                ProfileListItem(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (contetx) => SignInScreen()));
                  },
                  icon: LineAwesomeIcons.alternate_sign_out,
                  text: 'Logout',
                  hasNavigation: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
