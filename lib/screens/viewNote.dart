import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/constants.dart';
import 'package:note/controllers/note_controller.dart';
import 'package:note/screens/notes.dart';
import 'package:websafe_svg/websafe_svg.dart';

class viewNote extends StatelessWidget{
  String note;
  viewNote({required this.note});
  @override
  Widget build(BuildContext context) {

    return Stack(
      fit: StackFit.expand,
      children: [
        WebsafeSvg.asset('assets/bg.svg',fit: BoxFit.fill,width: MediaQuery.of(context).size.width),
        Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            appBar: AppBar(


              title: Text("Notum"),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),

            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 999999,

                    text: TextSpan(style: TextStyle(color: kGrayColor,fontSize: 22,fontFamily: "Product Sans",height: 1.75),text: this.note),
                  ),
                ),
              ),
            )
        )
      ],
    );
  }

}