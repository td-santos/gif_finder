import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gifando/widgets/ContainerFuture.dart';

class CategoriaPage extends StatefulWidget {

  final String categoria;
  final String search;
  final Color color;

  const CategoriaPage({Key key, this.categoria, this.search, this.color}) : super(key: key);
  @override
  _CategoriaPageState createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(left: width * 0.03, top: width * 0.17),
                    child: GestureDetector(
                      onTap: () {
                        
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
                  Padding(
                    padding:EdgeInsets.only(left: width * 0.03, top: width * 0.15),
                    child: Text(widget.categoria, style: TextStyle(
                      color: widget.color,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.09
                    ),),
                  )
                ],
              ),
              Expanded(
                    child: ContainerFuture(
                      categoria: widget.search,
                      grid: true,
                    ),
                  )
            ],
          ),
        ),
      ),
      
    );
  }
}