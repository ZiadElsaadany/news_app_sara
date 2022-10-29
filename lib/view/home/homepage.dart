import 'package:flutter/material.dart';
import 'package:news/provider/butt_nav_pro.dart';
import 'package:news/search/search.dart';
import 'package:provider/provider.dart';

import '../../provider/newsprovider.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      Provider.of<Newsprovider>(context, listen: false)
          .getdata(CategoryName: 'business');
      Provider.of<Newsprovider>(context, listen: false)
          .getdata(CategoryName: 'science');
      Provider.of<Newsprovider>(context, listen: false)
          .getdata(CategoryName: 'sports');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Buttonprovider>(builder: (context, value, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'News App',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.lightbulb,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return Search();
                  }));
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                )),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.deepOrange,
          currentIndex: value.index,
          onTap: (newindex) {
            value.changeindex(index: newindex);
          },
          items: value.items,
        ),
        body: value.screens[value.index],
      );
    });
  }
}
