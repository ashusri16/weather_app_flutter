import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final Icon leadingIcon;
  final String data;
  final String unit;

  const CustomCard(
      {Key key, this.title, this.leadingIcon, this.data, this.unit})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue[200],
        ),
        borderRadius: BorderRadius.circular(31),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leadingIcon,
              RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: data,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: unit,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700]),
                      )
                    ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
