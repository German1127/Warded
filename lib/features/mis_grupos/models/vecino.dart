import 'package:untitle/main.dart';

class Vecino {
  final String id;
  final String? groupName;
  final String nombre;
  final String rol;
  final String? photoUrl;

  Vecino(
      this.id,
      this.groupName,
      this.nombre,
      this.rol,
      this.photoUrl,
      );

  void toFirestore() async {
    final v = <String, dynamic>{
      "groupName": groupName,
      "name": nombre,
      "rol": rol,
      "photoUrl": photoUrl
    };

    if (id != "") {
      await db.collection("vecinos").doc(id).set(v);

    } else {
      await db.collection("vecinos").add(v);
    }
  }

  static Future<Vecino> fromFirestore(id) async{

    final snap = await db.collection("vecinos").doc(id).get();
    var data = snap.data() as Map<String, dynamic>;

    var nuevo = Vecino(
      snap.id,
      data["groupName"],
      data["name"],
      data["rol"],
      data["photoUrl"],
    );
    return nuevo;
  }
}
