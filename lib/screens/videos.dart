import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videos extends StatefulWidget {
  @override
  VideosState createState() => new VideosState();
}

class VideosState extends State<Videos> {
  late double screenHeight;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: "https://www.youtube.com/watch?v=JIAzI29-otM",
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    YoutubePlayerController _controller1 = YoutubePlayerController(
      initialVideoId: "https://www.youtube.com/watch?v=WaOxj6hKulY",
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
    YoutubePlayerController _controller2 = YoutubePlayerController(
      initialVideoId: "https://www.youtube.com/watch?v=RDQviTbHmOg",
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 239, 213, 255),
      body: Container(
        child: new SingleChildScrollView(
          child: new ConstrainedBox(
            constraints: new BoxConstraints(),
            child: new Container(
              margin: EdgeInsets.all(20),
              child: new Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Text(
                            'Watch these videos to get more information about your type of imposter syndrome and how you can deal with it',
                            style: GoogleFonts.comfortaa(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    YoutubePlayer(
                      controller: _controller,
                      liveUIColor: Colors.amber,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    YoutubePlayer(
                      controller: _controller1,
                      liveUIColor: Colors.amber,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    YoutubePlayer(
                      controller: _controller2,
                      liveUIColor: Colors.amber,
                    ),
                    // add form here
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
