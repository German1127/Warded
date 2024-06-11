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
  Future<void> addMember(Vecino member) async {
    if (member.id == '') {
      member.toFirestore();
    }
    members.add(member.id);
    toFirestore();
  }
  Future<void> removeMember(Vecino member) async {
    members.remove(member.id);
    toFirestore();
  }

  Future<void> toFirestore() async {
    final g = <String, dynamic>{
      'members': members,
    };

    if (id != '' && members != []) {
      await db.collection('grupos').doc(id).set(g);

    } else if (id != '' && members == []) {
      db.collection('grupos').doc(id).delete();

    } else {
        final ref = await db.collection('grupos').add(g);
        id = ref.id;
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

