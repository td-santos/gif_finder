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

    
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(left: 15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.8),
            borderRadius: BorderRadius.circular(0)
          ),
          height: 160,
          width: 180,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.network(
              url,
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
