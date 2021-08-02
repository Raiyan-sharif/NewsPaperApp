import 'package:flutter/material.dart';
import 'package:newspaper_app/web_view.dart';
import '/category_meals_screens.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String imageString;
  final String webLink;


  CategoryItem(this.id,this.title, this.color,this.imageString,this.webLink);

  void selectCategories(BuildContext ctx) {
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryMealsScreen(id,title);
    //     },
    //   ),
    // );
    Navigator.of(ctx).pushNamed(WebViewExample.routeName,arguments: {'id':id,'title':title,'weblink':webLink});
    // arguments: {'id':id,'title':title}
    // WebViewExample();
  }


  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () => selectCategories(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageString,
              fit: BoxFit.cover,),
            Text(
            title,
            style: Theme.of(context).textTheme.caption,
          ),
        ]
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // colors: [Color.fromARGB(1, 2, 136, 209), color],
            colors: [Color.fromARGB(255, 168, 224, 255), Color.fromARGB(255, 215, 236, 251)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
