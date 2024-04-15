import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  YoutubePlayerController? _controller;
  String _videoId = 'qRnzeJfuQ6c'; // Default video ID
  bool _isLoading = true; // Loading indicator

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection('notes').doc('doc1').get().then((doc) {
      if (doc.exists) {
        _videoId = doc['ID'];
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
  Widget build(BuildContext context) {
    print('Building HomePage widget');
    return Scaffold(
      appBar: AppBar(title: const Text("H O M E P A G E")),
      body: Column(
        children: [
          if (_isLoading)
            const CircularProgressIndicator(), // Loading indicator
          if (_controller != null)
            YoutubePlayer(
              controller: _controller!,
              showVideoProgressIndicator: true,
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}