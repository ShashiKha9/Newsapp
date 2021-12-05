
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Pages/favscreen.dart';
import 'package:newsapp/bloc/newbloc.dart';
import 'package:newsapp/modals/news.dart';

class NewsPageScreen extends StatefulWidget{

  NewsPageScreenState createState()=> NewsPageScreenState();
}
class NewsPageScreenState extends State<NewsPageScreen>{
  var  saveddata = <String>[];

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
                  return  FutureBuilder<bool>(
                      future: postData(),
                      builder: (BuildContext context, AsyncSnapshot<bool>   snapshot) {
                        if (!snapshot.hasData) {
                          return Text("No active news");
                        }
                        else {
                          return ListView.builder(
                            physics: ScrollPhysics(),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            itemCount: snap.data!.data.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              String saved= snap.data!.data.toString();
                              bool isSaved = saveddata.contains(saved[index]) ;
                              return
                                Card(
                                  elevation: 10,
                                  shadowColor: Colors.grey.withOpacity(0.6),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        leading:Icon(
                                          isSaved? CupertinoIcons.heart_solid: CupertinoIcons.heart,size: 32,
                                          color: isSaved? Colors.red: null,

                                        ),
                                        onTap: (){
                                          setState(() {
                                            if(isSaved){
                                              saveddata.remove(saved[index]);


                                            }
                                            else {
                                              saveddata.add(saved[index]);
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>FavScreen(
                                                  favouriteitems: saveddata,
                                              )));
                                              // pushToFavouriteList(context);

                                            }

                                          });

                                        },



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
  // Future pushToFavouriteList(context){
  //  return Navigator.push(context, MaterialPageRoute(builder: (context)=> FavScreen(
  //    favouriteitems: ,
  //
  //  )));
  // }

}


Future<bool> postData() async {
  await Future<dynamic>.delayed(const Duration(milliseconds: 0));
  return true;
}