import 'dart:convert';
import 'dart:ffi';

import 'package:easyfinancy/app/shared/models/compra.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:easyfinancy/app/shared/sharedPrefs.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeStore store;
  late final SharedPrefs _sharedPrefs = SharedPrefs();
  late int currentIndex = 0;
  late List<Compra> compras;
  late final _telas = [
    HomeScreen(),
    ComprasScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
    print(_sharedPrefs.read('compras'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140,
        backgroundColor: const Color(0xFF13747D),
        flexibleSpace: Container(
          height: double.infinity,
          alignment: Alignment.bottomLeft,
          child: Container(
            alignment: Alignment.bottomLeft,
            height: double.infinity,
            margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        width: 60,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Icons.image,
                          color: Color(0xFF13747D),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
                      Container(
                        width: 60,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5))),
                        child: Icon(Icons.people, color: Color(0xFF13747D)),
                      ),
                      Container(
                        width: 60,
                        color: Colors.white,
                        height: double.infinity,
                        child: Icon(Icons.list, color: Color(0xFF13747D)),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Olá, Fulano!",
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Rubik', fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.bottomLeft,
        child: _telas[currentIndex],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.increment();
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Minhas compras',
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Container(
            alignment: Alignment.bottomLeft,
            width: double.infinity,
            // color: Color(0xFF29221F),
            color: Color(0xFFFFFFFF),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  margin: const EdgeInsets.fromLTRB(15, 30, 15, 30),
                  decoration: const BoxDecoration(
                    color: Color(0xFF13747D),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 4),
                          color: Colors.black38,
                          blurRadius: 3,
                          spreadRadius: 1),
                    ],
                  ),
                  padding: const EdgeInsets.all(15),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Suas finanças atuais são:",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Rubik')),
                      Text("R\$ 0,00",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Text(
                    "Resumo de gastos:",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  child: ListView(
                    padding: EdgeInsets.all(15),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Card(
                          color: Colors.purple,
                          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.60,
                              height: 200,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        width: double.infinity,
                                        height: 40,
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 0),
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          "Nubank - Cartão de Crédito",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontFamily: 'Rubik',
                                              fontWeight: FontWeight.w800),
                                        ),
                                      )),
                                      Container(
                                        width: 40,
                                        child: Icon(
                                          Icons.credit_card,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                      child: Container(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 0, 0),
                                          child: Text(
                                            "Seus gastos atuais são de:",
                                            style: TextStyle(
                                                fontFamily: 'Rubik',
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                                  Expanded(
                                      child: Container(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.bottomLeft,
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 0, 10),
                                          child: Text(
                                            "01/31",
                                            style: TextStyle(
                                                fontFamily: 'Rubik',
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                                ],
                              ))),
                      Card(
                        color: Colors.grey,
                        child: Container(
                            height: double.infinity,
                            width: MediaQuery.of(context).size.width * 0.60,
                            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      width: double.infinity,
                                      height: 40,
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        "Aluguel",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w800),
                                      ),
                                    )),
                                    Container(
                                      width: 40,
                                      child: Icon(Icons.house,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                Expanded(
                                    child: Container(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          "Seus gastos atuais são de:",
                                          style: TextStyle(
                                              fontFamily: 'Rubik',
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                                Expanded(
                                    child: Container(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 10),
                                        child: Text(
                                          "01/31",
                                          style: TextStyle(
                                              fontFamily: 'Rubik',
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                              ],
                            )),
                      ),
                    ],
                  ),
                )
              ],
            )),
        Container(
          height: 50,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Text(
            "Histórico:",
            style: TextStyle(
                fontSize: 25, fontFamily: 'Rubik', fontWeight: FontWeight.w800),
          ),
        ),
        Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 80,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.black12,
                        alignment: Alignment.topLeft,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Compra realizada",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: 'Rubik'),
                            ),
                            Text("18:43")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      width: 120,
                      color: Colors.black12,
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("R\$ 99,00"),
                          Text("1x"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.red,
                child: null,
              ),
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.red,
                child: null,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ComprasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.bottomLeft,
      child: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            child: Text(
              "Minhas Compras",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Divider(),
          Card(
              color: const Color(0xFF13747D),
              child: Container(
                width: double.infinity,
                height: 80,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Nome Produto",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w800),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Cartão de Crédito - Nubank",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      )
                    ),
                    Container(
                      width: 150,
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.center,
                      height: double.infinity,
                      child: Column(
                        children: [
                          Text("R\$ 99,00", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18),),
                          Padding(padding: const EdgeInsets.fromLTRB(0, 5, 0, 0)),
                          Text("3x", style: TextStyle(color: Colors.white, fontSize: 15),),
                        ],
                      )
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        width: 60,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(2), bottomRight: Radius.circular(2)),
                        ),
                        child: IconButton(
                          color: Colors.blue,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: const Text("Tem certeza que deseja excluir?"),
                                actions: [
                                  TextButton(onPressed: () => Navigator.pop(context, 'Cancel'), child: const Text("Cancelar")),
                                  TextButton(onPressed: () => Navigator.pop(context, 'OK'), child: const Text("Sim")),
                                ],
                              ),
                            );
                          },
                          icon: Icon(Icons.delete, color: Colors.white,),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
