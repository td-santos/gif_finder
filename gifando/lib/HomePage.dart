import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gifando/model/GifModel.dart';
import 'package:gifando/widgets/ContainerFuture.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controllerSearch = TextEditingController();
  String _search;
  bool delay = true;
  bool visibleLists;
  int _offSet = 0;
  GifModel gifModel = GifModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    delay = true;
    visibleLists = true;
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
                image: DecorationImage(
                   image: AssetImage("assets/bc2.jpg"), fit: BoxFit.cover)
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      //color: Colors.orange,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          //colors: [Colors.greenAccent[400], Colors.greenAccent[400]]
                          //colors: [Colors.amberAccent[700], Colors.amberAccent[700]]
                          colors: [
                            //Colors.greenAccent[400],
                            //Colors.teal[700],
                            Color(0xff170B3B),

                            Colors.pink[900]
                          ]),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 60, left: 15),
                        child: Text(
                          "Squidgif",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 30, right: 15, left: 15, bottom: 17),
                        child: TextField(
                          controller: _controllerSearch,
                          decoration: InputDecoration(
                            hintText: "Pesquise aqui",
                            filled: true,
                            fillColor: Colors.grey[300],
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                          ),
                          style: TextStyle(color: Colors.black, fontSize: 18.0),
                          textAlign: TextAlign.left,
                          onSubmitted: (text) {
                            setState(() {
                              _search = text;
                              if (text == null || text.isEmpty || text == "") {
                                visibleLists = true;
                              } else {
                                visibleLists = false;
                              }

                              //_offSet = 0;
                            });
                          },
                        ),
                      ),
                      Visibility(
                        visible: !visibleLists,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _controllerSearch.clear();

                              visibleLists = true;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 15, left: 10),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: visibleLists,
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
                                  Container(
                                    width: width,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 0, bottom: 10, left: 30),
                                      child: Text(
                                        "Trending",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.greenAccent[400]),
                                      ),
                                    ),
                                  ),
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
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 25, bottom: 15),
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 3),
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.pink[400],
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50),
                                              bottomLeft: Radius.circular(10))),
                                      width: width,
                                      child: Text(
                                        "Pets",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  ContainerFuture(
                                    categoria: "pets",
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 25, bottom: 15),
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 3),
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.greenAccent[400],
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50),
                                              bottomLeft: Radius.circular(10))),
                                      width: width,
                                      child: Text(
                                        "Games",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  ContainerFuture(
                                    categoria: "gamers",
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 25, bottom: 25),
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 3),
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.pink[400],
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50),
                                              bottomLeft: Radius.circular(10))),
                                      width: width,
                                      child: Text(
                                        "Animes",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  ContainerFuture(
                                    categoria: "anime cute",
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 25, bottom: 15),
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 3),
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.indigo[900],
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50),
                                              bottomLeft: Radius.circular(10))),
                                      width: width,
                                      child: Text(
                                        "Diversão",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  ContainerFuture(
                                    categoria: "hahaha",
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 25, bottom: 15),
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 3),
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.pink[400],
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50),
                                              bottomLeft: Radius.circular(10))),
                                      width: width,
                                      child: Text(
                                        "Heróis",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  ContainerFuture(
                                    categoria: "marvel hq",
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
                    visible: !visibleLists,
                    child: ContainerFuture(
                      categoria: _search,
                      grid: true,
                    )

                    /*Container(
                  color: Colors.blue,
                  height: 400,
                  width: 400,
                ),
                */
                    ),
              ],
            )),
      ),
    );
  }
}
