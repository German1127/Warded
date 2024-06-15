import '../../../main.dart';
import 'grupo.dart';



class Vecino {
  String id;
  String groupId;
  final String nombre;
  final String rol;
  final String? photoUrl;

  Vecino(
      this.id,
      this.groupId,
      this.nombre,
      this.rol,
      this.photoUrl,
      );

  Future<Grupo> getGroup() async {
    var newGroup;
    if (groupId == '') {
      newGroup = Grupo('', []);
      newGroup.addMember(this);
      newGroup.toFirestore();
      groupId = Grupo('', []).id;
    } else {
      newGroup = await Grupo.fromFirestore(groupId);
    }
    return newGroup;
  }

  void toFirestore() async {
    final v = <String, dynamic>{
      'groupId': groupId,
      'name': nombre,
      'rol': rol,
      'photoUrl': photoUrl
    };

    if (id != '') {
      await db.collection('vecinos').doc(id).set(v);

    } else {
      final ref = await db.collection('vecinos').add(v);
      final snap = await ref.get();
      final data = snap.data() as Map<String, dynamic>;
      id = data['id'];
    }
  }

  static Future<Vecino> fromFirestore(id) async{

    final snap = await db.collection('vecinos').doc(id).get();
    var data = snap.data() as Map<String, dynamic>;

    var newVecino = Vecino(
      snap.id,
      data['groupId'],
      data['name'],
      data['rol'],
      data['photoUrl'],
    );
    return newVecino;
  }
}