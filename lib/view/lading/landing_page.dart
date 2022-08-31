import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'landing_header.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(100.w, 70),
          child: LandingHeader()),
        body: Container()
    );
  }
}
