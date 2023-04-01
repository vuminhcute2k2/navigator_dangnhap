import 'package:flutter/material.dart';
class Screen2 extends StatelessWidget {
  const Screen2({super.key, this.args});
  final ScreenArgument? args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Chào mừng ",style: TextStyle(fontSize: 40,color: Colors.blue),),
            Text(
              args?.usernameValue??"null",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              child: const Text("đi tới đăng nhập"),
            )
          ],
        ),
      ),
    );
  }
}
class ScreenArgument{
  final String usernameValue;

ScreenArgument({required this.usernameValue});
}