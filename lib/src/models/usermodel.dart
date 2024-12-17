class UserModel{
  final String userid;
  final String name;
  final String email;
  String? image;
  int? followers;
  int? following;
  String? about;
  List<String>? category;

  UserModel({
    required this.userid,
    required this.name,
    required this.email,
    this.image,
    this.about,
    this.followers,
    this.following,
    this.category,
  });

  factory UserModel.fromJson(Map<String,dynamic> json) {
    return UserModel(
        userid: json['userId'],
        name: json['name'],
        email: json['email'],
        image: json['image'],
        followers: json['followers'],
        following: json['following'],
        about: json['about'],
        category:  List<String>.from(json['category'])
    );
  }

  Map<String,dynamic> toJson(){
    return{
      'userId' : userid,
      'name' : name,
      'email' : email,
      'image' : image,
      'about' : about,
      'followers' : followers,
      'following' : following,
      'category' : category
    };
  }

}