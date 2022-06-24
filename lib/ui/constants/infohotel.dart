class InfoHotel
{
   String _pathPic='default';
   String _nameHotel='default';
   double _numOfStar=0.0;
   String _addressHotel='default';
   InfoHotel(this._pathPic,this._nameHotel,this._numOfStar,this._addressHotel);
   set setpathpic(String str){_pathPic=str;}
   set setnameHotel(String str){_nameHotel=str;}
   set setnumOfStar(double i){_numOfStar=i;}
   set setaddressHotel(String str){_addressHotel=str;}
   String get pathPic => _pathPic;
   String get nameHotel=>_nameHotel;
   double get numOfStar=> _numOfStar;
   String get addressHotel=> _addressHotel;

}