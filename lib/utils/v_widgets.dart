import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

Widget vText(String title,
    {Color color,
    double fontSize,
    FontWeight fontWeight,
    TextOverflow overflow = TextOverflow.fade,
    TextAlign align,
    bool money = false,
    bool number = false,
    bool sans = false,
    int maxLines}) {
  FlutterMoneyFormatter fmf;
  if (number || money) {
    fmf = new FlutterMoneyFormatter(
      amount: (title != null && title != "" && title != "null")
          ? double.parse(title)
          : 0.0,
      settings: MoneyFormatterSettings(
        symbol: !number ? 'Rp. ' : '',
        thousandSeparator: ' ',
        decimalSeparator: '.',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 0,
        compactFormatType: CompactFormatType.short,
      ),
    );
  }

  return Text(
    title != null ? money || number ? fmf.output.symbolOnLeft : title : "",
    style: TextStyle(
      fontFamily: sans ? "sans" : "poppins",
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
    overflow: overflow,
    textAlign: align,
    maxLines: maxLines,
  );
}
