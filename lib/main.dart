import 'package:flutter/material.dart';

void main() {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo da idosa',
      theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
       useMaterial3: true,
       ),
       home: const MeuTabuleiro(),
    );
  }
}

class MeuTabuleiro extends StatefulWidget {
  const MeuTabuleiro({super.key});

  @override
  State<MeuTabuleiro> createState() => _MeuTabuleiroState();
}

class _MeuTabuleiroState extends State<MeuTabuleiro> {
  //variaveis do jogo
  String player_1 = 'X';
  String player_2 = 'O';
  int placarPlayer_1 = 0;
  int placarPlayer_2 = 0;
  var tabuleiro=[
    ['','',''],
    ['','',''],
    ['','','']
  ];
  int vez=0;

  //método que define a jogada 
  jogada(linha, coluna){
    //verifica a quantidade de jogadas realizadas
    if(vez<9){
      if(tabuleiro[linha][coluna] == ''){
        //verifica de quem é a vez
        String pedra='';
        if(vez%2==0){
          pedra=player_1;
        }else{
          pedra = player_2;
        }
        tabuleiro[linha] [coluna] = pedra;
        vez++;
        //verifica vitoria 
        if(vez > 3){
          //verifica o vencedor
        }
      }
    }
  }
  //verifica vencedor
  bool verificaVencedor(player){
    //linha superior

if(tabuleiro[0][0] == player &&
tabuleiro[0][1] == player &&
tabuleiro[0][2] == player){
  return true; // este player venceu
}else // linha do meio
if (tabuleiro[1][0] == player &&
tabuleiro[1][1] == player &&
tabuleiro[1][2] == player){
  return true;
}else // linha inferior
if (tabuleiro[2][0] == player &&
tabuleiro[2][1] == player &&
tabuleiro[2][2] == player){
  return true;
}else // coluna da esqueda
if (tabuleiro[0][0] == player &&
tabuleiro[1][0] == player &&
tabuleiro[2][0] == player){
  return true;
}else // coluna do meio
if (tabuleiro[0][1] == player &&
tabuleiro[1][1] == player &&
tabuleiro[2][1] == player){
  return true;
}else // coluna da direita
if (tabuleiro[0][1] == player &&
tabuleiro[1][2] == player &&
tabuleiro[2][2] == player){
  return true;
}else // diagonal principal
if (tabuleiro[0][0] == player &&
tabuleiro[1][1] == player &&
tabuleiro[2][2] == player){
  return true;
}else // diagonal secundaria
if (tabuleiro[0][2] == player &&
tabuleiro[1][1] == player &&
tabuleiro[2][0] == player){
  return true;
}
return false; // se chegou aqui é porque ninguem ganhou ainda 
  }

  //comeca novo jogo
  comecarNovo(){
    tabuleiro = [
    ['','',''],
    ['','',''],
    ['','','']
  ];
  vez = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context) .colorScheme.inversePrimary,
        title: const Text("Jogo da Idosa"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: GridView.count(
            crossAxisCount: 3,
            children: 
                  //o componente GRID funciona como o grid do html
                  // vamos colocar nove boto~es dentro dele para ficar no formato 3x3
                  List.generate(9, (index){
                    return ElevatedButton(
                      onPressed: () {},
                       child: Text("$index"),
                    );
                  }),
              ),
          ),
      ),
      );
  }
}