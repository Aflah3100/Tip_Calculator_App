import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Variables
  double _totalAmount = 0.00;
  int _count = 1;
  int _tipAmount = 0;
  int _tipPercentage = 0;
  double _billAmount = 0.00;
  var billAmountController = TextEditingController();

  //Widgets
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
          padding: const EdgeInsets.only(top: 30.0),
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromARGB(255, 20, 35, 51),
          //Base ListView Widget
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(30),
            children: [
              // Container-1
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
                      child: Center(
                          child: Text(
                        "\u20B9 ${_totalAmount.toString()}",
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 219, 198, 190)),
                      )),
                    ),
                  ],
                ),
              ),
              //Container -2
              Container(
                width: 150,
                padding: const EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        width: 2.0,
                        color: const Color.fromARGB(255, 92, 91, 91)),
                    borderRadius: BorderRadius.circular(20.0)),
                margin: const EdgeInsets.only(top: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: billAmountController,
                      decoration: InputDecoration(
                          labelText: "Bill Amount",
                          prefixText: "Bill Amount: ",
                          prefixIcon: const Icon(Icons.currency_rupee_sharp),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(30.0))),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (String billAmount) {
                        setState(() {
                          try {
                            _billAmount = double.parse(billAmount);
                            _totalAmount =
                                (double.parse(billAmount) + _tipAmount) /
                                    _count;
                          } catch (e) {
                            _totalAmount = 0.00;
                            billAmountController.clear();
                          }
                        });
                      },
                    ), //Bill Amount
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Split",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 243, 111, 111),
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: const Center(
                                        child: Text(
                                      "-",
                                      style: TextStyle(fontSize: 23),
                                    )),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      if (_count > 1) {
                                        _count--;
                                      }
                                      _totalAmount =
                                          (_billAmount + _tipAmount) / _count;
                                    });
                                  },
                                  onLongPress: () => _count = 1),
                              const SizedBox(width: 10.0),
                              Text(
                                _count.toString(),
                                style: const TextStyle(
                                    color: Colors.greenAccent,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17.0),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              InkWell(
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 243, 111, 111),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: const Center(
                                      child: Text(
                                    "+",
                                    style: TextStyle(fontSize: 23),
                                  )),
                                ),
                                onTap: () {
                                  setState(() {
                                    _count++;
                                    _totalAmount =
                                        (_billAmount + _tipAmount) / _count;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 15.0, top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Tip",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Text(
                            "\u20B9 ${_tipAmount.toString()}",
                            style: const TextStyle(
                                color: Colors.purple,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Text(
                      "${_tipPercentage.toString()}%",
                      style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Slider(
                        value: _tipPercentage.toDouble(),
                        min: 0,
                        max: 100,
                        divisions: 10,
                        activeColor: const Color.fromARGB(255, 162, 79, 177),
                        inactiveColor: Colors.blueGrey,
                        onChanged: (double newValue) {
                          setState(() {
                            _tipPercentage = newValue.round();
                            try {
                              _tipAmount =
                                  (_billAmount * (_tipPercentage / 100))
                                      .toInt();
                              _totalAmount =
                                  (_billAmount + _tipAmount) / _count;
                            } catch (e) {
                              _tipAmount = 0;
                              _billAmount = 0;
                            }
                          });
                        })
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      billAmountController.clear();
                      _billAmount = 0.0;
                      _totalAmount = 0.0;
                      _tipAmount = 0;
                      _count = 1;
                      _tipPercentage = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 230, 87, 77),
                  ),
                  child: const Text(
                    "Reset",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
