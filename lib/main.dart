import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beyond Health',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.grey.shade100,
        fontFamily: 'Montserrat'
      ),
      home: const MyHomePage(title: 'Health Report'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //floatingActionButton: ElevatedButton(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title,style: const TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Text("You’re doing great, you’re \nbetter than most people!",
                        maxLines: 2,
                        style: TextStyle(fontSize: 15),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 75,
                        height: 75,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/circle2.png"),
                            fit: BoxFit.fill
                          )
                        ),
                         child: const Text("96",
                           style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                shadowColor: Colors.blueGrey,
                elevation: 1,
                child: Stack(
                  children:<Widget>[
                    ExpandablePanel(
                        header: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("Metabolism & \nWeight Control ",
                            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        collapsed: const CustomContainer(),
                        expanded: const CustomExpandedContainer()),
                    Positioned(
                      right: 15,
                        top: -70,
                        child: Image.asset("assets/heart.png",
                        width: MediaQuery.of(context).size.width/3,
                        height: MediaQuery.of(context).size.height/3,),
                    )
                  ]
                ),
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 0, 10),
          child: Stack(
            children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Lipid Profile • HbA1c • Glucose ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF51E672),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF51E672),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF51E672),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF51E672),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        // ignore: use_full_hex_values_for_flutter_colors
                        color: const Color(0xFF3359E960),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ]
          ),
        ),
      ],
    );
  }
}
class CustomExpandedContainer extends StatelessWidget {
  const CustomExpandedContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const CustomContainer(),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          color: Colors.grey.shade100,
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            spacing: 5,
            runSpacing: 15,
            children: const <Widget>[
              Details(str: "LDL Cholesterol ",str2: "Suboptimal",),
              Details(str : "HDL Cholesterol",str2: "Low",),
              Details(str: "Total Cholesterol ",str2: "Boderline",),
              Details(str: "Triglycerides", str2: "Suboptimal",),
              Details(str: "Glucose",str2: "Suboptimal",),
              Details(str: "HbA1c",str2: "Boderline",),
            ],
          ),
        )
      ],
    );
  }
}

class Details extends StatelessWidget {
  final String str;
  final String str2;

  const Details({Key? key , required this.str, required this.str2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width/3,
          height: MediaQuery.of(context).size.height/7,
          decoration: BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white, width: 2),
          ),
          alignment: Alignment.centerRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Text(str),
              const Text("65.05 mg/dl", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
              const Text("3.5-6.0", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10)),
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [
                        Color(0xFFF1F217),
                        Color(0xFF51E863)
                      ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child:  Text(str2),
              )
            ],
          ),
        ),
        Positioned(
            left: -20,
            top: 20,
            child:Image.asset('assets/pill.png',
              width: 50,
              height: 50,)
        ),
      ],
    );
  }
}

