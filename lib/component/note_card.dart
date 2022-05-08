import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/controllers/note_controller.dart';
import 'package:note/screens/viewNote.dart';

import '../constants.dart';

class NoteCard extends StatelessWidget{
  String note;String id;  final VoidCallback longpress;


  NoteCard({Key ? key,required this.note,required this.id,required this.longpress}):super(key: key);
  @override
  Widget build(BuildContext context) {

    var controller = Get.put(NoteController());

    return  Obx((){
     double getBorderwith(){
       var f=1.7;
       if(controller.is_selected.value){
         if(controller.selected.value==this.id){

           f=3.7;

         }else{
           f=1.7;

         }

       }
       return f;
      }
     Color getBorderColor(){
       var f=Colors.white;
       if(controller.is_selected.value){
         if(controller.selected.value==this.id){
          f=Theme.of(context).colorScheme.primary;
         }else{
           f=Colors.white;

         }

       }
       return f;
     }

      return InkWell(

          onLongPress: ()=>longpress(),
          onTap: ()=>Get.to(()=>viewNote(note: this.note)),
          child: Container(


            padding: EdgeInsets.all(kDefaultPadding/2),

            decoration: BoxDecoration(
                border:Border.all(color:getBorderColor() ,width:getBorderwith()),
                borderRadius:BorderRadius.circular(13),
                color: Color.fromRGBO(28, 35, 65, 0.83137254901960786)
            ),
            child: RichText(
              overflow: TextOverflow.ellipsis,
              maxLines: 4,

              text: TextSpan(style: TextStyle(color: kGrayColor,fontSize: 16,fontFamily: "Product Sans",height: 1.75),text: this.note),
            ),
          ),

          borderRadius: BorderRadius.circular(13)
      );
    });
  }

}