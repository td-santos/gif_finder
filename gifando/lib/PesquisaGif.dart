import 'package:flutter/material.dart';
import 'package:gifando/widgets/ContainerFuture.dart';

class PesquisaGif extends StatefulWidget {
  @override
  _PesquisaGifState createState() => _PesquisaGifState();
}

class _PesquisaGifState extends State<PesquisaGif> {
  TextEditingController _controllerSearch = TextEditingController();
  bool visibleGrid = false;
  int _offSet = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        
        child: Container(
          padding: EdgeInsets.only(bottom: 20),
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black,
                  Colors.grey[900],
                ]),
            //image: DecorationImage(
            //   image: AssetImage("assets/bc2.jpg"), fit: BoxFit.cover)
          ),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 60),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _controllerSearch.clear();
                        });
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: 15,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 60, right: 20, left: 15, bottom: 17),
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
                            //_search = text;
                            visibleGrid = true;

                            //_offSet = 0;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
              Visibility(
                  visible: visibleGrid,
                  child: Expanded(
                    child: ContainerFuture(
                      categoria: _controllerSearch.text,
                      grid: true,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
