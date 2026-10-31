import 'package:flutter/cupertino.dart';
import 'package:june26_provider/models/Products.dart';
import 'package:june26_provider/service/apiservice.dart';

class ProductController extends ChangeNotifier{
List<Products>plist=[];
bool isloading=false;
String errMsg="";
Apiservice _apiservice=Apiservice();

Future<void> fetch() async {
  try{
    isloading=true;
    notifyListeners();
    plist= await _apiservice.getProducts()??[];
  }catch(e){
    errMsg=e.toString();
  }
  finally{
    isloading=false;
    notifyListeners();
  }
}


}