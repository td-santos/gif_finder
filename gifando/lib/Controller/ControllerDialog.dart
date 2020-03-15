import 'package:flutter/material.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:http/http.dart' as http;

 class ControllerDialog{
  
   ControllerDialog();

  void downloadGIF(String url) async {
    var filePath;
    var response = await http.get(url);
    filePath = await ImagePickerSaver.saveFile(fileData: response.bodyBytes);
  }

  dialogGIF(BuildContext context, AsyncSnapshot snapshot, int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black.withOpacity(0.7),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              title: Text("GIF",style: TextStyle(color: Colors.white),),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  /*Container(
                    
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                        image: DecorationImage(
                      image: AssetImage("assets/loading4.gif"),
                    )),
                    child: */
                    Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                        snapshot.data["data"][index]["images"]["fixed_height"]
                            ["url"],
                        fit: BoxFit.cover,
                      ),
                      )
                    ),
                  //),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: GestureDetector(
                      onTap: () {
                        downloadGIF(snapshot.data["data"][index]["images"]
                            ["fixed_height"]["url"]);
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 7, bottom: 7),
                        decoration: BoxDecoration(
                            color: Colors.pink[900],
                            borderRadius: BorderRadius.circular(17)),
                        child: Center(
                          child: Text(
                            "Baixar",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ));
        });
  }
}