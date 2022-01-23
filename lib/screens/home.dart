import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int attemptCtr = 0;
  String attempt1 = "",
      attempt2 = "",
      attempt3 = "",
      attempt4 = "",
      attempt5 = "",
      attempt6 = "";
  
  final String wordle = "zevce".toLowerCase();

  final TextStyle _textStyle =
      const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  final _defaultContainerColor = Colors.blueGrey[900];
  final _wrongSpotContainerColor = Colors.amber;
  final _correctSpotContainerColor = Colors.green[700];

  var attempt1LetterStyles = List<Color>.filled(5, Colors.blueGrey[900]!);
  var attempt2LetterStyles = List<Color>.filled(5, Colors.blueGrey[900]!);
  var attempt3LetterStyles = List<Color>.filled(5, Colors.blueGrey[900]!);
  var attempt4LetterStyles = List<Color>.filled(5, Colors.blueGrey[900]!);
  var attempt5LetterStyles = List<Color>.filled(5, Colors.blueGrey[900]!);
  var attempt6LetterStyles = List<Color>.filled(5, Colors.blueGrey[900]!);
  var wordleHash = Map<String,List<int>>();

  final inputController = TextEditingController();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initalize wordle as hash map
    for(var i =0; i < wordle.length;i++){
      if (!wordleHash.containsKey(wordle[i])) {
        wordleHash[wordle[i]]=[];
        wordleHash[wordle[i]]?.add(i);        
      }else{
        wordleHash[wordle[i]]?.add(i);        
      }
    }
  }
  
  void _clearInput() {
    inputController.clear();
  }

  String _createLetter(String attempt, index) {
    try {
      return attempt[index];
    } catch (e) {
      return "";
    }
  }



  void _handleAttemptLetterStyle(List<Color> attemptLetterStyles,String attempt){
    var attemptHash = List.filled(5, false);
    var tempWordle = List.from(wordle.characters);
    for(var i = 0; i < wordle.length;i++){
        if (wordle[i]==attempt[i]) {
          attemptLetterStyles[i]=_correctSpotContainerColor!;
          attemptHash[i]=true;
          tempWordle[i]="";
        }
    }

    for (var i = 0; i < wordle.length; i++) {
      if (attemptHash[i]!=true && tempWordle.contains(attempt[i])) {
          attemptLetterStyles[i]=_wrongSpotContainerColor;
      }
    }
  }

  Widget _buildGameBody() {
    return Column(
      children: [
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            padding: const EdgeInsets.all(50),
            crossAxisSpacing: 3,
            mainAxisSpacing: 5,
            crossAxisCount: 5,
            children: [
              //attempt1
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt1, 0).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt1LetterStyles[0]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt1, 1).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt1LetterStyles[1]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt1, 2).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt1LetterStyles[2]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt1, 3).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt1LetterStyles[3]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt1, 4).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt1LetterStyles[4]),
              //attempt2
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt2, 0).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt2LetterStyles[0]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt2, 1).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt2LetterStyles[1]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt2, 2).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt2LetterStyles[2]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt2, 3).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt2LetterStyles[3]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt2, 4).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt2LetterStyles[4]),
              //attempt3
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt3, 0).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt3LetterStyles[0]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt3, 1).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt3LetterStyles[1]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt3, 2).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt3LetterStyles[2]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt3, 3).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt3LetterStyles[3]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt3, 4).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt3LetterStyles[4]),
              //attempt4
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt4, 0).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt4LetterStyles[0]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt4, 1).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt4LetterStyles[1]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt4, 2).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt4LetterStyles[2]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt4, 3).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt4LetterStyles[3]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt4, 4).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt4LetterStyles[4]),
              //attempt5
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt5, 0).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt5LetterStyles[0]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt5, 1).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt5LetterStyles[1]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt5, 2).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt5LetterStyles[2]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt5, 3).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt5LetterStyles[3]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt5, 4).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt5LetterStyles[4]),
              //attempt6
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt6, 0).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt6LetterStyles[0]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt6, 1).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt6LetterStyles[1]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt6, 2).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt6LetterStyles[2]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt6, 3).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt6LetterStyles[3]),
              Container(
                  child: Center(
                      child: Text(
                    _createLetter(attempt6, 4).toUpperCase(),
                    style: _textStyle,
                  )),
                  color: attempt6LetterStyles[4]),
            ],
          ),
        ),
        TextField(
          controller: inputController,
          autofocus: true,
          maxLength: 5,
          onChanged: (value) {
            switch (attemptCtr) {
              case 0:
                setState(() {
                  attempt1 = value.toLowerCase();
                });
                break;
              case 1:
                setState(() {
                  attempt2 = value.toLowerCase();
                });
                break;
              case 2:
                setState(() {
                  attempt3 = value.toLowerCase();
                });
                break;
              case 3:
                setState(() {
                  attempt4 = value.toLowerCase();
                });
                break;
              case 4:
                setState(() {
                  attempt5 = value.toLowerCase();
                });
                break;
              case 5:
                setState(() {
                  attempt6 = value.toLowerCase();
                });
                break;
              default:
            }
          },
          onSubmitted: (value) {
            var conditionOnAttemptCount = attemptCtr;
            switch (conditionOnAttemptCount) {
              case 0:
                if (attempt1.length == 5) {
                  setState(() {
                    attemptCtr++;
                    _handleAttemptLetterStyle(attempt1LetterStyles,attempt1);
                  });
                  _clearInput();
                }
                break;
              case 1:
                if (attempt2.length == 5) {
                  setState(() {
                    attemptCtr++;
                    _handleAttemptLetterStyle(attempt2LetterStyles,attempt2);

                  });
                  _clearInput();
                }
                break;
              case 2:
                if (attempt3.length == 5) {
                  setState(() {
                    attemptCtr++;
                    _handleAttemptLetterStyle(attempt3LetterStyles,attempt3);

                  });
                  _clearInput();
                }
                break;
              case 3:
                if (attempt4.length == 5) {
                  setState(() {
                    attemptCtr++;
                    _handleAttemptLetterStyle(attempt4LetterStyles,attempt4);

                  });
                  _clearInput();
                }
                break;
              case 4:
                if (attempt5.length == 5) {
                  setState(() {
                    attemptCtr++;
                    _handleAttemptLetterStyle(attempt5LetterStyles,attempt5);

                  });
                  _clearInput();
                }
                break;
              case 5:
                if (attempt6.length == 5) {
                  setState(() {
                    // last attempt requires different handling
                    _handleAttemptLetterStyle(attempt6LetterStyles,attempt6);

                  });
                  _clearInput();
                }
                break;
              default:
            }
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wordle Türkçe"),
        centerTitle: true,
      ),
      body: _buildGameBody(),
    );
  }
}