import 'package:flutter/material.dart';

class ParametreProfile extends StatefulWidget {  const ParametreProfile({super.key});

@override
State<ParametreProfile> createState() => _ParametreProfileState();
}

class _ParametreProfileState extends State<ParametreProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paramètre du Profil"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Image.asset("assets/images/minecraft.jpg",
                    width: 460, height: 215)),
            const SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Mot de passe actuel",
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Mot de passe actuel ne doit pas etre vide";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nouveau mot de passe",
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Nouveau mot de passe ne doit pas etre vide";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Adresse de facturation",
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Adresse de facturation ne doit pas etre vide";
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a success message.
                  // You can add your logic to save the data here.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Modifications enregistrées avec succès !')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
              ),
              child: const Text("Enregistrer"),
            ),
          ],
        ),
      ),
    );
  }
}
