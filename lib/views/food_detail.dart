import 'package:flutter/material.dart';

import '../models/meals/meals.dart';

class FoodDetailPage extends StatefulWidget {
  final Meals data;

  FoodDetailPage(this.data);

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.data.strMeal)),
      body: Column(
        children: <Widget>[
          Hero(
              tag: widget.data.strMealThumb,
              child: Image.network(widget.data.strMealThumb)),
          SizedBox(height: 16.0),
          Text(
            widget.data.strMeal,
            style: TextStyle(fontSize: 22.0),
          )
        ],
      ),
    );
  }
}
