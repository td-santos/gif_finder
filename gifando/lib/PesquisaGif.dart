import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gifando/widgets/ContainerFuture.dart';

class PesquisaGif extends StatefulWidget {
  @override
  _PesquisaGifState createState() => _PesquisaGifState();
}

class _PesquisaGifState extends State<PesquisaGif> {
  TextEditingController _controllerSearch = TextEditingController();
  bool visibleGrid = false;
  //int _offSet = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: width * 0.14),
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
          ),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(left: width * 0.03, top: width * 0.15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _controllerSearch.clear();
                        });
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: width * 0.03,
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
                          top: width * 0.15,
                          right: width * 0.06,
                          left: width * 0.03,
                          bottom: width * 0.04),
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
                        style: TextStyle(
                            color: Colors.black, fontSize: width * 0.04),
                        textAlign: TextAlign.left,
                        onSubmitted: (text) {
                          setState(() {
                            if (text == "" || text.isEmpty) {
                              visibleGrid = false;
                            } else {
                              visibleGrid = true;
                            }
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
              Visibility(
                  visible: !visibleGrid,
                  child: Padding(
                    padding: EdgeInsets.only(top: width * 0.3),
                    child: Container(
                      child: Icon(
                        Icons.search,
                        size: width * 0.5,
                        color: Colors.grey.withOpacity(0.1),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
