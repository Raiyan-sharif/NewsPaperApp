import 'package:flutter/material.dart';
import 'package:newspaper_app/web_view.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '/categories_screen.dart';
import '/category_item.dart';
import '/category_meals_screens.dart';
import '/filter_screen.dart';
import '/meal_detail_screen.dart';
import '/tabs_screen.dart';

void main() {
  runApp(MyApp());

}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              caption: TextStyle(
                fontSize: 20.0,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: '/',
      // home: TabScreen(),
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        WebViewExample.routeName: (ctx) => WebViewExample(),


      },
      onGenerateRoute: (settings){
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx)=> CategoryMealsScreen());
      },
      // onUnknownRoute: ,
    );
  }
}
