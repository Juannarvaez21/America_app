import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';

class DirectPage extends StatelessWidget {
  const DirectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor:  Colors.blue,
            title: SizedBox(
              width: 100,
              height: 100,
              child: Image.network(
                'assets/logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          body: Container(

            color: Colors.blue,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),

                    child: Column(
                      children: [
                        SizedBox(
                          width: 400,
                          child: Text(
                            'Explorando el Mundo del Postcat: Naturaleza y Tecnología en el Después',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                        Container(
                          width: 410,
                          height: 200,
                          color:Colors.black,
                        ),


                        Container(
                          width: 410,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 2,
                                  offset: Offset(0, 2),
                                )
                              ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Descripcion',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                  width: 390,
                                  child: Text("e estas criaturasdoica llena de curiosidades y sorpresas. ¡Prepárate para adentrarte en un mundo donde la naturaleza y la tecnología se entrelazan de manera inesperada!"         , textAlign: TextAlign.justify,))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],

              ),
            ),
          ),
        )
    );
  }
}
