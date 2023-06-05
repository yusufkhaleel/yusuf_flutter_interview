import '../model/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<ProductModel> productItems = [
  // Product List 1
  ProductModel(
    pid: 1,
    imgUrl: 'assets/products/vr1.png',
    title: 'DESTEK V5 VR Headset',
    price: 120.00,
    rating: 4.5,
    review: 11277,
    longDescription:
        'Comfortable \u0026 lightweight – Compare to market 3D VR headset, Our VR headset decreased in weight due to plastic component swaps and improvements in manufacturing. The virtual reality headset for kids only weights 9.9oz, it significantly reduce the pressure with the help of adjustable head strap design, making it tight but fairly comfortable fit. The removable facepad of VR head set with hand controllers is made of ultra-soft washable breathing Fabric, helping you stay comfortable during use',
  ),

  // Product List 2
  ProductModel(
    pid: 2,
    imgUrl: 'assets/products/vr2.png',
    title: 'VR Headset with Remote Controller',
    price: 115.00,
    rating: 3.9,
    review: 13625,
    longDescription:
        'Anti-Blue Light Eye Protected HD Lenses – We always put our customers experience on top priority, we insist VR headset set adopt 94% lens light transmittance and use anti-reflective and anti-blue light coating lens to prevent eyestrain when using the headset. Also sharp HD images are achieved by the aspheric and anti-distortion lens surface. Even to those near-sighted or far, with it, you can get an Incredible Visual Fidelity and Immersive Feeling via this virtual reality goggles',
  ),

  // Product List 3
  ProductModel(
    pid: 3,
    imgUrl: 'assets/products/vr3.png',
    title: 'WinDrogon VR',
    price: 99.00,
    rating: 3.5,
    review: 13625,
    longDescription:
        '[Ergonomics \u0026 excellent heat dissipation] Since VR glasses need to be worn for a long time, we use a safe cushion material to protect the nose, face, head and neck. It leaves no marks on the face even when worn for a long time, and has strong transparency. Strong and fast heat dissipation, no sweat even in summer. The ergonomically manufactured does not cause fatigue even after long-term use, and has excellent elasticity and adjustability',
  ),

  // Product List 4
  ProductModel(
    pid: 4,
    imgUrl: 'assets/products/vr4.png',
    title: 'OIVO 3D VR',
    price: 160.00,
    rating: 4.7,
    review: 125,
    longDescription:
        'Upgraded Version: Special virtual reality vr glasses for Nintendo switch \u0026 Nintendo Switch OLED Model, would be a big surprise as gift for your friends and family or yourself, this is the upgraded version.(More suitable experience and people with prescription glasses can wear this VR too.).NOTE: Please take out the Joy-Con would be light weight to use, 15~36mm, may not fit for huge nose. Say Goodbye To Carboard Materials: Made of EVA and Oxford materials, super light weight and durable, no worry that your VR glass get mildew in wet weather, includes adjustable headstrap and more thick materials to touch your face, no need to grip the switch console near your head. Watch and Play in VR: HD optimization takes you special experience to watch Youtube and play Super Smash Bros. \u0026 Zelda \u0026 Super Mario Odyssey etc. (VR games may be updated in succession), Full range with the joysticks and the buttons are covered fully, easy to use when playing action games (I.e. smash bros.)',
  ),
];

//List<ProductModel> productItems = [];

Future<List<ProductModel>> fetchProductItems() async {
  final response = await http.get(Uri.parse('https://api.npoint.io/a907f54f4d95e9e31711'));

  if (response.statusCode == 200) {
    final jsonList = json.decode(response.body) as List<dynamic>;
    productItems = jsonList.map((item) => ProductModel.fromJson(item)).toList();
    return productItems;
  } else {
    throw Exception('Failed to fetch product items');
  }
}



