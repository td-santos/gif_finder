import 'package:flutter/material.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:http/http.dart' as http;

class ListItemGif extends StatelessWidget {
  final String url;
  final AsyncSnapshot snapshot;
  final int index;
  
  const ListItemGif({Key key, this.url, this.snapshot, this.index}) : super(key: key);

  _dialogGIF(BuildContext context, AsyncSnapshot snapshot, int index) {
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
                        _downloadGIF(snapshot.data["data"][index]["images"]
                            ["fixed_height"]["url"]);
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 7, bottom: 7),
                        decoration: BoxDecoration(
                            color: Colors.green[400],
                            borderRadius: BorderRadius.circular(25)),
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

  void _downloadGIF(String url) async {
    var filePath;
    var response = await http.get(url);
    filePath = await ImagePickerSaver.saveFile(fileData: response.bodyBytes);
  }
  
  
  @override
  Widget build(BuildContext context) {

    
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(left: 15),
        child: Container(
          
          //height: 100,
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      onTap: () {
        _dialogGIF(context, snapshot, index);
      },
      
      
    );
  }
}
