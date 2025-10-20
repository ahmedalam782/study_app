// import 'dart:io';

// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// import '../../theme/app_colors.dart';

// class NormalVideoPlayer extends StatefulWidget {
//   final String videoSource;
//   final bool isFile;
//   final bool showControllers;

//   const NormalVideoPlayer({
//     super.key,
//     required this.videoSource,
//     this.isFile = false,
//     this.showControllers = true,
//   });

//   @override
//   NormalVideoPlayerState createState() => NormalVideoPlayerState();
// }

// class NormalVideoPlayerState extends State<NormalVideoPlayer> {
//   late VideoPlayerController _videoPlayerController;
//   ChewieController? _chewieController;

//   @override
//   void initState() {
//     super.initState();
//     _videoPlayerController = widget.isFile
//         ? VideoPlayerController.file(File(widget.videoSource))
//         : VideoPlayerController.networkUrl(
//             Uri.parse(widget.videoSource));

//     _videoPlayerController.initialize().then((_) {
//       setState(() {
//         _chewieController = ChewieController(
//           videoPlayerController: _videoPlayerController,
//           autoPlay: false,
//           looping: false,
//           showControls: widget.showControllers,
//         );
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     _chewieController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _chewieController != null
//         ? AspectRatio(
//             aspectRatio: 16 / 9,
//             child: Chewie(
//               controller: _chewieController!,
//             ),
//           )
//         : Center(
//             child: CircularProgressIndicator(
//               color: AppColors.primerColor,
//             ),
//           );
//   }
// }
