import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
              child: SingleChildScrollView(
                padding: EdgeInsets.all(6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ButtonWithPicture(
                            pictureAddress:
                                'https://www.humangest.it/images/To-do-list.jpg',
                            colorFilterMode: ColorFilter.mode(
                                Colors.deepPurple[400]!, BlendMode.overlay),
                            navigatTo: '/taskscreen',
                            textTitle: 'TO DO List',
                            iconTitle: Icons.list,
                            buttonHight: 200.0,
                          ),
                          ButtonWithPicture(
                            pictureAddress:
                                'https://crepin.ir/wp-content/uploads/2020/11/DSC_6548-2-1.jpg',
                            colorFilterMode: ColorFilter.mode(
                                Colors.purple[400]!, BlendMode.colorBurn),
                            navigatTo: '/taskscreen',
                            textTitle: 'Bullet Journal',
                            iconTitle: Icons.menu_book,
                            buttonHight: 100.0,
                          ),
                          ButtonWithPicture(
                            pictureAddress:
                                'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTX-6FlB_URfm0xzk7yz2wdpllefHqJs02cwqOiNuNCi2rLW4TU',
                            colorFilterMode: ColorFilter.mode(
                                Colors.indigo[400]!, BlendMode.colorBurn),
                            navigatTo: '/taskscreen',
                            textTitle: 'Balance Of Life',
                            iconTitle: Icons.circle_notifications,
                            buttonHight: 150.0,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ButtonWithPicture(
                            pictureAddress:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkEdvhj1__eimJTZPaRsBFJreV4IRuPM6KLg&usqp=CAU',
                            colorFilterMode: ColorFilter.mode(
                                Colors.red[900]!, BlendMode.overlay),
                            navigatTo: '/taskscreen',
                            textTitle: 'Pomodoro',
                            iconTitle: Icons.access_alarms_sharp,
                            buttonHight: 250.0,
                          ),
                          ButtonWithPicture(
                            pictureAddress:
                                'https://pbs.twimg.com/profile_images/881291788744445952/LIMXum0r_400x400.jpg',
                            colorFilterMode: ColorFilter.mode(
                                Colors.red[900]!, BlendMode.overlay),
                            navigatTo: '/taskscreen',
                            textTitle: 'Ikigay',
                            iconTitle: Icons.data_usage,
                            buttonHight: 345.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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

class ButtonWithPicture extends StatelessWidget {
  final String pictureAddress;
  final colorFilterMode;
  final navigatTo;
  final textTitle;
  final iconTitle;
  final buttonHight;

  const ButtonWithPicture({
    required this.pictureAddress,
    required this.colorFilterMode,
    required this.navigatTo,
    required this.textTitle,
    required this.iconTitle,
    required this.buttonHight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: Colors.teal,
        image: DecorationImage(
          image: NetworkImage(pictureAddress),
          fit: BoxFit.cover,
          alignment: Alignment(0.3, 0),
          colorFilter: colorFilterMode,
        ),
      ),
      margin: EdgeInsets.all(6),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Color(0x856FE2D0)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, navigatTo);
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 10,
            bottom: buttonHight,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Icon(
                iconTitle,
                size: 30,
              ),
              Text(
                textTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.lemonada(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
