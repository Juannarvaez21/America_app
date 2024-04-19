import 'package:americastereo/DirectPage.dart';
import 'package:americastereo/RadioPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash(
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
     home:Scaffold(
       body: Container(
           color:Colors.blue,
           child: Navbar()),
     ),
    );
  }
}
class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> with SingleTickerProviderStateMixin{
  late TabController tabController;
  void initState(){
    tabController=TabController(length: 2, vsync: this);
    super.initState();
  }
  void dispose(){
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                DirectPage(),
                AnimatedLogo(),
              ],
            ),),
          Container(
            width: 400,
            height: 80,
            color: Colors.blue,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 280,
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100.0), // Adjust the values as needed
                        topRight: Radius.circular(100.0), // Adjust the values as needed
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Container(
                            width: 162,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade600,
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0,3 ),
                                ),
                              ],
                            ),
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TabBar(
                                  unselectedLabelColor: Colors.white,//color cuando no esta seleccionado
                                  labelColor: Colors.blue,//cuando este seleccioando
                                  indicatorWeight: 1,
                                  indicator: BoxDecoration(
                                      color:Colors.white,
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  controller: tabController,
                                  tabs: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      child: Icon(
                                        Icons.tv,
                                        size: 25,
                                      ),
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      child: Icon(
                                        Icons.radio,
                                        size: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
  }
}
