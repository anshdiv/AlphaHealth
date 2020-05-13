import 'package:alphahealth/models/data_model.dart';
import 'package:alphahealth/screens/details_screen.dart';
import 'package:alphahealth/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: _bottomNavigationItems()),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage(
                  "assets/images/background.jpg",
                ),
              ),
            ),
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            bottom: -30,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Text("Recommended Programmes",
                          style: TextStyle(fontSize: 16)),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: DataModel.mockData().length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 0.0,
                            crossAxisCount: 2,
                            childAspectRatio: 0.75),
                        itemBuilder: (BuildContext context, int index) => _gridItem(DataModel.mockData()[index]),
                      )
                    ],
                  ),
                ),
              ),
              height: 400,
              width: SizeConfig.screenWidth,
            ),
          )
        ],
      ),
    );
  }

  Widget _gridItem(DataModel dataModel) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen(dataModel)));
      },
      child: Card(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: ClipRRect(
                    child: Image.asset(
                      dataModel.image,
                  width: double.maxFinite,
                  fit: BoxFit.fill,
                ),borderRadius: BorderRadius.only(topRight: Radius.circular(5.0),topLeft: Radius.circular(5.0))),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: <Widget>[
                      Text(dataModel.title,style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 5,),
                      Text(dataModel.subTitle,style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _bottomNavigationItems() {
    List<BottomNavigationBarItem> navigationItems = List();
    navigationItems.add(
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")));
    navigationItems.add(BottomNavigationBarItem(
        icon: Icon(Icons.local_library), title: Text("Library")));
    navigationItems.add(BottomNavigationBarItem(
        icon: Icon(Icons.outlined_flag), title: Text("My Journey")));
    return navigationItems;
  }

}
