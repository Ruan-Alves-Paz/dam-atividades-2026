import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pedido Flash')),

      drawer: Drawer(
        child: Column(
          children: [
            Text('Menu'),
            Divider(),
            Text('Início'),
            Divider(),
            Text('Produtos'),
            Divider(),
            Text('Pedidos'),
          ],
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          children: [
            Text('Cardápio', style: TextStyle(fontSize: 25)),

            SizedBox(height: 20),

            Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text('🍔'),
                    SizedBox(width: 20),
                    Column(children: [Text('Hambúrguer'), Text('R\$ 25,00')]),
                  ],
                ),
              ),
            ),

            Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text('🍕'),
                    SizedBox(width: 20),
                    Column(children: [Text('Pizza'), Text('R\$ 35,00')]),
                  ],
                ),
              ),
            ),

            Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text('🍟'),
                    SizedBox(width: 20),
                    Column(children: [Text('Batata Frita'), Text('R\$ 12,00')]),
                  ],
                ),
              ),
            ),

            Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text('🥤'),
                    SizedBox(width: 20),
                    Column(children: [Text('Refrigerante'), Text('R\$ 7,00')]),
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
