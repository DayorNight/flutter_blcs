import 'package:flutter/material.dart';
import 'package:flutter_blcs/pages/pages.dart';

class MeView extends StatefulWidget {
  const MeView({Key? key}) : super(key: key);

  @override
  _MeViewState createState() => _MeViewState();
}

class _MeViewState extends State<MeView> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: GridView.builder(
            itemCount: myPages.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(myPages.values.elementAt(index));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 5,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.flag_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          myPages.keys.elementAt(index),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
