import 'package:clean_architecture_fluterando/modules/search/presenter/search/search_cubit.dart';
import 'package:clean_architecture_fluterando/modules/search/presenter/search/states/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final cubit = Modular.get<SearchCubit>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesquisar no github"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 8, top: 10),
            child: TextField(
              onChanged: (value) => cubit.searchByText(value),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Pesquisar..."),
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: cubit.stream,
                builder: (context, snapshot) {
                  final state = cubit.state;

                  if (state is SearchStateStart) {
                    return const Center(
                      child: Text('Digite um nome no campo de busca'),
                    );
                  }
                  if (state is SearchStateError) {
                    return const Center(
                      child: Text('Desculpe! Ocorreu um erro'),
                    );
                  }
                  if (state is SearchStateLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final list = (state as SearchStateSuccess).list;
                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (_, id) {
                        final item = list[id];
                        return ListTile(
                          leading: item.img == null
                              ? Container()
                              : CircleAvatar(
                                  backgroundImage: NetworkImage(item.img ?? ""),
                                ),
                          title: Text(item.title ?? ""),
                          subtitle: Text(item.content ?? ""),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
