import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
 /* VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network('https://youtu.be/YLslsZuEaNE.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _videoPlayerController!.dispose();
  }*/

  String? videoId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=YLslsZuEaNE&t=1s");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("The ID of YouTube Video : $videoId");
  }

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'YLslsZuEaNE',
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
      enableCaption: true,
      loop: true,
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              liveUIColor: Colors.amber,
              progressIndicatorColor: Colors.green,
              topActions: [
                TextButton(onPressed: (){}, child: Text("Hello")),
                TextButton(onPressed: (){}, child: Text("World")),
                TextButton(onPressed: (){}, child: Text("Video")),
              ],
              thumbnail: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.green,
                child: const Center(
                  child: Text(" YouTube Video Player", style: TextStyle(fontSize: 24.0, color: Colors.white),),
                ),
              ),
            ),
            builder: (context, player){
              return Column(
                children: [
                 player,

                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget youtube_video() => YoutubePlayer(
    controller: _controller,
    showVideoProgressIndicator: true,
    liveUIColor: Colors.amber,
    progressIndicatorColor: Colors.green,
    topActions: [
      TextButton(onPressed: (){}, child: Text("Hello")),
      TextButton(onPressed: (){}, child: Text("World")),
      TextButton(onPressed: (){}, child: Text("Video")),
    ],
    thumbnail: Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      color: Colors.green,
      child: const Center(
        child: Text(" YouTube Video Player", style: TextStyle(fontSize: 24.0, color: Colors.white),),
      ),
    ),
  );

}
