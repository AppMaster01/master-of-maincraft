import 'dart:convert';


class TextData {
  TextData({
    required this.texturePacks,
  });

  List<TexturePack> texturePacks;

  factory TextData.fromJson(Map<String, dynamic> json) => TextData(
        texturePacks: List<TexturePack>.from(
            json["texture-packs"].map((x) => TexturePack.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "texture-packs":
            List<dynamic>.from(texturePacks.map((x) => x.toJson())),
      };
}

class TexturePack {
  TexturePack({
    required this.id,
    required this.title,
    required this.categories,
    required this.versions,
    required this.files,
    required this.screens,
    required this.recipes,
    required this.author,
    required this.date,
    required this.views,
    required this.likes,
    required this.downloads,
    required this.description,
  });

  String id;
  String title;
  List<Category> categories;
  List<Version> versions;
  List<FileElement> files;
  List<Screen> screens;
  List<dynamic> recipes;
  String author;
  String date;
  String views;
  String likes;
  String downloads;
  String description;

  factory TexturePack.fromJson(Map<String, dynamic> json) => TexturePack(
        id: json["id"],
        title: json["title"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        versions: List<Version>.from(
            json["versions"].map((x) => Version.fromJson(x))),
        files: List<FileElement>.from(
            json["files"].map((x) => FileElement.fromJson(x))),
        screens:
            List<Screen>.from(json["screens"].map((x) => Screen.fromJson(x))),
        recipes: List<dynamic>.from(json["recipes"].map((x) => x)),
        author: json["author"],
        date: json["date"],
        views: json["views"],
        likes: json["likes"],
        downloads: json["downloads"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "versions": List<dynamic>.from(versions.map((x) => x.toJson())),
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
        "screens": List<dynamic>.from(screens.map((x) => x.toJson())),
        "recipes": List<dynamic>.from(recipes.map((x) => x)),
        "author": author,
        "date": date,
        "views": views,
        "likes": likes,
        "downloads": downloads,
        "description": description,
      };
}

class Category {
  Category({
    required this.categoryId,
    required this.name,
    required this.post,
  });

  String categoryId;
  String name;
  String post;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"],
        name: json["name"],
        post: json["post"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "name": name,
        "post": post,
      };
}

class FileElement {
  FileElement({
    required this.fileId,
    required this.url,
    required this.desc,
    required this.downloads,
  });

  String fileId;
  String url;
  String desc;
  String downloads;

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        fileId: json["file_id"],
        url: json["url"],
        desc: json["desc"],
        downloads: json["downloads"],
      );

  Map<String, dynamic> toJson() => {
        "file_id": fileId,
        "url": url,
        "desc": desc,
        "downloads": downloads,
      };
}

class Screen {
  Screen({
    required this.url,
  });

  String url;

  factory Screen.fromJson(Map<String, dynamic> json) => Screen(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class Version {
  Version({
    required this.code,
  });

  String code;

  factory Version.fromJson(Map<String, dynamic> json) => Version(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}
