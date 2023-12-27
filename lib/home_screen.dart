import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Variables
  double _totalAmount = 0.00;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text("Tip Calculator",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 208, 211, 212)))),
        backgroundColor: const Color.fromARGB(255, 40, 55, 71),
      ),
      //body area
      body: SafeArea(
        //base-container
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromARGB(255, 20, 35, 51),
          //Base ListView Widget
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(30),
            children: [
              Container(
                width: 150,
                height: 160,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 8, 107, 99),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Total Per Person: ",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      //Display Container
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: const Color.fromARGB(255, 23, 32, 42),
                              width: 2.0,
                              style: BorderStyle.solid,
                              strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          "\$ ${_totalAmount.toString()}",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w800),
                        )),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
