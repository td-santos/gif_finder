
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:http/http.dart' as http;


 class ControllerDialog{   
   
   ControllerDialog();

  downloadGIF(String url) async {    
    var response = await http.get(url);
    await ImagePickerSaver.saveFile(fileData: response.bodyBytes);    
  }

  dialogGIF(BuildContext context, AsyncSnapshot snapshot, int index) {
    showDialog(
        context: context,
        builder: (context) {
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return AlertDialog(
            backgroundColor: Colors.black.withOpacity(0.7),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              title: Text("GIF",style: TextStyle(color: Colors.white),),
              content: SingleChildScrollView(
                child: Column(
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
                    
                    padding: EdgeInsets.only(top: width * 0.04, left: width * 0.04, right: width * 0.04),
                    child: GestureDetector(
                      onTap: () {
                        downloadGIF(snapshot.data["data"][index]["images"]
                            ["fixed_height"]["url"]);
                            Timer(Duration(seconds: 2), (){

                            });
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: width * 0.03, right: width * 0.03, top: width * 0.015, bottom: width * 0.015),
                        decoration: BoxDecoration(
                            color: Colors.pink[900],
                            borderRadius: BorderRadius.circular(17)),
                        child: Center(
                          child: Text(
                            "download",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.045,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ));
        });
  }


  
}