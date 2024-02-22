// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:law/class/books.dart';
import 'package:law/class/contract.dart';
import 'package:law/class/decisionscouncilministers.dart';
import 'package:law/class/iraqbank.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'law.db');
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await _createTableIfNotExists(db, 'books',
        '''CREATE TABLE books (id INTEGER PRIMARY KEY,dscrp TEXT NOT NULL,files TEXT NOT NULL );''');
    await _createTableIfNotExists(db, 'coalitionprovisional',
        '''CREATE TABLE coalitionprovisional (id INTEGER PRIMARY KEY,dscrp TEXT NOT NULL)''');
    await _createTableIfNotExists(db, 'contract',
        '''CREATE TABLE contract (id INTEGER PRIMARY KEY,details TEXT NOT NULL,dscrp VARCHAR(150) NOT NULL);''');
    await _createTableIfNotExists(db, 'decisionscommand',
        '''CREATE TABLE decisionscommand (id INTEGER PRIMARY KEY,dscrp TEXT NOT NULL);''');
    await _createTableIfNotExists(db, 'decisionscouncil',
        '''CREATE TABLE decisionscouncil (id INTEGER PRIMARY KEY,dscrp TEXT NOT NULL);''');

    await _createTableIfNotExists(db, 'decisionscourtcassation',
        '''CREATE TABLE decisionscourtcassation (id INTEGER PRIMARY KEY,dscrp TEXT NOT NULL);''');
    await _createTableIfNotExists(db, 'decisionscourtcassationdetails',
        '''CREATE TABLE decisionscourtcassationdetails (id INTEGER PRIMARY KEY,title VARCHAR(250) NOT NULL,dscrp TEXT NOT NULL,files VARCHAR(250) NOT NULL,img VARCHAR(150) NOT NULL,decisionsCourtCassationID INTEGER NOT NULL);''');

    await _createTableIfNotExists(db, 'iraqbank',
        '''CREATE TABLE iraqbank (id INTEGER PRIMARY KEY,dscrp VARCHAR(250) NOT NULL);''');
    await _createTableIfNotExists(db, 'iraqbank_details',
        '''CREATE TABLE iraqbank_details (id INTEGER PRIMARY KEY,title VARCHAR(250) NOT NULL,dscrp TEXT NOT NULL,files VARCHAR(250) NOT NULL,img VARCHAR(150) NOT NULL,iraqBankID INTEGER NOT NULL);''');
    await _createTableIfNotExists(db, 'petitionslegalrequests',
        '''CREATE TABLE petitionslegalrequests (id INTEGER PRIMARY KEY,dscrp VARCHAR(150) NOT NULL,details TEXT NOT NULL);''');
    await _createTableIfNotExists(db, 'cases',
        '''CREATE TABLE cases (id INTEGER PRIMARY KEY,type VARCHAR(75) NOT NULL,price VARCHAR(75) NOT NULL,date VARCHAR(75) NOT NULL);''');
  }

  Future createCases() async {
    final db = await database;
    var tableExists = await _isTableExists(db, "cases");
    if (!tableExists) {
      await db.execute(
          '''CREATE TABLE cases (id INTEGER PRIMARY KEY,type VARCHAR(75) NOT NULL,price VARCHAR(75) NOT NULL,date VARCHAR(75) NOT NULL);''');
    }
  }

  Future<List<Map<String, dynamic>>> getCases() async {
    final db = await database;
    return db.query('cases');
  }

  Future insertcases(String type, String price, String date) async {
    final db = await database;
    final Map<String, dynamic> caseData = {
      'type': type,
      'price': price,
      'date': date,
    };
    await db.insert('cases', caseData,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteCases(int id) async {
    final db = await database;
    await db.delete(
      'cases',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future updatecases(int id, String type, String price, String date) async {
    final db = await database;
    final Map<String, dynamic> caseData = {
      'type': type,
      'price': price,
      'date': date,
    };
    await db.update(
      'cases',
      caseData,
      where: 'id = ?',
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> _createTableIfNotExists(
      Database db, String tableName, String createTableQuery) async {
    var tableExists = await _isTableExists(db, tableName);
    if (!tableExists) {
      await db.execute(createTableQuery);
    }
  }

  Future<bool> _isTableExists(Database db, String tableName) async {
    var result = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name='$tableName';",
    );
    return result.isNotEmpty;
  }

  Future<void> insertPetitionsLegalRequestsList(List data, String type) async {
    try {
      final db = await database;
      for (var entry in data) {
        await db.insert(type, entry.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

  Future<void> insertData(List<IraqBankData> dataList, String type,
      String type2, String wheretype2) async {
    if (dataList.isEmpty) return;

    final Database db = await database;
    for (IraqBankData data in dataList) {
      await db.insert(
        type,
        data.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      if (data.details != null) {
        for (IraqBankDataClass detail in data.details!) {
          await db.insert(
            type2,
            {
              'id': detail.id,
              'title': detail.title,
              'dscrp': detail.dscrp,
              'files': detail.files,
              'img': detail.img,
              wheretype2: data.id,
            },
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      }
    }
  }

  Future<List<IraqBankData>> fetchData(
      String type, String type2, String wheretypes) async {
    final Database db = await database;
    List<Map<String, dynamic>> decisionRows = await db.query(type);
    List<IraqBankData> dataList =
        decisionRows.map((e) => IraqBankData.fromJson(e)).toList();

    for (IraqBankData data in dataList) {
      List<Map<String, dynamic>> detailRows = await db.query(
        type2,
        where: '$wheretypes = ?',
        whereArgs: [data.id],
      );
      data.details =
          detailRows.map((e) => IraqBankDataClass.fromJson(e)).toList();
    }

    return dataList;
  }

  Future<List<ContractData>> getPetitionsLegalRequests(String type) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(type);
    return List.generate(maps.length, (i) {
      return ContractData(
        id: maps[i]['id'],
        dscrp: maps[i]['dscrp'],
        details: maps[i]['details'],
      );
    });
  }

  Future<List<BooksDataClass>> getBooksDataClass(String type) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(type);
    return List.generate(maps.length, (i) {
      return BooksDataClass(
        id: maps[i]['id'],
        dscrp: maps[i]['dscrp'],
        files: maps[i]['files'],
      );
    });
  }

  Future<List<DecisionsClass>> getDecisionsClass(String type) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(type);
    return List.generate(maps.length, (i) {
      return DecisionsClass(
        id: maps[i]['id'],
        dscrp: maps[i]['dscrp'],
      );
    });
  }
}
