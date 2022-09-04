import 'dart:io';
import 'package:camera/camera.dart';
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

class _CameraPageState extends State<CameraPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController? _controller;
  late var imagePath = '';
  bool openAudio = true; //是否开启音频
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
  List<CameraDescription>? cameras;
  late AnimationController _flashModeControlRowAnimationController;
  late Animation<double> _flashModeControlRowAnimation;
  late AnimationController _exposureModeControlRowAnimationController;
  late Animation<double> _exposureModeControlRowAnimation;
  late AnimationController _focusModeControlRowAnimationController;
  late Animation<double> _focusModeControlRowAnimation;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  double _currentExposureOffset = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    _flashModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _flashModeControlRowAnimation = CurvedAnimation(
      parent: _flashModeControlRowAnimationController,
      curve: Curves.easeInCubic,
    );
    _exposureModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _exposureModeControlRowAnimation = CurvedAnimation(
      parent: _exposureModeControlRowAnimationController,
      curve: Curves.easeInCubic,
    );
    _focusModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _focusModeControlRowAnimation = CurvedAnimation(
      parent: _focusModeControlRowAnimationController,
      curve: Curves.easeInCubic,
    );

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    //3.定义动画范围
    _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(_fadeController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //动画执行结束时反向执行动画
          _fadeController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          //动画恢复到初始状态时执行动画（正向）
          _fadeController.forward();
        }
      });

    _fadeController.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    _flashModeControlRowAnimationController.dispose();
    _exposureModeControlRowAnimationController.dispose();
    _focusModeControlRowAnimationController.dispose();
    _fadeController.dispose();
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
      println.i('inactive');
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      println.i('resumed');
      onNewCameraSelected(cameraController.description);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _controller == null
          ? FutureBuilder(
              future: initCamera(),
              builder: (context, snapshot) {
                //初始化完成 展示相机预览  否则显示加载指示器
                if (snapshot.connectionState == ConnectionState.done &&
                    _controller != null) {
                  return cameraPage(_controller!);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })
          : cameraPage(_controller!),
    );
  }

  ///页面
  Widget cameraPage(CameraController controller) {
    return Column(
      children: [configWidget, cameraPreWidget, operateWidget],
    );
  }

  ///操作列表
  Widget get _operateListWidget {
    return SizeTransition(
      sizeFactor: _focusModeControlRowAnimation,
      child: GridView(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 9,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            childAspectRatio: 1),
        shrinkWrap: true,
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
            color: Colors.white,
            onPressed: isVideoRecording
                ? (_controller!.value.isRecordingPaused)
                    ? onResumeButtonPressed
                    : onPauseButtonPressed
                : null,
          ),
          IconButton(
            icon: const Icon(Icons.stop),
            color: Colors.white,
            onPressed: isVideoRecording ? onStopButtonPressed : null,
          ),
          IconButton(
            icon: const Icon(Icons.pause_presentation),
            color: _controller != null && _controller!.value.isPreviewPaused
                ? Colors.red
                : Colors.white,
            onPressed: _controller == null ? null : onPausePreviewButtonPressed,
          ),
          IconButton(
            icon: const Icon(Icons.flash_off),
            color: _controller?.value.flashMode == FlashMode.off
                ? Colors.red
                : Colors.white,
            onPressed: _controller != null
                ? () => onSetFlashModeButtonPressed(FlashMode.off)
                : null,
          ),
          IconButton(
            icon: const Icon(Icons.flash_auto),
            color: _controller?.value.flashMode == FlashMode.auto
                ? Colors.red
                : Colors.white,
            onPressed: _controller != null
                ? () => onSetFlashModeButtonPressed(FlashMode.auto)
                : null,
          ),
          IconButton(
            icon: const Icon(Icons.flash_on),
            color: _controller?.value.flashMode == FlashMode.always
                ? Colors.red
                : Colors.white,
            onPressed: _controller != null
                ? () => onSetFlashModeButtonPressed(FlashMode.always)
                : null,
          ),
          IconButton(
            icon: const Icon(Icons.highlight),
            color: _controller?.value.flashMode == FlashMode.torch
                ? Colors.red
                : Colors.white,
            onPressed: _controller != null
                ? () => onSetFlashModeButtonPressed(FlashMode.torch)
                : null,
          ),
          IconButton(
            icon: const Icon(Icons.blur_on),
            color: _controller?.value.exposureMode == ExposureMode.auto
                ? Colors.red
                : Colors.white,
            onPressed: _controller != null
                ? () => onSetExposureModeButtonPressed(ExposureMode.auto)
                : null,
          ),
          IconButton(
            icon: const Icon(Icons.blur_off),
            color: _controller?.value.exposureMode == ExposureMode.locked
                ? Colors.red
                : Colors.white,
            onPressed: _controller != null
                ? () => onSetExposureModeButtonPressed(ExposureMode.locked)
                : null,
          ),
          IconButton(
            icon: const Icon(Icons.blur_circular),
            color: Colors.white,
            onPressed: _controller != null
                ? () =>_controller!.setExposureOffset(0.0)
                : null,
          ),
          IconButton(
            icon: const Icon(Icons.filter_center_focus),
            color: _controller?.value.focusMode == FocusMode.auto
                ? Colors.red
                : Colors.white,
            onPressed: _controller != null
                ? () => onSetFocusModeButtonPressed(FocusMode.auto)
                : null,
          ),
          IconButton(
            icon: const Icon(Icons.gps_off),
            color: _controller?.value.focusMode == FocusMode.locked
                ? Colors.red
                : Colors.white,
            onPressed: _controller != null
                ? () => onSetFocusModeButtonPressed(FocusMode.locked)
                : null,
          ),
          IconButton(
            icon: Icon(openAudio ? Icons.volume_up : Icons.volume_mute),
            color: Colors.white,
            onPressed: _controller != null ? onAudioModeButtonPressed : null,
          ),
          IconButton(
            icon: Icon(_controller?.value.isCaptureOrientationLocked ?? false
                ? Icons.screen_lock_rotation
                : Icons.screen_rotation),
            color: Colors.white,
            onPressed: _controller != null
                ? onCaptureOrientationLockButtonPressed
                : null,
          ),
          IconButton(
            icon: Icon(Icons.camera_rear),
            color: _controller!.description.lensDirection == CameraLensDirection.back ? Colors.red: Colors.white,
            onPressed: onCameraLensDirectionBack,
          ),
          IconButton(
            icon: Icon(Icons.camera_front),
            color:_controller!.description.lensDirection == CameraLensDirection.front? Colors.red: Colors.white,
            onPressed: onCameraLensDirectionFront,
          ),
          IconButton(
            icon: Icon(Icons.camera),
            color: Colors.white,
            onPressed: onCameraLensDirectionExternal,
          ),
        ],
      ),
    );
  }

  ///操作
  Widget get operateWidget {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          picturePre,
          IconButton(
            iconSize: 150.r,
            icon: Image.asset(Images.takePhone),
            onPressed: isControllerInit ? onTakePictureButtonPressed : null,
          ),
          IconButton(
            iconSize: 120.r,
            icon: Icon(
              Icons.flip_camera_ios_rounded,
              color: Colors.white,
            ),
            onPressed: isControllerInit ? swapCamera : null,
          ),
        ],
      ),
    );
  }

  /// 镜头切换
  void swapCamera() {
    if (_controller?.description.lensDirection == CameraLensDirection.back) {
      onCameraLensDirectionFront();
    } else {
      onCameraLensDirectionBack();
    }
  }

  ///预览照片
  Widget get picturePre {
    if (imageFile == null) {
      return Image.asset(
        Images.logo,
        width: 120.r,
        height: 120.r,
      );
    } else {
      return SizedBox(
        width: 120.r,
        height: 120.r,
        child: (videoController == null)
            ? Image.file(File(imageFile!.path))
            : Container(
                child: Center(
                  child: AspectRatio(
                      aspectRatio: videoController?.value.size != null
                          ? videoController!.value.aspectRatio
                          : 1.0,
                      child: VideoPlayer(videoController!)),
                ),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.pink)),
              ),
      );
    }
  }

  ///非视频录制判断
  bool get isControllerInit {
    return _controller != null &&
        _controller!.value.isInitialized &&
        !_controller!.value.isRecordingVideo;
  }

  ///视频录制帕努单
  bool get isVideoRecording {
    return _controller != null &&
        _controller!.value.isInitialized &&
        _controller!.value.isRecordingVideo;
  }

  ///相机预览页
  Widget get cameraPreWidget {
    return Expanded(
      flex: 6,
      child: Stack(
        children: [
          Container(
              width: 1.sw,
              height: 1.sh,
              child: Listener(
                onPointerDown: (_) => _pointers++,
                onPointerUp: (_) => _pointers--,
                child: CameraPreview(
                  _controller!,
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
          IgnorePointer(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SvgPicture.asset(
                Svgs.focus,
                semanticsLabel: 'focus icon',
                fit: BoxFit.fill,
                color: isVideoRecording?Colors.red:Colors.white,
              ),
            ) ,
          )
        ],
      ),
    );
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _baseScale = _currentScale;
    print('_baseScale $_baseScale');
  }

  Future<void> _handleScaleUpdate(ScaleUpdateDetails details) async {
    // println.w('_pointers $_pointers');
    // When there are not exactly two fingers on screen don't scale
    if (_controller == null || _pointers != 2) {
      return;
    }
    println.w(
        'scale= ${details.scale} _baseScale= $_baseScale _minAvailableZoom= $_minAvailableZoom _maxAvailableZoom= $_maxAvailableZoom');
    _currentScale = (_baseScale * details.scale)
        .clamp(_minAvailableZoom, _maxAvailableZoom);
    println.e('_currentScale $_currentScale');
    await _controller!.setZoomLevel(_currentScale);
  }

  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    if (_controller == null) {
      return;
    }

    // final CameraController cameraController = _controller!;

    final Offset offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    print('offset ${offset.dy}');
    _controller?.setExposurePoint(offset);
    _controller?.setFocusPoint(offset);
  }

  ///相机配置
  Widget get configWidget {
    return Container(
      margin: EdgeInsets.only(top: 30.r),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.flash_on),
                color: Colors.white,
                onPressed: onFlashModeButtonPressed,
              ),
              IconButton(
                icon: Icon(Icons.keyboard_arrow_up_rounded),
                color: Colors.white,
                onPressed: onOperListButtonPressed,
              ),
              IconButton(
                icon: Icon(Icons.exposure),
                color: Colors.white,
                onPressed: onExposureModeButtonPressed,
              )
            ],
          ),
          _flashModeControlRowWidget,
          _exposureModeControlRowWidget,
          _operateListWidget
        ],
      ),
    );
  }

  ///操作列表点击
  void onOperListButtonPressed() {
    if (_focusModeControlRowAnimationController.value == 1) {
      _focusModeControlRowAnimationController.reverse();
    } else {
      _focusModeControlRowAnimationController.forward();
      _flashModeControlRowAnimationController.reverse();
      _exposureModeControlRowAnimationController.reverse();
    }
  }

  ///曝光模式点击事件
  void onExposureModeButtonPressed() {
    if (_exposureModeControlRowAnimationController.value == 1) {
      _exposureModeControlRowAnimationController.reverse();
    } else {
      _exposureModeControlRowAnimationController.forward();
      _flashModeControlRowAnimationController.reverse();
      _focusModeControlRowAnimationController.reverse();
    }
  }

  ///曝光布局
  Widget get _exposureModeControlRowWidget {
    return SizeTransition(
      sizeFactor: _exposureModeControlRowAnimation,
      child: ClipRect(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  TextButton(
                    child: const Text('AUTO', style: TextStyle(color: Colors.white,)),
                    onPressed: _controller != null
                        ? () =>
                            onSetExposureModeButtonPressed(ExposureMode.auto)
                        : null,
                    onLongPress: () {
                      if (_controller != null) {
                        _controller!.setExposurePoint(null);
                        showInSnackBar(context, 'Resetting exposure point');
                      }
                    },
                  ),
                  TextButton(
                    child: const Text('LOCKED',
                        style: TextStyle(color: Colors.white)),
                    onPressed: _controller != null
                        ? () =>
                            onSetExposureModeButtonPressed(ExposureMode.locked)
                        : null,
                  ),
                  TextButton(
                    child: const Text('RESET OFFSET',
                        style: TextStyle(color: Colors.white)),
                    onPressed: _controller != null
                        ? () => _controller!.setExposureOffset(0.0)
                        : null,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(_minAvailableExposureOffset.toString(),
                      style: TextStyle(color: Colors.white)),
                  Slider(
                    inactiveColor: Colors.white,
                    value: _currentExposureOffset,
                    min: _minAvailableExposureOffset,
                    max: _maxAvailableExposureOffset,
                    label: _currentExposureOffset.toString(),
                    onChanged: _minAvailableExposureOffset ==
                            _maxAvailableExposureOffset
                        ? null
                        : setExposureOffset,
                  ),
                  Text(_maxAvailableExposureOffset.toString(),
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///曝光进度
  Future<void> setExposureOffset(double offset) async {
    if (_controller == null) {
      return;
    }

    setState(() {
      _currentExposureOffset = offset;
    });
    try {
      offset = await _controller!.setExposureOffset(offset);
    } on CameraException catch (e) {
      showInSnackBar(context, 'Error: ${e.code}\n${e.description}');
      rethrow;
    }
  }

  ///闪光模式选择
  Widget get _flashModeControlRowWidget {
    return SizeTransition(
      sizeFactor: _flashModeControlRowAnimation,
      child: ClipRect(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.flash_off),
              color: _controller?.value.flashMode == FlashMode.off
                  ? Colors.red
                  : Colors.white,
              onPressed: _controller != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.off)
                  : null,
            ),
            IconButton(
              icon: const Icon(Icons.flash_auto),
              color: _controller?.value.flashMode == FlashMode.auto
                  ? Colors.red
                  : Colors.white,
              onPressed: _controller != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.auto)
                  : null,
            ),
            IconButton(
              icon: const Icon(Icons.flash_on),
              color: _controller?.value.flashMode == FlashMode.always
                  ? Colors.red
                  : Colors.white,
              onPressed: _controller != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.always)
                  : null,
            ),
            IconButton(
              icon: const Icon(Icons.highlight),
              color:  _controller?.value.flashMode == FlashMode.torch
                  ? Colors.red
                  : Colors.white,
              onPressed: _controller != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.torch)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  ///闪光模式点击事件
  void onFlashModeButtonPressed() {
    if (_flashModeControlRowAnimationController.value == 1) {
      _flashModeControlRowAnimationController.reverse();
    } else {
      _flashModeControlRowAnimationController.forward();
      _exposureModeControlRowAnimationController.reverse();
      _focusModeControlRowAnimationController.reverse();
    }
  }

  ///初始化相机
  Future<void> initCamera() async {
    //获取可用相机列表
    if (cameras == null) {
      cameras = await availableCameras();
    }
    //从可用相机列表中获取特定的相机
    CameraDescription cameraDescription = cameras!.first;
    await onNewCameraSelected(cameraDescription);
  }

  ///重启相机
  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    if (_controller != null) {
      await _controller!.dispose();
    }
    //创建并初始化控制器 传入：相机 分辨率 录制音频开启  图片输出格式
    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
      enableAudio: openAudio,
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
        Navigator.pop(context);
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
        ],
        cameraController
            .getMaxZoomLevel()
            .then((double value) => _maxAvailableZoom = value),
        cameraController
            .getMinZoomLevel()
            .then((double value) => _minAvailableZoom = value),
      ]);
    } on CameraException catch (e) {
      showInSnackBar(context, 'Error: ${e.code}\n${e.description}');
      Navigator.pop(context);
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

  /// 录制视频
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

    final VideoPlayerController vController =
        VideoPlayerController.file(File(videoFile!.path));

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
  void onSetFlashModeButtonPressed(FlashMode mode) async {
    try {
      await _controller!.setFlashMode(mode);
      if (mounted) {
        setState(() {});
      }
      showInSnackBar(
          context, 'Flash mode set to ${mode.toString().split('.').last}');
    } on CameraException catch (e) {
      showInSnackBar(context, 'Error: ${e.code}\n${e.description}');
      rethrow;
    }
  }

  ///  曝光模式
  void onSetExposureModeButtonPressed(ExposureMode mode) async {
    try {
      await _controller!.setExposureMode(mode);
      if (mounted) {
        setState(() {});
      }
      showInSnackBar(
          context, 'Exposure mode set to ${mode.toString().split('.').last}');
    } on CameraException catch (e) {
      showInSnackBar(context, 'Error: ${e.code}\n${e.description}');
      rethrow;
    }
  }

  /// 聚焦模式
  void onSetFocusModeButtonPressed(FocusMode mode) async {
    try {
      await _controller!.setFocusMode(mode);
      if (mounted) {
        setState(() {});
      }
      showInSnackBar(
          context, 'Focus mode set to ${mode.toString().split('.').last}');
    } on CameraException catch (e) {
      showInSnackBar(context, 'Error: ${e.code}\n${e.description}');
      rethrow;
    }
  }

  /// 声音模式
  void onAudioModeButtonPressed() {
    openAudio = !openAudio;
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
          showInSnackBar(context, 'Capture orientation unlocked');
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
  void onCameraLensDirectionBack() {
    for (CameraDescription cameraDescription in cameras!) {
      var lensDirection = cameraDescription.lensDirection;
      if (lensDirection == CameraLensDirection.back) {
        onNewCameraSelected(cameraDescription);
      }
    }
  }

  /// 前置摄像头
  void onCameraLensDirectionFront() {
    for (CameraDescription cameraDescription in cameras!) {
      var lensDirection = cameraDescription.lensDirection;
      if (lensDirection == CameraLensDirection.front) {
        onNewCameraSelected(cameraDescription);
      }
    }
  }

  /// 外部摄像头
  void onCameraLensDirectionExternal() {
    for (CameraDescription cameraDescription in cameras!) {
      var lensDirection = cameraDescription.lensDirection;
      if (lensDirection == CameraLensDirection.external) {
        onNewCameraSelected(cameraDescription);
      }
    }
  }
}
