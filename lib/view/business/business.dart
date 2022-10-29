import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:news/provider/newsprovider.dart';
import 'package:provider/provider.dart';

class Business extends StatefulWidget {
  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  Widget build(BuildContext context) {
    return Provider.of<Newsprovider>(context).Businessdata.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                          width: 150,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: FadeInImage.assetNetwork(
                            height: 100,
                            placeholder: 'images/placehorder.jpg',
                            image: Provider.of<Newsprovider>(context)
                                    .Businessdata[index]['urlToImage'] ??
                                '',imageErrorBuilder: (c, v, b) {
                            return Image.asset(
                              'images/placehorder.jpg',
                              height: 100,
                            );
                          },
                            fit: BoxFit.cover,
                          )),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Provider.of<Newsprovider>(context)
                                    .Businessdata[index]['title'] ??
                                '',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            Provider.of<Newsprovider>(context)
                                    .Businessdata[index]['publishedAt'] ??
                                '',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (BuildContext context, index) {
                return Divider(
                  height: 10,
                  thickness: 1.5,
                  indent: 40,
                  endIndent: 40,
                );
              },
              itemCount: Provider.of<Newsprovider>(context).Businessdata.length,
            ),
          );
  }
}
