import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'search_list_view_model.dart';

class SearchListScreen extends StatefulWidget {
  SearchListScreen({super.key});

  @override
  State<SearchListScreen> createState() => _SearchListScreenState();
}

class _SearchListScreenState extends State<SearchListScreen> {
  final _queryTextEditingController = TextEditingController();

  @override
  void dispose() {
    _queryTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchListViewModel>(); // ViewModel logic 1

    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 검색 1'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '검색어',
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  final query = _queryTextEditingController.text;
                  viewModel.onSearch(query);
                },
              ),
            ),
          ),
          Expanded(
            child: viewModel.isLoading ? Center(child: CircularProgressIndicator())
                : GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              children: viewModel.photo
                  .map((e) => ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                    e.url, fit: BoxFit.cover,
                                  ),
                  ))
                  .toList(), // ViewModel logic 2
            ),
          ),
        ],
      ),
    );
  }
}
