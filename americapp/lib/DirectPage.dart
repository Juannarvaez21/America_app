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
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor:  Colors.blue,
            title: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
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
                    padding: EdgeInsets.only(top: 0),

                    child: Column(
                      children: [
                         if (_controller != null)
                                Container(
                                  child: YoutubePlayer(
                                    controller: _controller!,
                                    showVideoProgressIndicator: true,
                                  ),
                                    width: double.infinity,
                                  height: 200,
                                  color: Colors.black12,
                                )
                              else
                                const CircularProgressIndicator(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Titulo
                          Container(
                            width: 390,
                            child: Text(
                                                    _title?? '',
                                                    style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                            )
                                                    ),
                          ),
                            SizedBox(height: 10,),
                            Container(
                                width: 390,
                                child:Text(
                            _desc?? '',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.normal
                              )
                            ),
                            )
                          ],
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
