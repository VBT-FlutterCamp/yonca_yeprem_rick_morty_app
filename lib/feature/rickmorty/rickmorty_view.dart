import 'package:flutter/material.dart';
import 'rickmorty_viewmodel.dart';

class RickMortyView extends RickMortyViewModel {
  bool isLoading = false;

  void changeLoading() {
    isLoading=!isLoading;
  }

  @override
  void initState() {
    fetchAllData();
    changeLoading();
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            fetchAllData();
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Rick and Morty"),
          centerTitle: true,
        ),
        body: isLoading ? ListView.builder(
          itemCount: characterList.length,
          itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
                  backgroundImage: NetworkImage(characterList[index].image ??
                      "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
                ),
            title: Text(characterList[index].name ?? ""),
          );
        }) : CircularProgressIndicator()
        );
  }
}
