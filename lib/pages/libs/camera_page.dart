import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/print.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/pages/main/main_page.dart';
import '../../common/utils/code.dart';
import '../../generated/l10n.dart';
import '../../widgets/article_model.dart';

class CameraPage extends StatefulWidget {
  static const keys = 'CameraPage';

  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late var imagePath='';
  @override
  void initState() {
    super.initState();
    initCamera();
  }
  // image_picker
  ///初始化相机
  void initCamera() async {
    //获取可用相机列表
    // var list = await availableCameras();
    //从可用相机列表中获取特定的相机
    // var cameraDescription = list.first;
    //创建并初始化控制器 传入：相机 分辨率
    _controller = CameraController(cameras.first, ResolutionPreset.medium);
    //初始化控制器
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    // return ArticleModel(
    //   title: S.of(context).camera,
    //   keys: CameraPage.keys,
    //   logoColor: Theme.of(context).primaryColor,
    //   des: cameraDes,
    //   code: cameraCode,
    // );
    return Scaffold(
      appBar: getAppBar(context, 'title'),
      body: Container(
        // child: Image.file(File(imagePath)),
        child: FutureBuilder(future: _initializeControllerFuture,builder: (context, snapshot) {
          //初始化完成 展示相机预览  否则显示加载指示器
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final image = await _controller.takePicture();
            setState(() {
              imagePath = image.path;
              println.w('image.path $imagePath');
            });
            // Image.file(File(image.path))
          } catch (e) {
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
