import 'package:favourite/provider/favrourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyfavrouriteScreen extends StatefulWidget {
  const MyfavrouriteScreen({super.key});

  @override
  State<MyfavrouriteScreen> createState() => _MyfavrouriteScreenState();
}

class _MyfavrouriteScreenState extends State<MyfavrouriteScreen> {

 @override
  Widget build(BuildContext context) {
    final favroiteProvider =Provider.of<favrouriteItemProvider>(context);
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
                itemCount: favroiteProvider.selectedItem.length,
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
