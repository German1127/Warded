import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Warded/login.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  List<String> _imagePaths = [
    'assets/BotonAlarma.png',
    'assets/IconoGrupo.png',
    'assets/IconoBache.png',
  ];
  List<String> _titles = [
    '¡Bienvenido a Warded!',
    '¡Mantente seguro con nosotros!',
    '¡Notifica a tu grupo!',
  ];
  List<String> _descriptions = [
    'Pon en marcha la alarma con un toque de dos segundos.',
    'Crea o únete a un grupo, ten control de quién recibe tus alertas.',
    'Utiliza las alertas para reportar incidentes a tus vecinos.',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Tutorial',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _imagePaths.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        _imagePaths[index],
                        fit: BoxFit.contain,
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          _titles[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.green, fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          _descriptions[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
            SizedBox(height: 40.0),
            if (_currentPage == _imagePaths.length - 1)
              ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                  await SharedPreferences.getInstance();
                  await prefs.setBool('seenOnboarding', true);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                  child: Text(
                    'Empezar',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _imagePaths.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}