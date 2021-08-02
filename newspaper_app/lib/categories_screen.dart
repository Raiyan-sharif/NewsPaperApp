import 'package:flutter/material.dart';
import '/category_item.dart';
import '/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    Color color = Colors.white;
    
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('News Paper')),
            backgroundColor: Color.fromARGB(255,2, 136, 209),
          ),
          body: Container(
            color: Color.fromARGB(255, 149, 209, 249),
            child: Column(children: [
              TabBar(
                // controller: _controller_for_rakat,

                isScrollable: false,
                indicatorColor: Colors.amber,
                labelColor: Colors.white,

                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'Local News',
                  ),
                  Tab(text: 'Online'),
                  Tab(text: 'Channels'),
                ],
              ),
              Expanded(
                child: Container(
                  color: color,
                  // height: height - 146,
                  child: TabBarView(
                    // controller: _controller_for_rakat,
                    children: [
                      GridView(
                        padding: const EdgeInsets.all(25),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        children: DUMMY_CATEGORIES
                            .map((catData) => CategoryItem(
                                  catData.id,
                                  catData.title,
                                  catData.color,
                                  catData.imagetext,
                                  catData.webLink,
                                ))
                            .toList(),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Online',
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              ]),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Channel',
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
