import 'package:flutter/material.dart';
import 'package:flutter_crud/screens/ListadoScreen.dart';
import 'package:flutter_crud/services/ClienteService.dart';
import 'package:flutter_crud/models/Cliente.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

int bottomSelectedIndex = 0;

void pageChanged(int index) {
  setState(() {
    bottomSelectedIndex = index;
  });
}

 void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

PageController pageController = PageController(
  initialPage: 0,
  keepPage: true,
);

Widget buildPageView() {
  return PageView(
    controller: pageController,
    onPageChanged: (index) {
      pageChanged(index);
    },
    children: <Widget>[
      ListadoScreen(),
      ListadoScreen(),
      ListadoScreen()
    ],
  );
}

List<BottomNavigationBarItem> buildBottomNavBarItems() {
  return [
    BottomNavigationBarItem(
        icon: new Icon(Icons.home),
        label: 'Listado'
    ),
    BottomNavigationBarItem(
      icon: new Icon(Icons.history),
      label: 'Historial'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings),
         label: 'Cuenta'
    )
  ];
}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final clienteService = Provider.of<ClienteService>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Flutter')),
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomSelectedIndex,
        items: buildBottomNavBarItems(),
        onTap:(index) {
          bottomTapped(index);
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            clienteService.selectedProduct =
                Cliente(nombre: "", apellido: "", email: "", createAt: "");
            Navigator.pushNamed(context, 'form');
          },
          child: Icon(Icons.add)),
    );
  }
}
