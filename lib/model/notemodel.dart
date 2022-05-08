import 'package:localstore/localstore.dart';

class Note{
  final String?  note;
  final id;
  Note({this.note,required this.id});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'note': note,

    };
  }
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(

      note:map['note'],
      id:map['id'],
    );
  }
}

extension ExtNote on Note {
  Future create() async {
    final _db = Localstore.instance;
    return _db.collection('my_notes').doc(id).set(toMap());
  }
  Future delete() async {
    final _db = Localstore.instance;
    return _db.collection('my_notes').doc(id).delete();
  }
}