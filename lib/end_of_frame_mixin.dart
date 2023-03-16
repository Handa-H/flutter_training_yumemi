import 'package:flutter/material.dart';

mixin endOfFrameMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then((value) {
      doAfterFrame();
    });
  }

  void doAfterFrame() {}
}
