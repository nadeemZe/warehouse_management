import 'package:flutter/material.dart';
import 'package:warehouse_management/view/home.dart';

class LogIn extends StatefulWidget{
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  final TextEditingController _userNameController =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();

  bool wrongLogin=false;

  logIn(){
    if(_userNameController.text=='Kinan'&&_passwordController.text=='soliman'){
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>const MyHomePage()));
    }
    else{
      setState(() {
        wrongLogin=true;
      });
    }
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.indigo,
              Colors.lightBlueAccent
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
            ),
            const SizedBox(height: 17,),
            SizedBox(
              width: 350,
              child: TextField(
                  controller:_userNameController ,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintStyle:  TextStyle(color: Colors.white),
                    hintText: 'User Name',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person,color: Colors.white,),
                    filled: true,
                    fillColor: Colors.white24,
                  ),
              ),
            ),
            const SizedBox(height: 7,),
            SizedBox(
              width: 350,
              child: TextField(
                controller:_passwordController ,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintStyle:  TextStyle(color: Colors.white),
                  hintText: 'Password',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.lock,color: Colors.white,),
                  filled: true,
                  fillColor: Colors.white24,
                ),
              ),
            ),
            const SizedBox(height: 7,),
            Text(wrongLogin
                ?'Wrong LogIn information !'
                :'',style: const TextStyle(color: Colors.red),),
            const SizedBox(height: 25,),
            Container(
              width: 350,
              height: 51,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.circular(25)
              ),
              child: TextButton(
                onPressed: (){
                  logIn();
                  },
                child: const Text('LogIn',style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}