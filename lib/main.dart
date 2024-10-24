import 'package:flutter/material.dart';
import 'prediccion_genero_vista.dart';
import 'prediccion_edad_vista.dart';
import 'lista_universidades_vista.dart';
import 'noticias_wordpress_vista.dart';
import 'clima_vista.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 6',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    Image.asset(
      'assets/images/toolbox.png',
      width: 500,
      height: 500,
    ),
    const GenderPredictionView(),
    const AgePredictionView(),
    const UniversitiesListView(),
    const WordpressNewsView(
      wordpressUrl: 'https://www.policianacional.gob.do/',
    ),
    const WeatherView(),
    const AboutView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarea 6'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Herramientas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Género',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Edad',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Universidades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'PN',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: 'Clima',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Acerca de',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/icon.png'),
              radius: 50,
            ),
            SizedBox(height: 20),
            Text(
              'Información de contacto:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Nombre: Francis Janiel Jimenez Candelario',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Email: francisj1504@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Teléfono: 829-522-1589',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}