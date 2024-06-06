import 'package:dataversa/src/controllers/response_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

class ResponsesScreen extends StatefulWidget {
  const ResponsesScreen({super.key});

  @override
  State<ResponsesScreen> createState() => _ResponsesScreenState();
}

class _ResponsesScreenState extends State<ResponsesScreen> {
  final responseController = GetIt.I.get<ResponseController>();
  late int sid;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sid = GoRouterState.of(context).extra! as int;
      responseController.getResponses(sid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Respostas'),
      ),
      body: Watch(
        (context) => responseController.loading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : ListView.builder(
                itemCount: responseController.responses.length,
                itemBuilder: (context, index) {
                  final response = responseController.responses[index];
                  return ListTile(
                    onTap: () {
                      // Get.toNamed('/form', arguments: response.id);
                      context.push('/form/$sid/${response.id}');
                    },
                    title: Text('Resposta ${response.id} - ${response.surveyId}'),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          responseController.createResponse(sid);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
