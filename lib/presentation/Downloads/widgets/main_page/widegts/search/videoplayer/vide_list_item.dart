import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  final int index;
  final String videourl;
  const VideoListItem({super.key, required this.index, required this.videourl});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late VideoPlayerController _videoPlayerController;
  bool isVolumne = true;
  bool isPlay = true;

  @override
  void initState() {
    super.initState();
    videoController(videoPath: videoPathList[widget.index]);
  }

  void videoController({required String videoPath}) {
    // ignore: deprecated_member_use
    _videoPlayerController = VideoPlayerController.network(videoPath);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (value) {
        setState(() {
          _videoPlayerController.dispose();
        });
        videoController(videoPath: videoPathList[value]);
      },
      scrollDirection: Axis.vertical,
      children: List.generate(videoPathList.length, (index) {
        return Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: _videoPlayerController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController))
                  : CupertinoActivityIndicator(radius: 18,color: Colors.white,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      //left
                      child: CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(.5),
                          radius: 30,
                          child: IconButton(onPressed: (){
                            setState(() {
                              isVolumne=!isVolumne;
                            });
                            if(_videoPlayerController.value.volume==0.0){
                              _videoPlayerController.setVolume(1.0);
                            }else{
                              _videoPlayerController.setVolume(0.0);
                            }
                          }, icon: isVolumne?Icon(CupertinoIcons.volume_up,color: Colors.white,):Icon(CupertinoIcons.speaker_slash_fill))))

                  //right side
                  ,
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: CircleAvatar(
                            radius: 26,
                            backgroundImage: NetworkImage(
                                'https://image.tmdb.org/t/p/w600_and_h900_bestv2/sK6Nr6KNUA4WlAHyNBTioz9FK87.jpg'),
                          ),
                        ),
                        VideoActionWidget(
                            icon: Icons.emoji_emotions, title: "LOL"),
                        VideoActionWidget(icon: Icons.add, title: "My List"),
                        VideoActionWidget(icon: Icons.share, title: "Share"),
                        VideoActionWidget(icon: Icons.play_arrow, title: "Play")
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}

List<String> videoPathList = [
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
];
