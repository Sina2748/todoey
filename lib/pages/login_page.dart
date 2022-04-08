import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase/supabase.dart';
import 'package:todoey/components/auth_state.dart';
import 'package:todoey/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends AuthState<LoginPage> {
  bool _isLoading = false;
  late final TextEditingController _emailController;

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });
    final response = await supabase.auth.signIn(
        email: _emailController.text,
        options: AuthOptions(
            redirectTo: kIsWeb
                ? null
                : 'io.supabase.flutterquickstart://login-callback/'));
    final error = response.error;
    if (error != null) {
      context.showErrorSnackBar(message: error.message);
    } else {
      context.showSnackBar(message: 'Check your email for login link!');
      _emailController.clear();
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradiantAppBar(pageTitle: ' ساین این  '),
      body: Container(
        decoration: kBackgroundImage,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          children: [
            Text(
              'لینک ورود به ایمیل شما ارسال خواهد شد.',
              style: GoogleFonts.lemonada(
                textStyle: TextStyle(fontSize: 10),
              ),
              textAlign: TextAlign.start,
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 18),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email: ',
                labelStyle: TextStyle(),
              ),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: _isLoading ? null : _signIn,
              child: Text(
                _isLoading ? 'Loading' : 'ارسال لینک ورود',
                style: GoogleFonts.lemonada(
                  textStyle:
                      TextStyle(fontSize: 10, fontWeight: FontWeight.w900),
                ),
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
