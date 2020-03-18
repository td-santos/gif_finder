import 'package:flutter/material.dart';
import 'package:gifando/Controller/ControllerDialog.dart';

class CardTrendingItem extends StatelessWidget {
  final String url;
  final AsyncSnapshot snapshot;
  final int index;
  ControllerDialog controllerDialog = ControllerDialog();

  CardTrendingItem({Key key, this.url, this.snapshot, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        controllerDialog.dialogGIF(context, snapshot, index);
      },
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 0), //left: 15,right: 5),
            child: Container(
              width: width ,//350,
              height: height * 0.22,//220,
              decoration: BoxDecoration(
                  color: Color(0xff170B3B),
                  borderRadius: BorderRadius.circular(10)),
              //alignment: Alignment.center,
              child: Center(
                child: Text(
                  "carregando",
                  style: TextStyle(color: Colors.white, fontSize: width * 0.03),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 0), //left: 15,right: 5),
            child: Container(
              //height: 200,
              width: width,//350,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  snapshot.data["data"][index]["images"]["fixed_height"]["url"],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                controllerDialog.dialogGIF(context, snapshot, index);
              },
              child: Container(
                //height: 30,width: 80,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(17),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.03, top: width * 0.013, bottom: width * 0.013, right: width * 0.03),
                  child: Text(
                    "download",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * 0.035),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
