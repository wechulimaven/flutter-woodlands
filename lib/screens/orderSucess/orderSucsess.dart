import 'package:flutter/material.dart';

import 'component/body.dart';

class OrderSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Order Sucess Note"),
      ),
      body: Body(),
    );
  }
}
