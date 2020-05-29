import 'package:flutter/material.dart';
import 'package:imchef/api/api_client.dart';
import 'package:imchef/api/url_string.dart';
import 'package:imchef/models/meals/meal_list_response.dart';
import 'package:imchef/models/meals/meals.dart';
import 'package:imchef/utils/v_dialog.dart';
import 'package:imchef/views/food_detail.dart';

class ListState with ChangeNotifier {
  List<Meals> listMeal = [];
  final BuildContext context;
  final ApiClient _apiClient = ApiClient();
  bool loaded = false;

  ListState(this.context) {
    getFood();
  }

  getFood() {
    _apiClient.get(
        url: VUrl.getMeal,
        callback: (status, message, res) {
          if (status == 200)
            listMeal = MealListResponse.fromJson(res).meals;
          else if (status == 401)
            VDialog(context).sessionEnd();
          else
            VDialog(context).error(message);
          loaded = true;
          notifyListeners();
          return;
        });
  }

  apicall(){
    
  }



  itemClick(Meals v) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FoodDetailPage(v)));
  }
}
