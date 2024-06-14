import 'package:dataversa/src/controllers/response_controller.dart';
import 'package:flutter/gestures.dart';
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
        backgroundColor: Colors.white,
        title: const Text('Respostas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Pesquisar',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                responseController.searchResponses(value, sid);
              },
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                responseController.getResponses(sid);
              },
              child: Watch(
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
                              context.push('/form/$sid/${response.id}');
                            },
                            title: Text(
                              'Resposta ${response.id} - ${response.surveyId} - ${response.syncAt == null ? 'Não sincronizado' : 'Sincronizado'}',
                            ),
                          );
                        },
                      ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newResponse = await responseController.createResponse(sid);
          // ignore: use_build_context_synchronously
          context.push('/form/$sid/${newResponse['id']}');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
