import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:todoey/components/auth_required_state.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:todoey/utils/constants.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends AuthRequiredState<AccountPage> {
  final _usernameController = TextEditingController();
  final _websiteController = TextEditingController();
  var _loading = false;

  /// Called once a user id is received within `onAuthenticated()`
  Future<void> _getProfile(String userId) async {
    print(userId);
    //sending user id to costants
    getUserID(userId);
    setState(() {
      _loading = true;
    });
    final response = await supabase
        .from('profiles')
        .select()
        .eq('id', userId)
        .single()
        .execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data;
    if (data != null) {
      _usernameController.text = (data['username'] ?? '') as String;
      _websiteController.text = (data['website'] ?? '') as String;
    }
    setState(() {
      _loading = false;
    });
  }

  /// Called when user taps `Update` button
  Future<void> _updateProfile() async {
    setState(() {
      _loading = true;
    });
    final userName = _usernameController.text;
    final website = _websiteController.text;
    final user = supabase.auth.currentUser;
    final updates = {
      'id': user!.id,
      'username': userName,
      'website': website,
      'updated_at': DateTime.now().toIso8601String(),
    };
    final response = await supabase.from('profiles').upsert(updates).execute();
    final error = response.error;
    if (error != null) {
      context.showErrorSnackBar(message: error.message);
    } else {
      context.showSnackBar(message: 'Successfully updated profile!');
    }
    setState(() {
      _loading = false;
    });
  }

  Future<void> _signOut() async {
    final response = await supabase.auth.signOut();
    final error = response.error;
    if (error != null) {
      context.showErrorSnackBar(message: error.message);
    }
  }

  @override
  void onAuthenticated(Session session) {
    final user = session.user;
    if (user != null) {
      _getProfile(user.id);
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // toolbarHeight: 130,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'کرپین',
                style: GoogleFonts.lemonada(
                  textStyle: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 50,
              ),
            ],
          ),
          flexibleSpace: Container(
            // height: 400,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.greenAccent, Colors.teal],
              ),
            ),
            // padding: EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 10),
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.school),
              ),
              Tab(
                icon: Icon(Icons.construction),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),

        backgroundColor: Colors.green,
        // body: Center(child: Text('data')),

        body: TabBarView(
          children: [
            Container(
              decoration: kBackgroundImage,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                children: [
                  Text('آموزش‌ها'),
                  Container(
                    child: Row(
                      children: [
                        Card(
                          margin: EdgeInsets.all(20),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Image.network(
                                "https://c.tenor.com/0L7ORkuhrtUAAAAM/patrick-star-to-do-list.gif",
                                fit: BoxFit.fill),
                          ),
                          color: Colors.grey[300],
                          elevation: 10,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: kBackgroundImage,
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // color: Colors.teal,
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://www.humangest.it/images/To-do-list.jpg'),
                              fit: BoxFit.fitHeight,
                              alignment: Alignment(0.3, 0),
                              colorFilter: ColorFilter.mode(
                                  Colors.deepPurple[400]!, BlendMode.overlay),
                            ),
                          ),
                          margin: EdgeInsets.all(6),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0x856FE2D0)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/taskscreen');
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                top: 10,
                                bottom: 200,
                                left: 20,
                                right: 20,
                              ),
                              child: Column(
                                children: [
                                  Icon(Icons.list),
                                  Text(
                                    'TO DO List',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0x85CDE26F)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/taskscreen');
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(
                                  top: 10,
                                  bottom: 75,
                                  left: 10,
                                  right: 10,
                                ),
                                child: Column(
                                  children: [
                                    Icon(Icons.help_outline),
                                    Text(
                                      '-',
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(6),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0x856FC1E2)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/taskscreen');
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(
                                  top: 10,
                                  bottom: 450,
                                  left: 10,
                                  right: 10,
                                ),
                                child: Column(
                                  children: [
                                    Icon(Icons.access_alarms_sharp),
                                    Text(
                                      'Pomodoro',
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: kBackgroundImage,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              // color: Theme.of(context).colorScheme.surface,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(labelText: 'User Name'),
                    ),
                    const SizedBox(height: 18),
                    TextFormField(
                      controller: _websiteController,
                      decoration: const InputDecoration(labelText: 'Website'),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: _updateProfile,
                            child: Text(_loading ? 'Saving...' : 'Update')),
                        ElevatedButton(
                            onPressed: _signOut, child: const Text('Sign Out')),
                      ],
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
