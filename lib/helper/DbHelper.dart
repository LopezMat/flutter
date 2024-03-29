
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/Utilisateur.dart';

class DbHelper {
  DbHelper._privateConstructor();

  static final DbHelper instance = DbHelper._privateConstructor();

  static Database? _db;
  static const String TABLERECETTE = "recette";
  static const String TABLEUSER = "utilisateur";
  static const String DBNAME = "recette.db";

  Future<Database> get db async => _db ??= await initDb();

  initDb() async {
    print("initialisation de la base");
    //on va utiliser le path_provider pour sauvegarder les fichier dans le document du téléphone
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DBNAME);
    print(path);
    Database db = await openDatabase(path, version: 1, onCreate: _onCreate);
    //await afterDbCreate(db);
    return db;
  }

  //fonction de creation de la base
  _onCreate(Database db, int version) async {
    print('creation de la base');
    try {
      await db.execute(
          """CREATE TABLE IF NOT EXISTS $TABLERECETTE (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          titre TEXT, description TEXT, duree INTEGER, ingredients TEXT, image TEXT);
          """);
      await db.execute(
          """CREATE TABLE IF NOT EXISTS $TABLEUSER (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nom TEXT, prenom TEXT, login TEXT, pass TEXT);
          """);
    }catch (e) {
      print("erreur de création de table : $e");
    }
    print("fin de creation de la base");
  }

  Future<int> insertUser(Utilisateur user) async {
    Database? db = await DbHelper.instance.db;
    return await db!.insert(TABLEUSER, user.toMap(), conflictAlgorithm: ConflictAlgorithm.abort);
  }

  Future<List<Utilisateur>> getUsers() async { //recupere tous les utilisateurs par ordre alphabétique
    Database? db = await DbHelper.instance.db;
    List<Map<String, dynamic>> maps = await db!.query(TABLEUSER, orderBy: "nom");
    return List.generate(maps.length, (i) {
      return Utilisateur.fromMap(maps[i]);
    });
  }

}