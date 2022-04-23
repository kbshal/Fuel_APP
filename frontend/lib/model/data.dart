class ListDummy {
 static List<DummyData> list = [DummyData(name: "Petrol", price: 160.0, icon: "assets/petrol.png"),
  DummyData(name: "Diesel", price: 143.0, icon:"assets/petrol.png"),
  DummyData(name: "Kerosene", price: 144.0, icon: "assets/kerosene.png"),
  DummyData(name: "LPG Gas", price: 1600, icon: "assets/gas.png")];
}

class DummyData {
  final String name;
  final double price;
  final String icon;

  DummyData({required this.name, required this.price, required this.icon});
}
