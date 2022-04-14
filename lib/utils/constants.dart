import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoey/components/supabase_manager.dart';
import 'package:todoey/Models/task_data.dart';
import 'package:provider/provider.dart';

final supabase = Supabase.instance.client;

String user_id = '2dbfd106-63e8-4759-a992-7c2316d5edeb';
// String user_id = 'a';
getUserID(userId) {
  print('userId: $userId');
  // user_id = userId;
  print('user_id: $user_id');
}

extension ShowSnackBar on BuildContext {
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.teal,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ));
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}

var kBackgroundImage = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/pattern.jpg'),
    fit: BoxFit.cover,
  ),
);

SupabaseManager subabaseManager = SupabaseManager();

class GradiantAppBar extends StatelessWidget with PreferredSizeWidget {
  final String pageTitle;
  GradiantAppBar({
    required this.pageTitle,
  });

  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 130,
        flexibleSpace: Container(
          height: 400,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.greenAccent, Colors.teal],
            ),
          ),
          padding: EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    pageTitle,
                    style: GoogleFonts.lemonada(
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    child: Icon(
                      Icons.list,
                      color: Theme.of(context).colorScheme.primary,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
