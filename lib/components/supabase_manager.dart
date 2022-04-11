import 'package:supabase/supabase.dart';
import 'package:flutter/material.dart';

class SupabaseManager {
  static String supabaseUrl = 'https://akqgwjakzlijndpqptxi.supabase.co';
  static String supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFrcWd3amFremxpam5kcHFwdHhpIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NDk0MjExNjIsImV4cCI6MTk2NDk5NzE2Mn0.28KySaUFeXuIUPjVqKp6JOC4mevviutD5OjZRRacbo4';

  final client = SupabaseClient(supabaseUrl, supabaseKey);

  addData(String taskValue, String user_is, bool isDoneValue) {
    var response = client.from('tasks_table').insert({
      'task_column': taskValue,
      'user_id': user_is,
      'isDone_column': false,
    }).execute();
    print('$taskValue - $isDoneValue');
    print(response);
  }

  readData(user_id) async {
    var response = await client
        .from('tasks_table')
        .select()
        .eq('user_id', user_id)
        .execute();

    return response.data;
  }

  updateData(int id, bool isDoneValue) {
    var response = client
        .from('tasks_table')
        .update({'idDone_column': isDoneValue})
        .eq('id', id)
        .execute();
    print(response);
  }

  deleteData(int id) {
    var response = client.from('tasks_table').delete().eq('id', id).execute();
    print(response);
  }
}

// Select from table `countries` ordering by `name`
// final response =  client
//     .from('countries')
//     .select()
//     .order('name', ascending: true)
//     .execute();
