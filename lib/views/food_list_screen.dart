import 'package:flutter/material.dart';
import 'package:imchef/providers/food_list_state.dart';
import 'package:imchef/utils/v_widgets.dart';
import 'package:provider/provider.dart';

class FoodListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMCHEF JORDAN"),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (_) => ListState(context),
        child: Consumer<ListState>(
          builder: (BuildContext context, ListState v, Widget child) {
            return _body(v);
          },
        ),
      ),
    );
  }

  _body(ListState v) {
    if (!v.loaded) return Center(child: CircularProgressIndicator());
    return ListView.builder(
        itemCount: v.listMeal.length,
        itemBuilder: (c, i) {
          return ListTile(
            onTap: () => v.itemClick(v.listMeal[i]),
            leading: Hero(
                tag: v.listMeal[i].strMealThumb,
                child: Image.network(v.listMeal[i].strMealThumb)),
            title: vText(v.listMeal[i].strMeal),
          );
        });
  }
}
