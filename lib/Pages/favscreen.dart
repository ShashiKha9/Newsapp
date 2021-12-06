


import 'package:flutter/material.dart';
import 'package:newsapp/bloc/newbloc.dart';
import 'package:newsapp/modals/news.dart';


class FavScreen extends StatelessWidget{
   final List<String> favouriteitems;

  FavScreen({ Key, required this.favouriteitems}) : super( );


  @override
  Widget build(BuildContext context) {
return SafeArea(
  child:Scaffold(
  body: Column(
    children: [
      Flexible(
   child:  StreamBuilder<News>(
    stream: bloc.newsList.stream,
    builder: (context, AsyncSnapshot<News>  snap) {
      return
        ListView.builder(
            itemCount: favouriteitems.length,
            itemBuilder: (context, index) {
              return Card(
                  elevation: 10,
                  shadowColor: Colors.grey.withOpacity(0.6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: ListTile(
                    title: Column(
                      children: [
                        Text(favouriteitems[index]),

                      ],
                    )



                  )
              );
            }


        );
    }
  )

    )
    ],
  ),
  
)
);
  }


}