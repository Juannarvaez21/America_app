import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DirectPage extends StatefulWidget {
  const DirectPage({super.key});

  @override
  State<DirectPage> createState() => _DirectPageState();
}

class _DirectPageState extends State<DirectPage> {
  YoutubePlayerController? _controller;
  String _videoId = 'qRnzeJfuQ6c'; // Default video ID
  String _title = '';
  String _desc = '';
  bool _isLoading = true; // Loading indicator
  bool _isPlaying = false;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection('notes').doc('doc1').get().then((doc) {
      
      if (doc.exists) {
        _videoId = doc['ID'];
        _title = doc['Title'];
        _desc = doc['Description'];
        if (doc.exists) {
          _controller = YoutubePlayerController(
            initialVideoId: _videoId,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
              mute: false,
            ),
          )..addListener(() {
              if (mounted) {
                setState(() {});
              }
            });
          print('Controller initialized with video ID: $_videoId');
        } else {
          print('Invalid video ID: $_videoId');
        }
      } else {
        print('Document does not exist');
      }
      setState(() {
        _isLoading = false;
      });
    }).catchError((error) {
      print('Error retrieving document: $error');
      setState(() {
        _isLoading = false;
      });
    });
  }
  @override
  void dispose(){
    _controller?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
          body: Container(
            color: Color(0xFFE3E6FF),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                       if (_controller != null)
                              Container(
                                child: YoutubePlayer(
                                  controller: _controller!,
                                  showVideoProgressIndicator: true,
                                ),
                                  width: double.infinity,
                                height: 250,
                                color: Colors.black12,
                              )
                            else
                              const CircularProgressIndicator(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: Image.asset(
                              'assets/logo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                          width: 300,
                          height: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //Titulo
                              Center(
                                child: SizedBox(
                                  width: 390,
                                  child: Text(
                                    _title ?? '',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1A226C),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                  width: 390,
                                  child:Text(
                              _desc?? '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                fontSize: 15,
                                )
                              ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],

              ),
            ),
          ),
        )
    );
  }
}
