import 'package:flutter/material.dart';

class Topic9Gridview extends StatelessWidget{
  const Topic9Gridview({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> foodNames = [
      "Burger",
      "Pizza",
      "Pasta",
      "Sandwich",
      "Momos",
      "Fries",
    ];
    List<String> prices = [
      "\$10",
      "\$15",
      "\$12",
      "\$8",
      "\$9",
      "\$7",
    ];

    List<String> ratings = [
      "4.5",
      "4.8",
      "4.2",
      "4.6",
      "4.1",
      "4.7",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
            itemCount:foodNames.length,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>FoodDetailpage(
                    foodName:foodNames[index],
                    price:prices[index],
                    rating:ratings[index],
                  ),
                  ),
                  );
                },
                child:   Container(
                  padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:[
                  Colors.orange.shade100,
                  Colors.deepOrange.shade400,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  ),
                  borderRadius:
                    BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height:10),
                    Center(
                      child: Image.asset(
                    "assets/images/burger.png",
                    height: 90,
                    width: 90,
              ),
                    ),
              const SizedBox(height:10),

              Text(
                foodNames[index],
              style:const TextStyle(
              fontSize:22,
                fontWeight:FontWeight.bold,
              color: Colors.white,
              ),
              ),
              const SizedBox(height:5),
              Text(
              prices[index],
              style:const TextStyle(
              fontSize:18,
              color:Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
              ),
                  Row(
                    children: [
                     const Icon(
                       Icons.star,
                       color: Colors.yellow,
                       size:20,
                     ),
                      const SizedBox(width: 5),
                      Text(
                        ratings[index],
                        style: const TextStyle(
                          color:Colors.white,
                          fontSize: 16,
                        ),
                      ),
                  ],
                ),
                  ],
              ),
                ),
              );
            },
      ),
    ),
    );
  }
}
class FoodDetailpage extends StatelessWidget{
  final String foodName;
  final String price;
  final String rating;
  const FoodDetailpage({
    super.key,
    required this.foodName,
    required this.price,
    required this.rating,
});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(foodName),
      ),
    body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                "assets/images/burger.png",
              height: 200,
            ),
            const SizedBox(height: 20),
  
          Text(
  
            foodName,
  
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
  
          const SizedBox(height: 10),
  
          Text(
  
            price,
  
            style: const TextStyle(
              fontSize: 28,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
  
          const SizedBox(height: 10),
  
          Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
  
            children: [
  
              const Icon(
                Icons.star,
                color: Colors.orange,
              ),
  
              const SizedBox(width: 5),
  
              Text(
                rating,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
            ],
          ),
          ],
        ),
      ),
    ),
    );
  }
}