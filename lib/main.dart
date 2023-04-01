import 'package:flutter/material.dart';
import 'package:project100/AddRequirementsScreen.dart';
import 'package:project100/models/requirements_model.dart';
import 'package:project100/shop_model.dart';

import 'constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShopListScreen(),
    );
  }
}

class ShopListScreen extends StatefulWidget {
  const ShopListScreen({Key? key}) : super(key: key);

  @override
  State<ShopListScreen> createState() => _ShopListScreenState();
}

class _ShopListScreenState extends State<ShopListScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController shopName = TextEditingController();

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: main_color,
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              child: Column(
                children: [
                  TextField(
                    controller: shopName,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      shopsList.add({
                        'name': shopName.text,
                        'Requirements': List<RequirementsModel>
                      });

                      setState(() {});

                      Navigator.pop(context);
                    },
                    child: Text('add'),
                  ),
                ],
              ),
            ),
          ),
          child: Icon(Icons.add),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              // snap: false,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    "SHOPS",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ), //Text
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/relaxed.jpg'))),
                  ) //Images.network
                  ), //FlexibleSpaceBar
              expandedHeight: 220,
              backgroundColor: main_color,
              leading: IconButton(
                icon: Icon(Icons.menu),
                tooltip: 'Menu',
                color: Colors.black,
                onPressed: () {},
              ), //IconButton
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.comment),
                  tooltip: 'Comment Icon',
                  color: Colors.black,
                  onPressed: () {},
                ), //IconButton
                IconButton(
                  icon: Icon(Icons.settings),
                  tooltip: 'Setting Icon',
                  color: Colors.black,
                  onPressed: () {},
                ), //IconButton
              ], //<Widget>[]
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return SizedBox(
                    height: 130,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddRequirementsScreen(
                              shopIndex: index,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Center(
                          child: ListTile(
                            leading: Image.asset('assets/images/shop.png'),
                            title: Text(shopsList[index]['name']),
                            //       trailing: Text(
                            // '$totalItemRate' ,style: TextStyle(fontSize: 20) ,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: shopsList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
