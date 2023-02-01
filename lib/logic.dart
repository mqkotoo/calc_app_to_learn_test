class Logic {
  String _text = "0";
  get text => _text;

  void input(String text) {

    if(_text == "0") {
      _text = text;
    }else{
      _text = _text + text;
    }
  }
}