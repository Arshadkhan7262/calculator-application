import 'package:flutter/material.dart';
import 'package:calculator/MyButton.dart';

import 'package:math_expressions/math_expressions.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var input='';
  var answer='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text('My Calculator',style: TextStyle(color: Colors.white,fontSize: 20),
          textAlign: TextAlign.center,),
        ),


      ),
      body: Expanded(
        flex: 2,
        child: Column(

          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.center,
                      child: Text(input.toString(),style: TextStyle(fontSize: 30,color: Colors.white,),)),
                  SizedBox(height: 10,),
                  Align(alignment: Alignment.center,
                      child: Text(answer.toString(),style: TextStyle(fontSize: 30,color: Colors.white),))


              ],),
            ),
             Row(
                children: [
                  MYButton(title: 'AC',color: Colors.grey,onpress:  (){
                    input="";
                    answer="";
                    setState(() {


                    });

                  }),
                  MYButton(title: '+/-',color: Colors.grey,onpress: (){
                    setState(() {
                      input=input+"+/-";
                    });

                  }),
                  MYButton(title: '%',color: Colors.grey,onpress: (){

                    setState(() {
                      input=input+"%";
                    });
                  }),
                  MYButton(title:'/',color: Colors.orange,onpress: (){

                    setState(() {
                      input=input+"/";
                    });
                  }),
                ],
              ),
            Row(
              children: [
                MYButton(title: '7',color: Colors.grey,onpress:  (){

                  setState(() {
                    input=input+"7";
                  });
                }),
                MYButton(title: '8',color: Colors.grey,onpress: (){

                  setState(() {
                    input=input+"8";
                  });
                }),
                MYButton(title: '0',color: Colors.grey,onpress: (){
                  setState(() {
                    input=input+"0";
                  });
                }),
                MYButton(title:'x',color: Colors.orange,onpress: (){
                 setState(() {
                   input=input+"*";
                 });
                }),
              ],
            ),
            Row(
              children: [
                MYButton(title: '4',color: Colors.grey,onpress:  (){
                  setState(() {
                    input=input+"4";
                  });
                }),
                MYButton(title: '5',color: Colors.grey,onpress: (){
                  setState(() {
                    input=input+"5";
                  });
                }),
                MYButton(title: '6',color: Colors.grey,onpress: (){
                  setState(() {
                    input=input+"6";
                  });
                }),
                MYButton(title:'-',color: Colors.orange,onpress: (){
                      setState(() {
                        input=input+"-";
                      });
                }),
              ],
            ),
            Row(
              children: [
                MYButton(title: '1',color: Colors.grey,onpress:  (){
                setState(() {
                  input=input+"1";
                });
                }),
                MYButton(title: '2',color: Colors.grey,onpress: (){
                  setState(() {
                    input=input+"2";
                  });
                }),
                MYButton(title: '3',color: Colors.grey,onpress: (){
                  setState(() {
                    input=input+"3";
                  });
                }),
                MYButton(title:'+',color: Colors.orange,onpress: (){
                        setState(() {
                          input=input+"+";
                        });
                }),
              ],
            ),
            Row(
              children: [
                MYButton(title: '0',color: Colors.grey,onpress:  (){
                  setState(() {
                    input=input+"0";
                  });
                }),
                MYButton(title: '.',color: Colors.grey,onpress: (){
                  setState(() {
                    input=input+".";
                  });
                }),
                MYButton(title: 'DEL',color: Colors.grey,onpress: (){
                  setState(() {
                    input=input.substring(0,input.length-1);
                  });
                }),
                MYButton(title:'=',color: Colors.orange,onpress: (){
                setState(() {

                  Equalpress();
                });
                }),
              ],
            ),


          ],
        ),
      ),

    );
  }
  void Equalpress()
  {

    Parser parser=Parser();
    Expression expression=parser.parse(input);
    ContextModel contextModel=ContextModel();
    double evalute=expression.evaluate(EvaluationType.REAL, contextModel);
    answer=evalute.toString();

  }
}
