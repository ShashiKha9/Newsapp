
import 'package:flutter/material.dart';
import 'package:newsapp/bloc/newbloc.dart';
import 'package:newsapp/modals/news.dart';

class NewsPageScreen extends StatefulWidget{

  NewsPageScreenState createState()=> NewsPageScreenState();
}
class NewsPageScreenState extends State<NewsPageScreen>{
  @override
  void initState() {

    super.initState();


    initPreferences();


  }
  Future<void> initPreferences() async {
    bloc.newslist();
    // timer =
    //     Timer.periodic(Duration(seconds: 2), (Timer t) =>     ticketlist(context, prefs.getString(SharedPrefsKeys.ACCESS_TOKEN),prefs.getString(SharedPrefsKeys.TOKEN_TYPE)));

    setState(() {

    });

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
     child: Scaffold(
      body: Column(
        children:[
         Flexible(
            child: StreamBuilder<News>(
                stream: bloc.newsList.stream,
                builder: (context, AsyncSnapshot<News>  snap) {
                  return FutureBuilder<bool>(
                      future: postData(),
                      builder: (BuildContext context, AsyncSnapshot<bool>   snapshot) {
                        if (!snapshot.hasData) {
                          return Text("No active news");
                        }
                        else {
                          return ListView.separated(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            itemCount: snap.data!.data.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            separatorBuilder: (BuildContext context, int index) =>
                                Divider(height: 3,
                                  thickness: 1,
                                  indent: 8,
                                  endIndent: 8,
                                ),
                            itemBuilder: (BuildContext context, int index) {
                              return
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(color: Colors.black),
                                  ),
                                  shadowColor: Colors.grey.withOpacity(0.6),
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                       leading: Padding(padding: EdgeInsets.only(top: 55),
                                       child: Icon(Icons.favorite_border,size: 36,),),
                                        title: Column(
                                          children: [
                                            
                                            Text(snap.data!.data[index].title.toString(),
                                              style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
                                             (snap.data!.data[index].summary != null) ?
                              Text  ( snap.data!.data[index].summary.toString(),
                              style: TextStyle(fontSize: 13),):
                                                 Text(""),
                                            Text(snap.data!.data[index].published.toString(),
                              style: TextStyle(fontSize: 14,color: Colors.grey[500]),)


                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                            },
                          );
                        }
                      }

                  );
                }
            )
        ),
      ]
      ),

     )

      );


  }


}

Future<bool> postData() async {
  await Future<dynamic>.delayed(const Duration(milliseconds: 0));
  return true;
}