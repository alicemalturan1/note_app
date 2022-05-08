import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:note/component/note_card.dart';
import 'package:note/constants.dart';
import 'package:note/controllers/note_controller.dart';
import 'package:note/screens/createNote.dart';
import 'package:websafe_svg/websafe_svg.dart';


class Notes extends StatelessWidget{

  var _controller = Get.put(NoteController());
  @override
  Widget build(BuildContext context) {


    return Stack(
      fit: StackFit.expand,

      children: [
        WebsafeSvg.asset('assets/bg.svg',fit: BoxFit.fill,width: MediaQuery.of(context).size.width),
        Obx(()=>Scaffold(

            backgroundColor:Colors.transparent,
            appBar:_controller.is_selected==true?AppBar(
              actions: [

                FlatButton(onPressed: ()=>_controller.deleteNote(), child:Icon(Icons.delete,color: Colors.white)),
                FlatButton(onPressed: ()=>_controller.unselectNote(), child:Icon(Icons.close,color: Colors.white))
              ],
              title: Text("Notlarım"),

              elevation: 0,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ): AppBar(
              actions: [
                FlatButton(onPressed: ()=>{Get.to(createNote())}, child: Text("Oluştur",style: TextStyle(color: Colors.white)))
              ],

              title: Text("Notlarım"),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),

            body: Container(
              margin: EdgeInsets.only(top:15),
              child: SafeArea(
                child: _controller.items.value.keys.length<1?Center(child:  Text("Henüz Not Yok",style: TextStyle(fontSize: 25,color: Colors.white),),):GridView.count(
                  crossAxisCount: 3,

                  mainAxisSpacing: 15,
                  children:make_children() ,
                ),
              ),
            )
        ))
      ],
    );
  }
  make_children(){

    List<Widget> rtn  =[];
    for(var x=0;x<_controller.items.value.keys.length;x++){
      final key = _controller.items.value.keys.elementAt(x);
      final cx = _controller.items.value[key]!;

      rtn.add(Container(

        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
        child: NoteCard(
          id: cx.id,
          note: cx.note.toString(),
          longpress:(){
            _controller.selectNote(cx.id);
            return cx.id;
          },
        )



      ));
    }
    return rtn;
  }

}