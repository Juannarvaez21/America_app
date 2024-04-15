import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  YoutubePlayerController? _controller;
  String _videoId = 'qRnzeJfuQ6c'; // Default video ID
  bool _isLoading = true; // Loading indicator
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  double _volume = 1;
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
    _audioPlayer = AudioPlayer();
    _audioPlayer.setUrl('https://stream.zeno.fm/qsbc2m3zfs8uv?aw_0_req_lsid=446c570b484fe1efbda5b74e31074a53&acu-uid=842700154384&an-uid=5810593092026792886&mm-uid=bb596531-c744-4100-a670-86c6c6397f8a&dot-uid=09b322040079f74b81a21fe9&amb-uid=7712175030436544008&dbm-uid=CAESEGVm5qMf4EAAw2-23nMWXKo&cto-uid=e7275433-a417-4919-809b-84ff642b3014-65328ae3-5553&bsw-uid=fd61297c-a89c-4640-9ce3-1bef64b3c41a&dyn-uid=8588272448758273206&ttd-uid=cb36138f-af2b-4aac-a8c2-f4506c99d394&triton-uid=cookie%3A222f376a-c0af-4ffc-b212-9697b800b0d2&adt-uid=cuid_0fda2f72-6f53-11ee-9a16-12fa6b58ae11');
    _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.playing) {
        setState(() {
          _isPlaying = true;
        });
      } else {
        setState(() {
          _isPlaying = false;
        });
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Container(
          width: 100,
           child: Image.asset('assets/logo.png'),
        ),
             actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              color: Colors.indigo,
              icon: const Icon(Icons.share),
              onPressed: () {
                // Handle menu button press
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              color: Colors.indigo,
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Handle search button press
              },
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_controller != null)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: YoutubePlayer(
                  controller: _controller!,
                  showVideoProgressIndicator: true,
                ),
                width: 400,
                height: 200,
                color: Colors.black12,
              ),
            )
          else
            const CircularProgressIndicator(),
          ElevatedButton(
            onPressed: () {
              if (!_isPlaying) {
                _audioPlayer.play();
              } else {
                _audioPlayer.pause();
              }
              setState(() {
                _isPlaying = !_isPlaying;
              });
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: _isPlaying
                ? const Icon(
              Icons.pause,
              size: 30,
              color: Colors.indigo,
            )
                : const Icon(
              color: Colors.indigo,
              Icons.play_arrow,
              size: 30,
            ),
          ),
          Slider(
            value: _volume,
            onChanged: (value) {
              setState(() {
                _volume = value;
                _audioPlayer.setVolume(_volume);
              });
            },
            min: 0,
            max: 1,
            divisions: 10,
            label: _volume.toString(),
            activeColor: Colors.indigo,
            inactiveColor: Colors.black38,
            semanticFormatterCallback: (double newValue) {
              return 'Volume set to ${(newValue * 100).toInt()}%';
            },
          ),
        ],
      ),
    );
  }
}