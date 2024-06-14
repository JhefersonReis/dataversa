import 'package:dataversa/src/controllers/auth_controller.dart';
import 'package:dataversa/src/controllers/survey_controller.dart';
import 'package:dataversa/src/repositories/sync.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:signals/signals_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final sincronizar = GetIt.I.get<SyncFromServer>();
  final surveyController = GetIt.I.get<SurveyController>();
  final authController = GetIt.I.get<AuthController>();

  @override
  void initState() {
    super.initState();
    sincronizar.syncData();
    authController.logged.listen(context, _handleLogoutSignal);
  }

  void _handleLogoutSignal() {
    if (!authController.logged.value) {
      context.go('/auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const DrawerTab(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: const Text(
            'Pesquisas',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                sincronizar.syncData();
              },
            ),
          ],
        ),
        body: Watch.builder(
          builder: (context) {
            if (sincronizar.loading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: surveyController.surveys.length,
              itemBuilder: (context, index) {
                final survey = surveyController.surveys[index];
                return Card(
                  child: ListTile(
                    onTap: () {
                      context.push('/responses', extra: survey.sid);
                    },
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    title: Text(survey.surveylsTitle),
                    subtitle: Text(survey.sid.toString()),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                );
              },
            );
          },
        )
        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Stack(
        //       children: [
        //         // Center(
        //         //   child: Watch(
        //         //     (context) => sincronizar.loading.value ? const CircularProgressIndicator() : const SizedBox.shrink(),
        //         //   ),
        //         // ),
        //         // Watch(
        //         //   (context) => ListView.builder(
        //         //     shrinkWrap: true,
        //         //     padding: const EdgeInsets.all(8),
        //         //     itemCount: surveyController.surveys.length,
        //         //     itemBuilder: (context, index) {
        //         //       final survey = surveyController.surveys[index];
        //         //       return Card(
        //         //         child: ListTile(
        //         //           onTap: () {
        //         //             context.push('/responses', extra: survey.sid);
        //         //           },
        //         //           shape: const RoundedRectangleBorder(
        //         //             borderRadius: BorderRadius.all(
        //         //               Radius.circular(10),
        //         //             ),
        //         //           ),
        //         //           style: ListTileStyle.list,
        //         //           title: Text(survey.surveylsTitle),
        //         //           subtitle: Text(survey.sid.toString()),
        //         //           trailing: const Icon(Icons.arrow_forward_ios),
        //         //         ),
        //         //       );
        //         //     },
        //         //   ),
        //         // )
        //       ],
        //     ),
        //   ],
        // ),
        );
  }
}

class DrawerTab extends StatelessWidget {
  const DrawerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/logo_dataversa.png',
              // height: 12.0,
            ),
          ),
          ListTile(
            title: const Text('Pesquisas'),
            trailing: const Icon(Icons.article),
            onTap: () {
              context.go('/home');
              context.pop();
            },
          ),
          ListTile(
            title: const Text('Upload de Dados'),
            trailing: const Icon(Icons.upload),
            onTap: () {
              context.push('/upload');
              context.pop();
            },
          ),
          ListTile(
            title: const Text('Sair'),
            trailing: const Icon(Icons.exit_to_app, color: Colors.red),
            onTap: () {
              final isar = Isar.getInstance();
              final authController = GetIt.I.get<AuthController>();
              isar!.writeTxn(() => isar.clear());
              authController.logged.set(false);
              // final surveyController = GetIt.I.get<SurveyController>();
              // surveyController.resetSurveys();
            },
          ),
        ],
      ),
    );
  }
}
