import 'package:aanma_nalam/View/booklist/videocustomcontroller.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoFile extends StatefulWidget {
  const VideoFile({super.key});

  @override
  State<VideoFile> createState() => _VideoFileState();
}

class _VideoFileState extends State<VideoFile> {
  VideoPlayerController? _controller;
  ChewieController? _chewieController;

  bool _showControls = false;
  bool _isBuffering = false;
  String? _error;
  bool _isVideoPlaying = false;

  void _forward() {
    final currentPosition = _controller!.value.position;
    final duration = _controller!.value.duration;
    final forwardPosition = currentPosition + const Duration(seconds: 10);
    _controller!
        .seekTo(forwardPosition < duration ? forwardPosition : duration);
  }

  void _rewind() {
    final currentPosition = _controller!.value.position;
    final rewindPosition = currentPosition - const Duration(seconds: 10);
    _controller!.seekTo(
        rewindPosition > Duration.zero ? rewindPosition : Duration.zero);
  }

  @override
  void initState() {
    super.initState();
    _playVideo('https://cdn.pixabay.com/video/2023/11/26/190776-888535446_tiny.mp4');
  }

  @override
  void dispose() {
    _controller?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  void _checkBufferingState() {
    if (_controller!.value.isBuffering) {
      setState(() {
        _isBuffering = true;
      });
    } else {
      setState(() {
        _isBuffering = false;
      });
    }
  }

  void _playVideo(String path) async {
    setState(() {
      _error = null;
      _isBuffering = true;
    });

    try {
      _controller?.dispose();
      _chewieController?.dispose();

      _controller = VideoPlayerController.networkUrl(Uri.parse(path));
      await _controller!.initialize();
      _controller!.addListener(_checkBufferingState);

      setState(() {
        _chewieController = ChewieController(
          videoPlayerController: _controller!,
          showControls: false,
          autoPlay: false,
          looping: false,
          allowFullScreen: false,
          allowedScreenSleep: true,
          fullScreenByDefault: false,
          aspectRatio: _controller!.value.aspectRatio,
        );
        _isVideoPlaying = true;
        _isBuffering = false;
      });

      _controller!.addListener(() {
        if (_controller!.value.position == _controller!.value.duration) {
          setState(() {
            _isVideoPlaying = false;
          });
        }
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isBuffering = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.onsecondary,
      appBar: AppBar(
        backgroundColor: AppTheme.onsecondary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppTheme.whitecolor),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.currentreadingbg,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: AppTheme.onsecondary,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                ),
                child: Text(
                  "May 2024 Issue",
                  style: TextStyle(
                    color: AppTheme.whitecolor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 230,
                child: _chewieController != null && _chewieController!.videoPlayerController.value.isInitialized
                    ? Stack(
                        children: [
                          Positioned.fill(
                            child: Chewie(controller: _chewieController!),
                          ),
                          if (_isBuffering)
                            Center(
                              child: CircularProgressIndicator(
                                color: Colors.grey[600],
                              ),
                            ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _showControls = !_showControls;
                              });
                            },
                            child: CustomControls(
                              chewieController: _chewieController!,
                              showControls: _showControls,
                              onForward: _forward,
                              onRewind: _rewind,
                              isBuffering: _isBuffering,
                            ),
                          ),
                          if (_isBuffering)
                            Center(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                height: 60,
                                width: 60,
                                child: CircularProgressIndicator(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
