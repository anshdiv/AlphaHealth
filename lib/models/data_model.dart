class DataModel {

  String _title;
  String _subTitle;
  String _image;
  String _description;
  String _tag;

  DataModel(this._title, this._subTitle, this._image, this._description,this._tag);

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get subTitle => _subTitle;

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  set subTitle(String value) {
    _subTitle = value;
  }


  String get tag => _tag;

  set tag(String value) {
    _tag = value;
  }

  static List<DataModel> mockData(){
    List<DataModel> data = List();
    data.add(DataModel("7 day programme", "Working with thoughts", "assets/images/image1.jpg", "In this 7 day programme, we'll help you to write thoughts down,identify any negative thinking and...","Tag1"));
    data.add(DataModel("7 day programme", "4 days of gratitude", "assets/images/image2.jpg", "In this 7 day programme, we'll help you to write thoughts down,identify any negative thinking and...","Tag2"));
    return data;
  }

}