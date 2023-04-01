import 'dart:math';
import 'package:flutter/material.dart';
import 'package:navigator_flutter/Screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: (settings) {
        switch (settings.name){
          case "/":
            return MaterialPageRoute(builder: (context) =>const MyHomePage(title: "dang nhap "),
            settings: settings,
          );
          case "/screen2":
            return MaterialPageRoute(builder: (context) => Screen2(args: settings.arguments as ScreenArgument,),
            settings: settings,
          );
        }
        return null;
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter navigator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;
  String? usernameValue;
  String? passwordValue;
  var _isObscured;
  
  @override
  void initState() {
    // TODO: implement initState
    usernameController=TextEditingController(text: usernameValue);
    passwordController=TextEditingController(text: passwordValue);
    super.initState();
    _isObscured=true;

  }
  @override
  void dispose() {
    // TODO: implement dispose
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Container(
                width: 100,
                //height: 70,
                decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.blue,
                ),
                            borderRadius: BorderRadius.circular(50),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child:
                    Image.network("https://cdn-icons-png.flaticon.com/512/147/147142.png")),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                onChanged: (String value) {
                  usernameValue=value;
                },
                controller: usernameController,
                decoration: InputDecoration(
                  labelText:'Username' ,
                  hintText: 'hãy nhập tên đăng nhập của bạn',
                  hintStyle:TextStyle(color: Colors.grey.withOpacity(0.9)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.indigoAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                onChanged: (String value) {
                  passwordValue=value;
                },
                obscureText: _isObscured,
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'hãy nhập password của bạn',
                  hintStyle:TextStyle(color: Colors.grey.withOpacity(0.9)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.indigoAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.red),
                  ),

                  suffixIcon: IconButton(
                    padding: const EdgeInsetsDirectional.only(end: 12.0),
                    icon: _isObscured ? const Icon(Icons.visibility): const Icon(Icons.visibility_off),
                    onPressed: (){
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  ),
                ),
                // obscureText: true,
                // obscuringCharacter: '*',

              ),
              ElevatedButton(
                onPressed: (){
                  if(usernameController.text.isEmpty || passwordController.text.isEmpty){
                    return;
                  }
                  else{
                    Navigator.pushNamed(
                    context, "/screen2",
                    arguments: ScreenArgument(usernameValue: usernameController.text)
                  );
                  }
                  
                }, 
                child: const Text("Đăng nhập"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}