import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/constants.dart';
import 'package:note/controllers/note_controller.dart';
import 'package:note/screens/notes.dart';
import 'package:websafe_svg/websafe_svg.dart';

class createNote extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var _txtcontroller = TextEditingController();
    var _notecontroller = Get.put(NoteController());
    return Stack(
      fit: StackFit.expand,
      children: [
        WebsafeSvg.asset('assets/bg.svg',fit: BoxFit.fill,width: MediaQuery.of(context).size.width),
        Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
              FlatButton(onPressed: ()=>_txtcontroller.text.length<1?false:_notecontroller.createNote(_txtcontroller.text), child: Text("Kaydet",style: TextStyle(color: Colors.white)))
            ],

            title: Text("Not Oluştur"),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),

          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    TextField(
                      controller: _txtcontroller,
                      decoration: InputDecoration(hintText: "Notunuzu giriniz",contentPadding: EdgeInsets.all(kDefaultPadding/1.5),hintStyle: TextStyle(color: Colors.white)),
                      scrollPadding: EdgeInsets.all(80.0),
                      style: TextStyle(color: Colors.white,fontSize: 19),

                      keyboardType: TextInputType.multiline,
                      maxLines: 9999,
                      autofocus: true,
                      
                    )
                ],
              ),
            ),
          )
        )
      ],
    );
  }

}