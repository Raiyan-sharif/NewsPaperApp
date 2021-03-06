import 'package:flutter/material.dart';
import 'dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildContextTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        '${title}',
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMeal.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildContextTitle(context, 'Ingredients'),
              buildContainer(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.ingredients[index])),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildContextTitle(context, "Steps"),
              buildContainer(
                context,
                ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index) => Column(children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    Divider(),
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
