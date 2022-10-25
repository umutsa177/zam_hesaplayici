import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _controller;
  late TextEditingController _controller2;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade300,
        title: Text(
          "Zam Hesaplayıcı",
          style: baslikYaziTarzi(),
        ),
        centerTitle: true,
        titleSpacing: 4.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: 350,
              height: 100,
              child: Form(
                child: TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: "İlk değeri giriniz :",
                  ),
                  style: yaziTarzi(),
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: 350,
              height: 100,
              child: Form(
                child: TextFormField(
                  controller: _controller2,
                  decoration: const InputDecoration(
                    labelText: "Son değeri giriniz :",
                  ),
                  style: yaziTarzi(),
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                calculate(_controller, _controller2);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      "Zam Oranı %${calculate(_controller, _controller2).toString()}",
                      style: yaziTarzi()),
                  duration: const Duration(seconds: 2),
                  backgroundColor: Colors.blue,
                  elevation: 12.0,
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.purple,
              ),
              alignment: AlignmentDirectional.center,
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              fixedSize: MaterialStateProperty.all(const Size(3000, 30)),
              textStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 17, fontFamily: 'Poppins'),
              ),
            ),
            child: const Text(
              "Hesapla",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

calculate(TextEditingController cntrl, TextEditingController cntrl2) {
  num zam;
  num a = double.parse(cntrl.text);
  num b = double.parse(cntrl2.text);
  return zam = ((b - a) / a * 100);
}

TextStyle yaziTarzi() {
  return const TextStyle(
    fontSize: 30,
    fontFamily: "Poppins",
    fontStyle: FontStyle.italic,
    color: Colors.black,
  );
}

TextStyle baslikYaziTarzi() {
  return TextStyle(
    fontSize: 28,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w700,
    color: Colors.purple.shade700,
    backgroundColor: Colors.amber.shade300,
  );
}
