import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;
import 'package:native_device_orientation/native_device_orientation.dart';
import 'dart:io';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? cameras;
  bool _isInitialized = false;
  bool useSensor = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    try {
      cameras = await availableCameras();
      _cameraController = CameraController(cameras![0], ResolutionPreset.high);
      await _cameraController!.initialize();
      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> takePicture(BuildContext context) async {
    if (!_cameraController!.value.isInitialized) {
      log("Controller is not initialized");
      return;
    }

    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String pictureDirectory = '${appDirectory.path}/Pictures';
    await Directory(pictureDirectory).create(recursive: true);
    final String filePath = '$pictureDirectory/${DateTime.now().millisecondsSinceEpoch}.png';

    if (_cameraController!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return;
    }

    try {
      final orientation = await NativeDeviceOrientationCommunicator().orientation(useSensor: true);

      XFile picture = await _cameraController!.takePicture();
      await saveImageWithCorrectOrientation(picture, filePath, orientation);
      Navigator.pop(context, filePath);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> saveImageWithCorrectOrientation(
      XFile picture, String filePath, NativeDeviceOrientation orientation) async {
    final img.Image capturedImage = img.decodeImage(await picture.readAsBytes())!;
    img.Image orientedImage;

    switch (orientation) {
      case NativeDeviceOrientation.landscapeLeft:
        orientedImage = img.copyRotate(capturedImage, angle: -90);
        break;
      case NativeDeviceOrientation.landscapeRight:
        orientedImage = img.copyRotate(capturedImage, angle: 90);
        break;
      case NativeDeviceOrientation.portraitDown:
        orientedImage = img.copyRotate(capturedImage, angle: 180);
        break;
      case NativeDeviceOrientation.portraitUp:
      default:
        orientedImage = capturedImage;
        break;
    }

    final File imageFile = File(filePath);
    await imageFile.writeAsBytes(img.encodePng(orientedImage));
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Widget buildCameraPreviewLandscape() {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            width: _cameraController!.value.previewSize!.width,
            height: _cameraController!.value.previewSize!.height,
            child: CameraPreview(
              _cameraController!,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => takePicture(context),
              child: const Text('Take a photo'),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () => takePicture(context),
              child: const Text('Take a photo'),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCameraPreviewPortrait() {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            width: _cameraController!.value.previewSize!.height,
            height: _cameraController!.value.previewSize!.width,
            child: CameraPreview(
              _cameraController!,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () => takePicture(context),
              child: const Text('Tirar foto'),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isInitialized
          ? NativeDeviceOrientedWidget(
              useSensor: useSensor,
              portrait: (context) => buildCameraPreviewPortrait(),
              landscape: (context) => buildCameraPreviewLandscape(),
              landscapeLeft: (p0) => buildCameraPreviewLandscape(),
              landscapeRight: (p0) => buildCameraPreviewLandscape(),
              portraitDown: (p0) => buildCameraPreviewPortrait(),
              portraitUp: (p0) => buildCameraPreviewPortrait(),
              fallback: (context) => const Center(child: CircularProgressIndicator()),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
