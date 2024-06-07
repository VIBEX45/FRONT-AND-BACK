import 'package:flutter/material.dart';

class button1 extends StatefulWidget {
  const button1({super.key});

  @override
  State<button1> createState() => _button1State();
}
class _button1State extends State<button1> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "1";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class button2 extends StatefulWidget {
  const button2({super.key});

  @override
  State<button2> createState() => _button2State();
}
class _button2State extends State<button2> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "2";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class button3 extends StatefulWidget {
  const button3({super.key});

  @override
  State<button3> createState() => _button3State();
}
class _button3State extends State<button3> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "3";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class button4 extends StatefulWidget {
  const button4({super.key});

  @override
  State<button4> createState() => _button4State();
}
class _button4State extends State<button4> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "4";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class button5 extends StatefulWidget {
  const button5({super.key});

  @override
  State<button5> createState() => _button5State();
}
class _button5State extends State<button5> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "5";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class button6 extends StatefulWidget {
  const button6({super.key});

  @override
  State<button6> createState() => _button6State();
}
class _button6State extends State<button6> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "6";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class button7 extends StatefulWidget {
  const button7({super.key});

  @override
  State<button7> createState() => _button7State();
}
class _button7State extends State<button7> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "7";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class button8 extends StatefulWidget {
  const button8({super.key});

  @override
  State<button8> createState() => _button8State();
}
class _button8State extends State<button8> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "8";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class button9 extends StatefulWidget {
  const button9({super.key});

  @override
  State<button9> createState() => _button9State();
}
class _button9State extends State<button9> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "9";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class button10 extends StatefulWidget {
  const button10({super.key});

  @override
  State<button10> createState() => _button10State();
}
class _button10State extends State<button10> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "10";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class button11 extends StatefulWidget {
  const button11({super.key});

  @override
  State<button11> createState() => _button11State();
}
class _button11State extends State<button11> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "11";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class button12 extends StatefulWidget {
  const button12({super.key});

  @override
  State<button12> createState() => _button12State();
}
class _button12State extends State<button12> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "12";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class button13 extends StatefulWidget {
  const button13({super.key});

  @override
  State<button13> createState() => _button13State();
}
class _button13State extends State<button13> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "13";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class button14 extends StatefulWidget {
  const button14({super.key});

  @override
  State<button14> createState() => _button14State();
}
class _button14State extends State<button14> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "14";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class button15 extends StatefulWidget {
  const button15({super.key});

  @override
  State<button15> createState() => _button15State();
}
class _button15State extends State<button15> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "15";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class button16 extends StatefulWidget {
  const button16({super.key});

  @override
  State<button16> createState() => _button16State();
}
class _button16State extends State<button16> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "16";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class button17 extends StatefulWidget {
  const button17({super.key});

  @override
  State<button17> createState() => _button17State();
}
class _button17State extends State<button17> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "17";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class button18 extends StatefulWidget {
  const button18({super.key});

  @override
  State<button18> createState() => _button18State();
}
class _button18State extends State<button18> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "18";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class button19 extends StatefulWidget {
  const button19({super.key});

  @override
  State<button19> createState() => _button19State();
}
class _button19State extends State<button19> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "19";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class button20 extends StatefulWidget {
  const button20({super.key});

  @override
  State<button20> createState() => _button20State();
}
class _button20State extends State<button20> {

  bool tersedia = true;
  Color tombol = Color.fromRGBO(217, 217, 217, 1);
  String nokamar = "20";
  bool kondisi = true;
  int selectedindex = 0;

  int outindex = 0;
  bool outbool = true;

  double tinggi = 25;
  double lebar = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(tersedia == false){
          setState(() {
            tombol = const Color.fromRGBO(50, 50, 50, 10);
          });
        }
        kondisi && tersedia
            ? setState(() {
                tombol = const Color.fromRGBO(101, 101, 101, 1);
                outindex = selectedindex;
                kondisi = false;
                outbool = kondisi;
              })
            : setState(() {
                tombol = const Color.fromRGBO(217, 217, 217, 1);
                kondisi = true;
                outindex = selectedindex;
                outbool = kondisi;
              });
      },
      onFocusChange: (val) {
        setState(() {
          kondisi = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: tombol,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(198, 198, 198, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  )),
            ]),
        child: Text(
          textAlign: TextAlign.center,
          nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}







