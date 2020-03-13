import 'package:flutter/material.dart';
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
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  //color: Colors.orange,
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      //colors: [Colors.orange, Colors.red]
                      colors: [
                        Colors.red,
                        Colors.purple[700],
                        Colors.purple[900]
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
                      "Gifando",
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
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.transparent)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.transparent)),
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
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 0, bottom: 10, left: 15),
                                child: Text(
                                  "animais",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey[400]),
                                ),
                              ),
                              ContainerFuture(
                                categoria: "animais",
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                width: width,
                                //height: 10,
                                child: Center(
                                  child: Text(
                                    "-_-_-_-_-_-_-_-",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 30, bottom: 10, left: 15),
                                child: Text(
                                  "Games",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey[400]),
                                ),
                              ),
                              ContainerFuture(
                                categoria: "games",
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                width: width,
                                //height: 10,
                                child: Center(
                                  child: Text(
                                    "-_-_-_-_-_-_-_-",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 30, bottom: 10, left: 15),
                                child: Text(
                                  "Animes",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey[400]),
                                ),
                              ),
                              ContainerFuture(
                                categoria: "animes",
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                width: width,
                                //height: 10,
                                child: Center(
                                  child: Text(
                                    "-_-_-_-_-_-_-_-",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 30, bottom: 10, left: 15),
                                child: Text(
                                  "Diversão",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey[400]),
                                ),
                              ),
                              ContainerFuture(
                                categoria: "diversao",
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                width: width,
                                //height: 10,
                                child: Center(
                                  child: Text(
                                    "-_-_-_-_-_-_-_-",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 30, bottom: 10, left: 15),
                                child: Text(
                                  "Heróis",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey[400]),
                                ),
                              ),
                              ContainerFuture(
                                categoria: "marvel dc",
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                width: width,
                                //height: 10,
                                child: Center(
                                  child: Text(
                                    "-_-_-_-_-_-_-_-",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
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
        ),
      ),
    );
  }
}
