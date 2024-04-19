// ignore_for_file: prefer_const_constructors
import 'package:americastereo/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';
import 'package:google_fonts/google_fonts.dart';
class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});


  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}


class _AnimatedLogoState extends State<AnimatedLogo> with SingleTickerProviderStateMixin {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  late final AnimationController _controller;
  late final Animation<double> _rotationAnimation;
  bool _isRotating = false;


  @override
  void initState() {
    super.initState();
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
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }


  @override
  void dispose() {
    _audioPlayer.dispose();
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Container(
            width: 300,
            height: 340,
            decoration: BoxDecoration(
                color:Colors.white,
                border: Border.all(
                  width: 10,
                  color: Color(0xFF5C9DFF),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 264,
                  width: 236,
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 10,
                        color: Color(0xFF5C9DFF),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RotationTransition(
                        turns: _rotationAnimation,
                        child: Container(
                          height: 120,
                          width: 120,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xFF5C9DFF),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset("assets/logo.png"),
                        ),
                      )
                    ],
                  ),
                ),
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
                    setState(() {
                      _isRotating = !_isRotating;
                      if (_isRotating) {
                        _controller.repeat(reverse: false);
                      } else {
                        _controller.stop();
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5F97FF),
                    elevation: 5,
                    shape:CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                  child: Icon(
                    _isRotating ? Icons.pause : Icons.play_arrow_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

