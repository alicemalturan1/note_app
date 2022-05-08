import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:localstore/localstore.dart';
import 'package:note/model/notemodel.dart';
import 'package:note/screens/notes.dart';



class NoteController extends GetxController with GetTickerProviderStateMixin{
  final items = <String, Note>{}.obs;
  var _subscription;
  final db = Localstore.instance;
  RxString _selected="".obs;
  RxBool _is_selected=false.obs;

   RxString get selected => this._selected;
  RxBool get is_selected => this._is_selected;
  create(data){
    var id = db.collection('my_notes').doc().id;
    db.collection('my_notes').doc(id).get().then(data);
  }
  void selectNote(String id){
    selected.value=id;
    _is_selected.value=true;

  }
  void unselectNote(){
    selected.value="";
    _is_selected.value=false;

  }
  void deleteNote(){

    db.collection('my_notes').doc(selected.value).delete().then((v){
      items.value.remove(selected.value);
      this.selected.value="";
      this.is_selected.value=false;


    });

  }
  getNotes(){

     db.collection('my_notes').get().then((event) {

      event?.entries.forEach((element) {
        final item = Note.fromMap(element.value);
        items.value.putIfAbsent(item.id, () => item);
      });

    });

  }

  createNote(String note){
      var id = db.collection('my_notes').doc().id;
      var model = Note(id: id,note:note);
      model.create().then((v){getNotes();Get.offAll(()=>Notes());});
  }

  @override
  void onInit() {
    getNotes();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark
    ));
    super.onInit();
  }
}