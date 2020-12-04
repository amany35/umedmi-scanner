import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ColumnHeightWeight extends StatelessWidget {
  const ColumnHeightWeight({
    Key key, this.imagePath, this.textDef, this.textDetails, this.svgPath,
  }) : super(key: key);

  final imagePath;
  final svgPath;
  final textDef;
  final textDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        width: 130.0,
        height: 80.0,

        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromRGBO(248, 247, 250,1),
                  child: Image.asset(imagePath),
                ),
                SizedBox(
                  width: 40.0,
                ),
                CircleAvatar(
                  backgroundColor: Color.fromRGBO(248, 247, 250,1),
                  child: SvgPicture.asset(
                    svgPath,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.0,
            ),
            Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                //  width: 60.0,
                  height: 15.0,
                  child: Text(
                    textDef,
                    style: TextStyle(
                      fontSize: 8.0,
                      decoration: TextDecoration.none,
                      fontFamily: 'Gilroy-Bold',
                      color: Color.fromRGBO(197, 194, 213, 1),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                 // width: 50.0,
                  height: 15.0,
                  child: Text(
                    textDetails,
                    style: TextStyle(
                      fontSize: 8.0,
                      decoration: TextDecoration.none,
                      fontFamily: 'Gilroy-Bold',
                      color: Color.fromRGBO(29, 40, 46, 1),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  //  width: 60.0,
                  height: 15.0,
                  child: Text(
                    'Weight',
                    style: TextStyle(
                      fontSize: 8.0,
                      decoration: TextDecoration.none,
                      fontFamily: 'Gilroy-Bold',
                      color: Color.fromRGBO(197, 194, 213, 1),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Container(
                    // width: 50.0,
                    height: 15.0,
                    child: Text(
                      '70',
                      style: TextStyle(
                        fontSize: 8.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Gilroy-Bold',
                        color: Color.fromRGBO(29, 40, 46, 1),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(
              width: 150.0,
              child: Divider(
                //color: Colors.red,
                thickness: 2.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}