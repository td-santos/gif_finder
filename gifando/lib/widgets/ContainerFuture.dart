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
  int _offSet = 0;
  

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Container(
      height: widget.grid == true 
      ? height  
      : widget.trending ==false
        ? 160
        : 220,
      width: width,
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
                    height: 100,
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

  int _getCount(List data, ) {
    /*if (cat == null || cat.isEmpty) {
      return data.length;
    } else {
      return data.length + 1;
    }*/
    return data.length + 1;
  }
   
  

  Widget createGifTable(BuildContext context, AsyncSnapshot snapshot) {
    return Column(
    children: <Widget>[
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: GridView.builder(
      padding: EdgeInsets.only(right: 15,top: 15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 10),
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
              padding: EdgeInsets.only(left: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
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
                            child: Icon(
                              Icons.remove,
                              color: Colors.pink[400],
                              size: 30.0,
                            ),
                          )
                        : Container(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _offSet += 23;
                        });
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.pink[400],
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
            );
      }),
      ),
      //SizedBox(height: 100,)
    ],
  );
}


  
}







