import 'package:flutteer_day10/pages/list_pages.dart';
import 'package:flutteer_day10/service/database.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Supabase.initialize(
    url: "https://ufebkslushkgkboauujp.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVmZWJrc2x1c2hrZ2tib2F1dWpwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQzNTcyODMsImV4cCI6MjA0OTkzMzI4M30._MIJuLO2xSeZdNNffiPyhCKq2INUccFv50fhCwCiAz8",

  );
  Database().gatData();
    runApp(const MainApp());

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:ListPages(),
    );
  }
}
