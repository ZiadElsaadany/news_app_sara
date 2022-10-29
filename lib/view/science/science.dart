

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/newsprovider.dart';
class Science extends StatefulWidget {


  @override
  State<Science> createState() => _ScienceState();
}

class _ScienceState extends State<Science> {

  Widget build(BuildContext context) {
    return Provider.of<Newsprovider>(context).Sciencedata.isEmpty?
    Center(
      child: CircularProgressIndicator(),
    )
        :
   Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(itemBuilder: (context,index){return Row(
        children: [
          Expanded(
            child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                ),
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: FadeInImage.assetNetwork(
                  height: 100,
                  placeholder: 'images/placehorder.jpg',
                  image:Provider.of<Newsprovider>(context).Sciencedata[index]['urlToImage']??'',imageErrorBuilder: (c, v, b) {
                  return Image.asset(
                    'images/placehorder.jpg',
                    height: 100,
                  );
                },
                  fit: BoxFit.cover,)
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Provider.of<Newsprovider>(context).Sciencedata[index]['title']??'',
                  maxLines: 4,overflow: TextOverflow.ellipsis,),
                SizedBox(height: 20,),
                Text(Provider.of<Newsprovider>(context).Sciencedata[index]['publishedAt']??'',
                  style: TextStyle(color: Colors.grey),)
              ],
            ),
          )
        ],
      );
      }, separatorBuilder: (BuildContext context,  index){
        return Divider(
          height: 10,
          indent: 40,
          endIndent: 40,
          thickness: 1.5,
        );
      }, itemCount: Provider.of<Newsprovider>(context).Sciencedata.length),
    );
}}
