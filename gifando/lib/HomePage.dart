import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gifando/Controller/ControllerDialog.dart';
import 'package:gifando/PesquisaGif.dart';
import 'package:gifando/model/GifModel.dart';
import 'package:gifando/widgets/ContainerFuture.dart';
import 'package:gifando/widgets/RowCategoria.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controllerSearch = TextEditingController();
  PermissionStatus _status;

  int _offSet = 0;
  GifModel gifModel = GifModel();
  bool visibleConectivity ;
  ControllerDialog _controllerDialog = ControllerDialog();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    visibleConectivity = true;
    
    _checkInternetConnectivity();
    PermissionHandler().checkPermissionStatus(PermissionGroup.photos)
    .then(_updateStatus);
    _askPermission();
  }

  _updateStatus(PermissionStatus status){
    if(status != _status){
      setState(() {
        _status = status;
      });
    }
  }

  _askPermission(){
    PermissionHandler().requestPermissions(
      [PermissionGroup.photos]
    ).then(_onStatusReq);
  }

  _onStatusReq(Map<PermissionGroup,PermissionStatus> st){
    final status = st[PermissionGroup.photos];
    _updateStatus(status);
  }

  _checkInternetConnectivity()async{
    print("check connection.........................");
    var result = await Connectivity().checkConnectivity();

    if(result == ConnectivityResult.none){
      setState(() {
        visibleConectivity = false;
      });
      _dialogConnectivity();
      
    }else{
      setState(() {
        visibleConectivity = true;
        Timer(Duration(minutes: 20), (){
          _checkInternetConnectivity();
        });
      });
  
    }
  }

  _dialogConnectivity(){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Internet Connection",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
          content: Text("Verifique o estado da sua internet",style: TextStyle(color: Colors.black),),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: (){
                
                Navigator.pop(context);
              },
            )
          ],
        );
      }
    );
  }
  

  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    

    return Scaffold(
      //backgroundColor: Color(0xff170B3B),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.black,
                    Colors.grey[900],
                  ]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 60, left: 15, bottom: 20),
                        child: Text(
                          "SquidGif",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15, top: 60),
                        child: GestureDetector(
                          child: Icon(
                            Icons.search,
                            size: 40,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PesquisaGif()));
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: visibleConectivity,
                  child: SizedBox(
                  height: height,
                  child: ListView(
                      //physics: ClampingScrollPhysics(),
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ContainerFuture(
                                  trending: true,
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  width: width,
                                  //height: 10,
                                  child: Center(
                                    child: Text(
                                      "-_-_-_-_-_-_-_-",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.greenAccent[400]),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                RowCategoria(
                                  title: "Pets",
                                  categoriaSearch: "pets",
                                  color: Colors.pink,
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                RowCategoria(
                                  title: "Games",
                                  categoriaSearch: "Gamers",
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                RowCategoria(
                                  title: "Animes",
                                  categoriaSearch: "anime",
                                  color: Colors.orange,
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                RowCategoria(
                                  title: "Funny",
                                  categoriaSearch: "meme",
                                  color: Colors.purple,
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                RowCategoria(
                                  title: "Esportes",
                                  categoriaSearch: "sport",
                                  color: Colors.yellow,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 300,
                            )
                          ],
                        ),
                      ]),
                ),
                ),
                Visibility(
                  visible: !visibleConectivity,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 100),
                    height: height,
                    child: Center(
                    child: GestureDetector(
                      child: Icon(Icons.sync,color: Colors.white,size: 150,),
                      onTap: (){
                        
                        _checkInternetConnectivity();
                      },
                    ),
                  ),
                  ),
                )
              ],
            )),
      ),
      
    );
  }
}
