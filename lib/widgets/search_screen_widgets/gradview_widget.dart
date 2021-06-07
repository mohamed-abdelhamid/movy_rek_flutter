import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles.dart';

class GradView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(

        crossAxisCount: 2,

        children: List.generate(10, (index) {
          return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.white,
              elevation: 5,
              child: Column(
                children: [
                  Container(
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Image.asset(
                        'assets/images/poster.jpg',
                        width: 207,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    'Dummy Card Text',
                    style: kGeneralTextPickerStyle,
                  )),
                ],
              ));
        }),
      ),
    );
  }
}
