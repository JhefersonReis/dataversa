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

  @override
  void initState() {
    super.initState();
    sincronizar.syncData();
    // surveyController.getSurveys();
    // readSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerTab(),
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: const Text(
          'Pesquisas',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Watch(
                (context) => sincronizar.loading.value ? const LinearProgressIndicator() : const SizedBox.shrink(),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     // surveyController.getSurveys();
              //   },
              //   child: const Text('Listar'),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     sincronizar.syncData();
              //   },
              //   child: const Text('Popular banco de dados'),
              // ),
              Watch(
                (context) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: surveyController.surveys.length,
                  itemBuilder: (context, index) {
                    final survey = surveyController.surveys[index];
                    return Card(
                      child: ListTile(
                        onTap: () {
                          // Get.toNamed('/responses', arguments: survey.sid);
                          context.push('/responses', extra: survey.sid);
                        },
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        tileColor: Colors.grey[350],
                        title: Text(survey.surveylsTitle),
                        subtitle: Text(survey.sid.toString()),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    );
                  },
                ),
              )
              // Obx(() {
              //   if (surveyController.surveys.isEmpty) {
              //     return const Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   }

              //   return ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: surveyController.surveys.length,
              //     itemBuilder: (context, index) {
              //       final survey = surveyController.surveys[index];
              //       return Card(
              //         child: ListTile(
              //           onTap: () {
              //             Get.toNamed('/responses', arguments: survey.sid);
              //           },
              //           shape: const RoundedRectangleBorder(
              //             borderRadius: BorderRadius.all(
              //               Radius.circular(10),
              //             ),
              //           ),
              //           tileColor: Colors.grey[350],
              //           title: Text(survey.surveylsTitle),
              //           subtitle: Text(survey.sid.toString()),
              //           trailing: const Icon(Icons.arrow_forward_ios),
              //         ),
              //       );
              //     },
              //   );
              // })
            ],
          ),
        ],
      ),
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
          // const DrawerHeader(
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //   ),
          //   child: Text(
          //     'DataVersa',
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 24,
          //     ),
          //   ),
          // ),
          ListTile(
            title: const Text('Pesquisas'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            tileColor: Colors.green,
            title: const Text('Criar database'),
            onTap: () {
              // getDatabase();
            },
          ),
          ListTile(
            tileColor: Colors.red,
            title: const Text('Deletar database'),
            onTap: () {
              // deleteDatabaseFunction();
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              // final Future<SharedPreferences> prefs =
              //     SharedPreferences.getInstance();
              // await prefs.then((SharedPreferences prefs) {
              //   prefs.clear();
              // });
              // Get.offNamed('/login');
              final isar = Isar.getInstance();
              final authController = GetIt.I.get<AuthController>();
              final surveyController = GetIt.I.get<SurveyController>();
              isar!.writeTxn(() => isar.clear());
              context.go('/auth');
              authController.logged.set(false);
              surveyController.resetSurveys();
            },
          ),
        ],
      ),
    );
  }
}
