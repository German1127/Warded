import 'package:flutter/material.dart';
import 'package:untitle/features/mis_grupos/models/vecino.dart';

class MisGruposItem extends StatelessWidget {
  const MisGruposItem({
    super.key,
    required this.vecino,
  });

  final Vecino vecino;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(
              Icons.person,
              color: Colors.blue,
              size: 50,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vecino.nombre,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                  ),
                ),
                Text(
                  vecino.rol,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
