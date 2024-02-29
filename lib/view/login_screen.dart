import 'package:eesac/view-model/shared_preferences_provider.dart';
import 'package:eesac/view/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Sign in "),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Easacc",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            ),
            const Text("Sign in to your account  ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Your Email",
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock_outlined),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 2,
                  width: 60,
                  color: Colors.grey,
                ),
                const Text("OR"),
                Container(
                  height: 2,
                  width: 60,
                  color: Colors.grey,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    facebookLogin(context);
                  },
                  iconSize: 40,
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    _handleGoogleSignIn(context);
                  },
                  iconSize: 30,
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> facebookLogin(context) async {
  final LoginResult result = await FacebookAuth.instance.login(
    permissions: [
      'public_profile',
      'email',
    ],
  );
  if (result.status == LoginStatus.success) {
    // you are logged
    final AccessToken accessToken = result.accessToken!;
    SharedPreferencesProvider().setToken(accessToken.token);

    navigateTo(context, const SettingScreen());
  }
}

Future<void> _handleGoogleSignIn(BuildContext context) async {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
 
    if (googleUser != null) {
      navigateTo(context, SettingScreen());
    } else {
    }
  } catch (error) {
  }
}
