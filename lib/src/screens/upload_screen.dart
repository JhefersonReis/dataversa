import 'dart:developer';

import 'package:dataversa/src/repositories/sync.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  // late AnimationController controller;
  final sincronizar = GetIt.I.get<SyncFromServer>();

  @override
  void initState() {
    // controller = AnimationController(
    //   /// [AnimationController]s can be created with `vsync: this` because of
    //   /// [TickerProviderStateMixin].
    //   vsync: this,
    //   duration: const Duration(seconds: 5),
    // )..addListener(() {
    //     setState(() {});
    //   });
    // controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Data Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Upload your data here'),
            // LinearProgressIndicator(
            //   value: controller.value,
            // ),
            ElevatedButton(
              onPressed: () async {
                await sincronizar.uploadData();
                log('Data uploaded');
              },
              child: const Text('Sincronizar'),
            ),
          ],
        ),
      ),
    );
  }
}
