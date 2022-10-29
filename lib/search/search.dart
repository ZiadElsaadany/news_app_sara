import 'package:flutter/material.dart';
import 'package:news/provider/searchprovider.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (ctx) {
                Provider.of<SearchProvider>(context, listen: false)
                    .searchdata(Text: ctx);
              },
              decoration: InputDecoration(
                labelText: 'search',
                fillColor: Colors.deepOrange,
                labelStyle: TextStyle(color: Colors.deepOrange),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.deepOrange,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.deepOrange)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Provider.of<SearchProvider>(context).loading == true
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepOrange,
                        ),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Expanded(
                                child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    child: FadeInImage.assetNetwork(
                                      height: 100,
                                      placeholder: 'images/placehorder.jpg',
                                      image:
                                          Provider.of<SearchProvider>(context)
                                                      .quotes[index]
                                                  ['urlToImage'] ??
                                              '',
                                      imageErrorBuilder: (c, v, b) {
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
                                      Provider.of<SearchProvider>(context)
                                              .quotes[index]['title'] ??
                                          '',
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      Provider.of<SearchProvider>(context)
                                              .quotes[index]['publishedAt'] ??
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
                            indent: 40,
                            endIndent: 40,
                            thickness: 1.5,
                          );
                        },
                        itemCount:
                            Provider.of<SearchProvider>(context).quotes.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
