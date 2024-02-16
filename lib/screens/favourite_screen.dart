import 'package:favourite/provider/favrourite_provider.dart';
import 'package:favourite/screens/my_favrourite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavrouriteScreen extends StatefulWidget {
  const FavrouriteScreen({super.key});

  @override
  State<FavrouriteScreen> createState() => _FavrouriteScreenState();
}

class _FavrouriteScreenState extends State<FavrouriteScreen> {
  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: Text('Favroute app'),
        centerTitle: true, 
        backgroundColor: Colors.blue[300],
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>MyfavrouriteScreen()));
            },
            child: Icon(Icons.favorite)),
          SizedBox(
            width: 24,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Consumer<favrouriteItemProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          // pahilai select cha bhane remove natra add

                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text("item" + index.toString()),
                      trailing: Icon(value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
