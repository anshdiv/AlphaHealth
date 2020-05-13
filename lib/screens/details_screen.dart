import 'package:alphahealth/models/data_model.dart';
import 'package:alphahealth/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final DataModel dataModel;
  DetailsScreen(this.dataModel,{Key key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        height: SizeConfig.screenHeight,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: widget.dataModel.tag,
                  transitionOnUserGestures: true,
                  child: Image.asset(
                    widget.dataModel.image,
                    width: SizeConfig.screenWidth,
                    fit: BoxFit.fill,
                    height: SizeConfig.blockSizeVertical * 45,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: SizeConfig.screenHeight-400,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text("Day 1",style: TextStyle(color: Colors.grey),),
                  ),
                )
              ],
            ),
            Positioned.fill(
              left: 10,
              right: 10,
              bottom: SizeConfig.blockSizeVertical * 20,
              top: SizeConfig.blockSizeVertical * 30,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(widget.dataModel.title,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.dataModel.subTitle,
                                style: TextStyle(fontSize: 40),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.dataModel.description,
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FlatButton(
                                  child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Keep reading ",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Icon(Icons.chevron_right, color: Colors.black)
                                ],
                              ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Colors.black.withOpacity(0.7),
          child: Text(
            "Start the programme",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
