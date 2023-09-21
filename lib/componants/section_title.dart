import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF282A28),
      padding: EdgeInsets.only(
        bottom: 8,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        textAlign: TextAlign.start,
                        title,
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ))),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
