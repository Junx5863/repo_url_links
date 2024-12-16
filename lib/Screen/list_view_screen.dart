import 'package:flutter/material.dart';
import 'package:git_hub_acctions_app/Services/car_rick_morty_services.dart';

class UserListScreen extends StatelessWidget {
  UserListScreen({super.key});
  final RickMortyServices rickMortyServices = RickMortyServices();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: rickMortyServices.getCharacterRickMorty(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final character = snapshot.data;
              return ListView.builder(
                itemCount: character!.results!.length,
                itemBuilder: (context, index) {
                  return componentCharacterList(
                    imageUrl: character.results![index].image!,
                    title: character.results![index].name!,
                    subtitle: character.results![index].type!,
                  );
                },
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget componentCharacterList({
    required String imageUrl,
    required String title,
    required String subtitle,
  }) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Imagen a la izquierda
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            // Contenedor de texto
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: Text(
                    subtitle,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
