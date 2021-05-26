import 'package:flutter/material.dart';
import 'package:woodHw/components/no_account_text.dart';
import 'package:woodHw/components/socal_card.dart';

import '../../sizeConfig.dart';
import 'widget/signInBody.dart';
import 'widget/signInForm.dart';

// import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: SignInBody()
    );
  }
}
