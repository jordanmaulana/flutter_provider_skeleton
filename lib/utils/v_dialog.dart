import 'package:flutter/material.dart';
import 'package:imchef/utils/v_widgets.dart';

class VDialog {
  final BuildContext context;
  String title;
  String content;

  VDialog(this.context, {title, content});

  void loading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => Center(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(24.0))),
              padding: EdgeInsets.all(30.0),
              child: new CircularProgressIndicator())),
    );
  }

  void pop() {
    Navigator.pop(context);
  }

  void error(message, {title = "Error"}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (c) => AlertDialog(
              title: vText(title, color: Colors.red),
              content: vText(message),
              actions: <Widget>[
                FlatButton(
                  child: vText("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }

  void sessionEnd() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (c) => AlertDialog(
              title: vText("Sesi anda telah berakhir",
                  color: Colors.red),
              content: vText("Coba login lagi ya"),
              actions: <Widget>[
                FlatButton(
                  child: vText("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }
}
