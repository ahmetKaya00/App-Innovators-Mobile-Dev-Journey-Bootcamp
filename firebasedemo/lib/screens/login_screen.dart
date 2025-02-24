import 'package:firebasedemo/models/authentication_model.dart';
import 'package:firebasedemo/screens/home_screen.dart';
import 'package:firebasedemo/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  final AuthenticationModel _authModel = AuthenticationModel();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async{
    try{
     final user = await _authModel.loginWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
      );
      if(user != null && !user.emailVerified){
        await user.sendEmailVerification();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lütfen e-postanızı doğrulayın. Doğrulama maili gönderildi.'))
        );
        await _authModel.signOut();
      }else if(user != null){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
          padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _login,
                child: Text('Login')
            ),
            SizedBox(height: 10),
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                  },
                  child: Text('Henüz üyeliğin yok mu ? Hemen Tıkla')),
            ),
            SizedBox(height: 10),
            Center(
              child: TextButton(
                  onPressed: () async{
                    try{
                      await _authModel.resetPassword(_emailController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Şifre sıfırlama maili gönderildi.')),
                      );
                    }catch(e){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
                    }
                  },
                  child: Text('Sifremi Unuttum!'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
