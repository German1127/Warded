import 'package:Warded/main.dart';

class Vecino {
  String id;
  String? groupId;
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

  void toFirestore() async {
    final v = <String, dynamic>{
      "groupId": groupId,
      "name": nombre,
      "rol": rol,
      "photoUrl": photoUrl
    };

    if (id != "") {
      await db.collection("vecinos").doc(id).set(v);

    } else {
      final ref = await db.collection("vecinos").add(v);
      id = ref.id;
    }
  }

  static Future<Vecino> fromFirestore(id) async{

    final snap = await db.collection("vecinos").doc(id).get();
    var data = snap.data() as Map<String, dynamic>;

    var nuevo = Vecino(
      snap.id,
      data["groupId"],
      data["name"],
      data["rol"],
      data["photoUrl"],
    );
    return nuevo;
  }
}
