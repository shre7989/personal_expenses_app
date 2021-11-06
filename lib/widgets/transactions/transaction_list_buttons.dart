import 'package:flutter/material.dart';

class TransactionListButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
            child: IconButton(
                hoverColor: Colors.purple,
                onPressed: null,
                icon: Icon(
                  Icons.filter_list_rounded,
                  color: Colors.black,
                )),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
            child: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.clear,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
