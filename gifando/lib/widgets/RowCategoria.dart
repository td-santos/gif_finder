import 'package:flutter/material.dart';

import 'ContainerFuture.dart';

class RowCategoria extends StatelessWidget {
  final String title;
  final Color color;
  final String categoriaSearch;

  const RowCategoria({Key key, this.title, this.color, this.categoriaSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 6,
          height: 210,
          decoration: BoxDecoration(color: color),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, bottom: 15),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ContainerFuture(
              categoria: categoriaSearch,
            ),
          ],
        )
      ],
    );
  }
}
