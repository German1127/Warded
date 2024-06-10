import '../../../main.dart';
import 'vecino.dart';


class Grupo {
  String id;
  List<dynamic> members = [];

  Grupo(
      this.id,
      this.members,
      );

  Future<List<Vecino>> getMembers() async{
    List<Vecino> retList = [];
    for (final id in members) {
      retList.add(await Vecino.fromFirestore(id));
    }
    return retList;
  }
  void addMember(Vecino member) async {
    if (member.id == '') {
      member.toFirestore();
    }
    members.add(member.id);
    toFirestore();
  }
  void removeMember(Vecino member) async {
    members.remove(member.id);
    toFirestore();
  }

  void toFirestore() async {
    final g = <String, dynamic>{
      'members': members,
    };

    if (id != '') {
      await db.collection('grupos').doc(id).set(g);

    } else {
      final ref = await db.collection('grupos').add(g);
      final snap = await ref.get();
      final data = snap.data() as Map<String, dynamic>;
      id = data['id'];
    }
  }


  static Future<Grupo> fromFirestore(id) async {
    final snap = await db.collection('grupos').doc(id).get();
    var data = snap.data() as Map<String, dynamic>;

    var newGroup = Grupo(
        snap.id,
        data['members']
    );
    return newGroup;
  }
}