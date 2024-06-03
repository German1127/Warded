import 'package:flutter/material.dart';

class MisGruposLoading extends StatefulWidget {
  const MisGruposLoading({super.key});

  @override
  _MisGruposLoadingState createState() => _MisGruposLoadingState();
}

class _MisGruposLoadingState extends State<MisGruposLoading> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tu grupo',
          style: TextStyle(
            color: Colors.green,
            fontFamily: 'Arial',
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.black,
        actions: const <Widget>[],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Fondo.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: 50),
                  ],
                ),
              ),
              Center(
                child: Container(
                  width: 200,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.6),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  child: FadeTransition(
                    opacity: _animation,
                    child: const Center(
                      child: Text(
                        'Cargando...',
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Arial',
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
