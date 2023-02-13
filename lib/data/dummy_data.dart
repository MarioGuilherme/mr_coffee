import "package:mr_coffe/models/category.dart";
import "package:mr_coffe/models/product.dart";
import "package:mr_coffe/models/review.dart";

const List<Category> CATEGORIES = <Category>[
  Category(
    id: 0,
    name: "Cafés Quentes",
    totalOptions: 18
  ),
  Category(
    id: 1,
    name: "Cafés Gelado",
    totalOptions: 8
  ),
  Category(
    id: 2,
    name: "Chás Quentes",
    totalOptions: 2
  ),
  Category(
    id: 3,
    name: "Chás Gelados",
    totalOptions: 12
  )
];

List<Review> REVIEWS = <Review>[
   Review(
    name: "Felipe Maciel",
    date: DateTime.parse("2021-05-08"),
    pontuation: 5.0,
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
  ),
   Review(
    name: "Felipe Maciel",
    date: DateTime.parse("2022-08-21"),
    pontuation: 4.9,
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
  ),
  Review(
    name: "Mário Guilherme",
    date: DateTime.parse("2023-01-21"),
    pontuation: 5.0,
    description: "Protótipo Mr Coffee replicado com a tecnologia flutter :)"
  )
];

List<Product> NEW_OF_MONTH = <Product>[
  Product(
    id: 5,
    name: "Cupcake Geléia de Frutas do Bosque",
    currentPrice: 8.99,
    oldPrice: 12.99
  ),
  Product(
    id: 6,
    name: "Bolo de Brigadeiro com KitKat",
    currentPrice: 5.99
  ),
  Product(
    id: 5,
    name: "Cupcake Geléia de Frutas do Bosque",
    currentPrice: 8.99,
    oldPrice: 12.99
  ),
  Product(
    id: 6,
    name: "Bolo de Brigadeiro com KitKat",
    currentPrice: 5.99
  )
];

List<Product> PRODUCTS = <Product>[
  Product(
    id: 1,
    name: "Irish Coffe",
    currentPrice: 5.9,
    oldPrice: 7.9,
    reviews: REVIEWS
  ),
  Product(
    id: 2,
    name: "Mocaccino",
    currentPrice: 8.9,
    oldPrice: 9.9,
    reviews: REVIEWS
  ),
  Product(
    id: 3,
    name: "2x Irish Coffee",
    currentPrice: 9.9,
    oldPrice: 11.8,
    reviews: REVIEWS
  ),
  Product(
    id: 4,
    name: "British Tea",
    currentPrice: 5.9,
    oldPrice: 7.9,
    reviews: REVIEWS
  )
];