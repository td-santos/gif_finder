import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:gifando/model/GifModel.dart';
import 'package:gifando/widgets/CardTrendingItem.dart';
import 'ListItemGif.dart';

class ContainerFuture extends StatefulWidget {
  
  final String categoria;
  final bool grid;
  final bool trending;
  const ContainerFuture({Key key, this.categoria, this.grid,this.trending =false}) : super(key: key);


  @override
  _ContainerFutureState createState() => _ContainerFutureState();
}

class _ContainerFutureState extends State<ContainerFuture> {

  GifModel gifModel = GifModel();
  var random = Random();
  int _offSet ;
  

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    _offSet = random.nextInt(30); 

    print("OFFSET-RANDOM : $_offSet");

    return  Container(
      height: widget.grid == true 
      ? height  
      : widget.trending ==false
        ? height * 0.18//160
        : height * 0.22,//220,
      width: widget.trending ==false 
        ?width * 0.98 //- 6,
        :width,
      child: FutureBuilder(
          future: widget.trending==false
          ? gifModel.getGifs(widget.categoria,_offSet,limit: widget.grid == true ? 23 :14)
          : gifModel.getGifsTrending(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:

              case ConnectionState.none:
                return Container(
                  alignment: Alignment.center,
                    width: double.infinity,
                    height: 50,
                    /*decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/loading2.gif"),
                    )
                    )*/
                    child: Text("...",style: TextStyle(color: Colors.white),),
                    );

              default:
                if (snapshot.hasError)
                  return Container();
                else
                if(widget.grid == true){
                  return createGifTable(context, snapshot);
                }else{
                  return createGifList(context, snapshot);
                  
                }
            }
          }),
    );
  }

  Widget createGifList(BuildContext context, AsyncSnapshot snapshot) {
  return widget.trending == true
  ? Swiper(
    index: 1,
    scale: 0.85,
    viewportFraction: 0.85,
    itemCount: snapshot.data["data"].length,
    itemBuilder: (context, index) {
      return CardTrendingItem(
            url: snapshot.data["data"][index]["images"]["480w_still"]["url"],
            index: index,
            snapshot: snapshot,
          );
    },
  )
  : ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data["data"].length,
      itemBuilder: (context, index) {
        if(widget.trending ==false){
          return ListItemGif(
            url: snapshot.data["data"][index]["images"]["480w_still"]["url"],
            index: index,
            snapshot: snapshot,
          );
        }else{
          return CardTrendingItem(
            url: snapshot.data["data"][index]["images"]["480w_still"]["url"],
            index: index,
            snapshot: snapshot,
          );
        }
      });
}

  int _getCount(List data) {    
    return data.length + 1;
  }  
  

  Widget createGifTable(BuildContext context, AsyncSnapshot snapshot) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(bottom: 2,right: width * 0.015,left: width * 0.025),
      child: Column(
    children: <Widget>[
      Expanded(
              child: SizedBox(
          height: MediaQuery.of(context).size.height,// * 0.8,
          child: GridView.builder(
        padding: EdgeInsets.only(right: width * 0.03,top: width * 0.03),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: width * 0.02, mainAxisSpacing: width * 0.03),
        //scrollDirection: Axis.horizontal,
        itemCount: _getCount(snapshot.data["data"]),
        itemBuilder: (context, index) {
          if (widget.categoria == null || index < snapshot.data["data"].length)
          return ListItemGif(
            url: snapshot.data["data"][index]["images"]["480w_still"]["url"],
            index: index,
            snapshot: snapshot,

          );

          else
              return Container(
                padding: EdgeInsets.only(left: width * 0.03),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/fundobotao.png"),
                      fit: BoxFit.cover
                    ),
                      color: Colors.limeAccent[400],
                      borderRadius: BorderRadius.circular(25)),
                      
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _offSet > 22
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  _offSet -= 23;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: width * 0.03),
                                child: Icon(
                                Icons.remove,
                                color: Colors.black,
                                size: width * 0.15,
                              ),
                              ),
                            )                            
                          : Container(),
                      _offSet > 22
                      ? Container(width: 4,height: MediaQuery.of(context).size.height,color: Colors.black,)
                      : Container(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _offSet += 23;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left:_offSet > 22 ? width * 0.03: 0),
                          child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: _offSet < 22 ?width * 0.2:width * 0.15,
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
        }),
        ),
      ),
      //SizedBox(height: 100,)
    ],
  ),
    );
}


  
}







