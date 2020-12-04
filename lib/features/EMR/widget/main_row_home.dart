import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/EMR/widget/arrow_container.dart';

class MainRowHome extends StatelessWidget {
  const MainRowHome({
    Key key,
    this.text,
    this.icon,
    this.onTapSearch,
    this.onTapQrBar,
    this.onTapFilter,
  }) : super(key: key);
  final text;
  final icon;
  final onTapSearch;
  final onTapQrBar;
  final onTapFilter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ArrowContainer(
          onTapBack: () {
            //code of back
            //  Navigator.pop(context);
            print('back');
          },
        ),
        Container(
          width: 277.0,
          height: 34.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(11)),
            border:
                Border.all(color: Color.fromRGBO(82, 9, 116, 1), width: 1.5),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    text,
                    style: (TextStyle(
                        fontSize: 18.0,
                        decoration: TextDecoration.none,
                        color: Color.fromRGBO(29, 40, 46, 1))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: GestureDetector(
                        child: Icon(icon,
                            size: 25.0, color: Color.fromRGBO(82, 9, 116, 1)),
                        onTap: onTapQrBar),
                  ),
                  GestureDetector(
                      child: Icon(Icons.search,
                          size: 25.0, color: Color.fromRGBO(82, 9, 116, 1)),
                      onTap: onTapSearch)
                ],
              ),
            ],
          ),
        ),
        GestureDetector(
          child: Icon(Icons.filter_alt,
              size: 25.0, color: Color.fromRGBO(82, 9, 116, 1)),
          onTap: onTapFilter,
        )
      ],
    );
  }
}
