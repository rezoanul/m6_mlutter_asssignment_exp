import 'package:flutter/material.dart';

void main() => runApp(HomeActivity());

class HomeActivity extends StatelessWidget {
  HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text('Photo Gallery'),
        ),
        body: const ExpandedExample(),
      ),
    );
  }
}

class ExpandedExample extends StatelessWidget {
  const ExpandedExample({super.key});

  @override
  Widget build(BuildContext context) {
    var myItems=[
      {"img":"https://picsum.photos/250?image=1","title":"Img-1"},
      {"img":"https://picsum.photos/250?image=2","title":"Img-2"},
      {"img":"https://picsum.photos/250?image=3","title":"Img-3"},
      {"img":"https://picsum.photos/250?image=4","title":"Img-4"},
      {"img":"https://picsum.photos/250?image=5","title":"Img-5"},
      {"img":"https://picsum.photos/250?image=6","title":"Img-6"},
    ];
    mySnackBar(context,msg){
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    }
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 30,
            width: 300,
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.all(20),
            //padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(text: 'Welcome to My Photo Gallery!', style: TextStyle(fontSize:20, color: Colors.black,
                      fontWeight: FontWeight.w600)
                  ),
                ],
              ),
            ),
          ),
          Padding(padding:EdgeInsets.all(12),child: TextField(decoration: InputDecoration(border:OutlineInputBorder(),labelText: 'Search for photos...')),),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1.3
                ) ,
                itemCount: myItems.length,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){mySnackBar(context,myItems[index]['title']);},
                    child: Container(
                      margin: EdgeInsets.all(15),
                      width: 100,//double.infinity,
                      height: 250,
                      child: Image.network(myItems[index]['img']!, fit: BoxFit.fill),
                    ),
                  );
                }
            ),
          ),
          Expanded(
            child:ListView.builder(
                itemCount: myItems.length,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){mySnackBar(context,myItems[index]['title']);},
                    child: Container(
                        margin: EdgeInsets.all(5),
                        width: 100,//double.infinity,
                        height: 120,
                        child: Image.network(myItems[index]['img']!, fit: BoxFit.fill)
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
