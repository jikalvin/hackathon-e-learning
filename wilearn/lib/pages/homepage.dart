import 'package:flutter/material.dart';
import 'package:wilearn/assets/assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        toolbarOpacity: 1,
        bottomOpacity: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(ImageAssets.logo_trans),
        ),
        title: const Text("Wilearn",),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(
              Icons.search,
            ),
          ),
          const SizedBox(width: 30,),
          IconButton(
            onPressed: (){},
            icon: const Icon(
              Icons.account_circle,
            ),
          ),
            const SizedBox(width: 30,),
        ],
      ),

      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Some Text"),
              background: Image.asset(
                  '../assets/images/campus-1.jpg',
                  fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 30,
                ),
                itemCount: Courses.length,
                itemBuilder: (context, index) => Container(
                  width: 270,
                  margin: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 3,
                    child: Column(
                      children: [
                        Image.asset(
                          '../assets/images/${all_images[index%3]}.jpg',
                          width: 270,
                        ),
                        Text(
                          Courses[index]['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ),
          )
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.home)),
            IconButton(onPressed: (){}, icon: Icon(Icons.account_balance)),
            IconButton(onPressed: (){}, icon: Icon(Icons.download_rounded)),
            IconButton(onPressed: (){}, icon: Icon(Icons.library_add)),
            IconButton(onPressed: (){}, icon: Icon(Icons.sports_basketball)),
          ],
        ),
      ),
    );
}


























}