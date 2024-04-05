import 'package:flutter/material.dart';
import 'package:loginuicolors/dashboard.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 50),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.white, fontSize: 38),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Username",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            style: TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
  SizedBox(
  width: 150, 
  child: Container(
    padding: EdgeInsets.symmetric(vertical: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 94, 170, 232), 
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          offset: Offset(0, 3),
          blurRadius: 6,
        ),
      ],
    ),
    child: TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(), 
          ),
        );
      },
      child: Center(
        child: Text(
          'Sign in',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w700,
            color: Colors.white, 
          ),
        ),
      ),
    ),
  ),
),



                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
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
