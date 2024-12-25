import 'package:flutteer_day10/pages/list_pages.dart';
import 'package:flutteer_day10/pages/signup.dart';
import 'package:flutteer_day10/service/database.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await dotenv.load(fileName:'.env'); 
   await Supabase.initialize(
    url: dotenv.env['supabaseURL']!
,
    anonKey: dotenv.env['supabaseKey']!,

  );
  Database().gatData();
    runApp(const MainApp());

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Signup(),
    );
  }
}
