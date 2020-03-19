import 'package:flutter/material.dart';
import 'package:gifando/Controller/ControllerDialog.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:http/http.dart' as http;

class ListItemGif extends StatelessWidget {
  final String url;
  final AsyncSnapshot snapshot;
  final int index;
  ControllerDialog controllerDialog = ControllerDialog();
  
  
   ListItemGif({Key key, this.url, this.snapshot, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.02),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                      image: AssetImage("assets/loading.png",),
                      fit: BoxFit.fitHeight,
                      ),
            //color: Colors.greenAccent.withOpacity(0.8),//Colors.blueAccent.withOpacity(0.8),
            borderRadius: BorderRadius.circular(5)
          ),
          height: height * 0.16,//160,
          width: width * 0.4,//180,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              url,//snapshot.data["data"][index]["images"]["fixed_height"]["url"],url,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      onTap: () {
        controllerDialog.dialogGIF(context, snapshot, index);
      },
      
      
    );
  }
}
