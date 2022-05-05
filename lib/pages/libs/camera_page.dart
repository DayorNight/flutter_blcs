import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/static.dart';
import 'package:flutter_blcs/common/utils/print.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class CameraPage extends StatefulWidget {
  static const keys = 'CameraPage';

  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> with WidgetsBindingObserver {
  CameraController? _controller;
  late var imagePath = '';
  bool enableAudio = true; //是否开启音频
  double _minAvailableExposureOffset = 0.0; //最小曝光偏移量
  double _maxAvailableExposureOffset = 0.0; //最大曝光偏移量
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  double _currentScale = 1.0;
  double _baseScale = 1.0;
  int _pointers = 0;
  XFile? imageFile;
  XFile? videoFile;
  VideoPlayerController? videoController;
  VoidCallback? videoPlayerListener;
  late List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    _controller?.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  ///当系统将应用程序放到后台或返回应用程序到前台时调用
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = _controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
    println.e('xxxxxxx');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
          future: initCamera(),
          builder: (context, snapshot) {
            //初始化完成 展示相机预览  否则显示加载指示器
            if (snapshot.connectionState == ConnectionState.done &&
                _controller != null) {
              return cameraPage(_controller!);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  ///页面
  Widget cameraPage(CameraController controller) {
    return Column(
      children: [
        operateListWidget,
        configWidget,
        cameraPreWidget,
        operateWidget
      ],
    );
  }

  ///操作列表
  Widget get operateListWidget {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 9,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 1),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        IconButton(
          color: Colors.white,
          icon: const Icon(Icons.videocam),
          onPressed: isControllerInit ? onVideoRecordButtonPressed : null,
        ),
        IconButton(
          icon: _controller != null && _controller!.value.isRecordingPaused
              ? const Icon(Icons.play_arrow)
              : const Icon(Icons.pause),
          color: Colors.blue,
          onPressed: isControllerInit
              ? (_controller!.value.isRecordingPaused)
                  ? onResumeButtonPressed
                  : onPauseButtonPressed
              : null,
        ),
        IconButton(
          icon: const Icon(Icons.stop),
          color: Colors.red,
          onPressed: isControllerInit ? onStopButtonPressed : null,
        ),
        IconButton(
          icon: const Icon(Icons.pause_presentation),
          color:
          _controller != null && _controller!.value.isPreviewPaused
              ? Colors.red
              : Colors.blue,
          onPressed:
          _controller == null ? null : onPausePreviewButtonPressed,
        ),
        IconButton(
          icon: const Icon(Icons.flash_off),
          color: _controller?.value.flashMode == FlashMode.off
              ? Colors.orange
              : Colors.blue,
          onPressed: _controller != null
              ? () => onSetFlashModeButtonPressed(FlashMode.off)
              : null,
        ),
        IconButton(
          icon: const Icon(Icons.flash_auto),
          color: _controller?.value.flashMode == FlashMode.auto
              ? Colors.orange
              : Colors.blue,
          onPressed: _controller != null
              ? () => onSetFlashModeButtonPressed(FlashMode.auto)
              : null,
        ),
        IconButton(
          icon: const Icon(Icons.flash_on),
          color: _controller?.value.flashMode == FlashMode.always
              ? Colors.orange
              : Colors.blue,
          onPressed: _controller != null
              ? () => onSetFlashModeButtonPressed(FlashMode.always)
              : null,
        ),
        IconButton(
          icon: const Icon(Icons.highlight),
          color: _controller?.value.flashMode == FlashMode.torch
              ? Colors.orange
              : Colors.blue,
          onPressed: _controller != null
              ? () => onSetFlashModeButtonPressed(FlashMode.torch)
              : null,
        ),

        TextButton(
          child: const Text('曝光 AUTO'),
          onPressed: _controller != null
              ? () =>
              onSetExposureModeButtonPressed(ExposureMode.auto)
              : null,
          onLongPress: () {
            if (_controller != null) {
              _controller!.setExposurePoint(null);
              showInSnackBar(context,'Resetting exposure point');
            }
          },
        ),
        TextButton(
          child: const Text('曝光 LOCKED'),
          onPressed: _controller != null
              ? () =>
              onSetExposureModeButtonPressed(ExposureMode.locked)
              : null,
        ),
        TextButton(
          child: const Text('曝光 RESET OFFSET'),
          onPressed: _controller != null
              ? () => _controller!.setExposureOffset(0.0)
              : null,
        ),
        // IconButton(
        //   icon: const Icon(Icons.filter_center_focus),
        //   color: Colors.blue,
        //   onPressed:
        //   _controller != null ? onFocusModeButtonPressed : null,
        // ),
        TextButton(
          child: const Text('聚焦 AUTO'),
          onPressed: _controller != null
              ? () => onSetFocusModeButtonPressed(FocusMode.auto)
              : null,
          onLongPress: () {
            if (_controller != null) {
              _controller!.setFocusPoint(null);
            }
            showInSnackBar(context,'Resetting focus point');
          },
        ),
        TextButton(
          child: const Text('聚焦 LOCKED'),
          onPressed: _controller != null
              ? () => onSetFocusModeButtonPressed(FocusMode.locked)
              : null,
        ),
        IconButton(
          icon: Icon(enableAudio ? Icons.volume_up : Icons.volume_mute),
          color: Colors.blue,
          onPressed: _controller != null ? onAudioModeButtonPressed : null,
        ),
        IconButton(
          icon: Icon(_controller?.value.isCaptureOrientationLocked ?? false
              ? Icons.screen_lock_rotation
              : Icons.screen_rotation),
          color: Colors.blue,
          onPressed: _controller != null
              ? onCaptureOrientationLockButtonPressed
              : null,
        ),
        IconButton(
          icon: Icon(Icons.camera_rear),
          color: Colors.blue,
          onPressed: onCameraLensDirectionBack,
        ),
        IconButton(
          icon: Icon(Icons.camera_front),
          color: Colors.blue,
          onPressed: onCameraLensDirectionFront,
        ),
        IconButton(
          icon: Icon(Icons.camera),
          color: Colors.blue,
          onPressed: onCameraLensDirectionExternal,
        ),
      ],
    );
  }

  ///操作
  Widget get operateWidget {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        imageFile==null?Container():SizedBox(width:128.r,height: 128.r,child: (videoController == null)?Image.file(File(imageFile!.path)):Container(
          child: Center(
            child: AspectRatio(
                aspectRatio:
                videoController?.value.size != null
                    ? videoController!.value.aspectRatio
                    : 1.0,
                child: VideoPlayer(videoController!)),
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.pink)),
        ),),
        IconButton(
          iconSize: 150.r,
          icon: Image.asset(Images.takePhone),
          onPressed: isControllerInit ? onTakePictureButtonPressed : null,
        ),
        Icon(Icons.swap_horizontal_circle_outlined,color: Colors.white,size: 128.r,)
      ],
    );
  }

  ///判断是否初始化好
  bool get isControllerInit {
    return _controller != null &&
        _controller!.value.isInitialized &&
        !_controller!.value.isRecordingVideo;
  }


  ///相机预览页
  Widget get cameraPreWidget {
    return Container(
      width: 1.sw,
      height: 0.6.sh,
      child: Stack(
        children: [
          Container(
              width: 1.sw,
              child: CameraPreview(
                _controller!,
                child: Listener(
                  onPointerDown: (_) => _pointers++,
                  onPointerUp: (_) => _pointers--,
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onScaleStart: _handleScaleStart,
                      onScaleUpdate: _handleScaleUpdate,
                      onTapDown: (TapDownDetails details) =>
                          onViewFinderTap(details, constraints),
                    );
                  }),
                ),
              )),
          SvgPicture.asset(
            Svgs.focus,
            semanticsLabel: 'focus icon',
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _baseScale = _currentScale;
  }

  Future<void> _handleScaleUpdate(ScaleUpdateDetails details) async {
    // When there are not exactly two fingers on screen don't scale
    if (_controller == null || _pointers != 2) {
      return;
    }

    _currentScale = (_baseScale * details.scale)
        .clamp(_minAvailableZoom, _maxAvailableZoom);

    await _controller!.setZoomLevel(_currentScale);
  }

  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    if (_controller == null) {
      return;
    }

    final CameraController cameraController = _controller!;

    final Offset offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    cameraController.setExposurePoint(offset);
    cameraController.setFocusPoint(offset);
  }

  ///相机配置
  Widget get configWidget {
    return Row(
      children: [Text('xxxx'), Text('xxxx')],
    );
  }

  ///初始化相机
  Future<void> initCamera() async {
    //获取可用相机列表
    cameras = await availableCameras();
    //从可用相机列表中获取特定的相机
    CameraDescription cameraDescription = cameras.first;
    //创建并初始化控制器 传入：相机 分辨率 录制音频开启  图片输出格式
    _controller = CameraController(cameraDescription, ResolutionPreset.medium,
        enableAudio: enableAudio, imageFormatGroup: ImageFormatGroup.jpeg);
    //初始化控制器
    return await _controller?.initialize();
  }

  ///重启相机
  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    if (_controller != null) {
      await _controller!.dispose();
    }

    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
      enableAudio: enableAudio,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    _controller = cameraController;

    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (cameraController.value.hasError) {
        showInSnackBar(
            context, 'Camera error ${cameraController.value.errorDescription}');
      }
    });

    try {
      await cameraController.initialize();
      await Future.wait(<Future<Object?>>[
        // The exposure mode is currently not supported on the web.
        ...<Future<Object?>>[
          cameraController
              .getMinExposureOffset()
              .then((double value) => _minAvailableExposureOffset = value),
          cameraController
              .getMaxExposureOffset()
              .then((double value) => _maxAvailableExposureOffset = value)
        ]
      ]);
    } on CameraException catch (e) {
      showInSnackBar(context, 'Error: ${e.code}\n${e.description}');
    }
    if (mounted) {
      setState(() {});
    }
  }

  ///拍照
  void onTakePictureButtonPressed() async {
    try {
      final XFile file = await _controller!.takePicture();
      if (mounted) {
        setState(() {
          imageFile = file;
          videoController?.dispose();
          videoController = null;
        });
        showInSnackBar(context, 'Picture saved to ${file.path}');
      }
    } on CameraException catch (e) {
      showInSnackBar(context, 'Error: ${e.code}\n${e.description}');
      return null;
    }
  }

  /// 拍视频
  void onVideoRecordButtonPressed() async {
    try {
      await _controller!.startVideoRecording();
      if (mounted) {
        setState(() {});
      }
    } on CameraException catch (e) {
      showInSnackBar(context, 'Error: ${e.code}\n${e.description}');
      return;
    }
  }

  ///重启
  void onResumeButtonPressed() async {
    try {
      await _controller!.resumeVideoRecording();
      if (mounted) {
        setState(() {});
      }
    } on CameraException catch (e) {
      showInSnackBar(context, 'Error: ${e.code}\n${e.description}');
      rethrow;
    }
  }

  /// 暂停
  void onPauseButtonPressed() async {
    try {
      await _controller!.pauseVideoRecording();
      if (mounted) {
        setState(() {});
      }
    } on CameraException catch (e) {
      showInSnackBar(context, 'Error: ${e.code}\n${e.description}');
      rethrow;
    }
  }

  /// 停止
  void onStopButtonPressed() async {
    try {
      var file = await _controller!.stopVideoRecording();
      if (mounted) {
        setState(() {});
      }
      showInSnackBar(context, 'Video recorded to ${file.path}');
      videoFile = file;
      _startVideoPlayer();
    } on CameraException catch (e) {
      showInSnackBar(context, 'Error: ${e.code}\n${e.description}');
      return null;
    }
  }
  ///启动视频
  Future<void> _startVideoPlayer() async {
    if (videoFile == null) {
      return;
    }

    final VideoPlayerController vController = VideoPlayerController.file(File(videoFile!.path));

    videoPlayerListener = () {
      if (videoController != null && videoController!.value.size != null) {
        // Refreshing the state to update video player with the correct ratio.
        if (mounted) {
          setState(() {});
        }
        videoController!.removeListener(videoPlayerListener!);
      }
    };
    vController.addListener(videoPlayerListener!);
    await vController.setLooping(true);
    await vController.initialize();
    await videoController?.dispose();
    if (mounted) {
      setState(() {
        imageFile = null;
        videoController = vController;
      });
    }
    await vController.play();
  }
  /// 暂停预览
  Future<void> onPausePreviewButtonPressed() async {
    if (_controller!.value.isPreviewPaused) {
      await _controller?.resumePreview();
    } else {
      await _controller?.pausePreview();
    }
    if (mounted) {
      setState(() {});
    }
  }

  /// 闪光模式
  void onSetFlashModeButtonPressed(FlashMode mode) async{
    try {
      await _controller!.setFlashMode(mode);
      if (mounted) {
        setState(() {});
      }
      showInSnackBar(context, 'Flash mode set to ${mode.toString().split('.').last}');
    } on CameraException catch (e) {
      showInSnackBar(context, 'Error: ${e.code}\n${e.description}');
      rethrow;
    }
  }
  ///  曝光模式
  void onSetExposureModeButtonPressed(ExposureMode mode) async{
    try {
      await _controller!.setExposureMode(mode);
      if (mounted) {
        setState(() {});
      }
      showInSnackBar(context,'Exposure mode set to ${mode.toString().split('.').last}');
    } on CameraException catch (e) {
      showInSnackBar(context, 'Error: ${e.code}\n${e.description}');
      rethrow;
    }
  }
  /// 聚焦模式
  void onSetFocusModeButtonPressed(FocusMode mode) async{
    try {
      await _controller!.setFocusMode(mode);
      if (mounted) {
        setState(() {});
      }
      showInSnackBar(context,'Focus mode set to ${mode.toString().split('.').last}');
    } on CameraException catch (e) {
      showInSnackBar(context, 'Error: ${e.code}\n${e.description}');
      rethrow;
    }
  }
  /// 声音模式
  void onAudioModeButtonPressed() {
    enableAudio = !enableAudio;
    if (_controller != null) {
      onNewCameraSelected(_controller!.description);
    }
  }
  ///横竖切换锁住
  Future<void> onCaptureOrientationLockButtonPressed() async {
    try {
      if (_controller != null) {
        if (_controller!.value.isCaptureOrientationLocked) {
          await _controller!.unlockCaptureOrientation();
          showInSnackBar(context,'Capture orientation unlocked');
        } else {
          await _controller!.lockCaptureOrientation();
          showInSnackBar(context,
              'Capture orientation locked to ${_controller!.value.lockedCaptureOrientation.toString().split('.').last}');
        }
      }
    } on CameraException catch (e) {
      showInSnackBar(context, 'Error: ${e.code}\n${e.description}');
    }
  }
  /// 后置摄像头
  void onCameraLensDirectionBack(){
    for(CameraDescription cameraDescription in cameras){
        var lensDirection = cameraDescription.lensDirection;
        if(lensDirection == CameraLensDirection.back){
          onNewCameraSelected(cameraDescription);
        }
    }
  }
  /// 前置摄像头
  void onCameraLensDirectionFront(){
    for(CameraDescription cameraDescription in cameras){
      var lensDirection = cameraDescription.lensDirection;
      if(lensDirection == CameraLensDirection.front){
        onNewCameraSelected(cameraDescription);
      }
    }

  }
  /// 外部摄像头
  void onCameraLensDirectionExternal(){
    for(CameraDescription cameraDescription in cameras){
      var lensDirection = cameraDescription.lensDirection;
      if(lensDirection == CameraLensDirection.external){
        onNewCameraSelected(cameraDescription);
      }
    }
  }
}
