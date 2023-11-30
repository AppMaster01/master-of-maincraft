class SeedsData {
  final List<Seeds>? seeds;

  SeedsData({
    this.seeds,
  });

  SeedsData.fromJson(Map<String, dynamic> json)
      : seeds = (json['seeds'] as List?)?.map((dynamic e) => Seeds.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'seeds' : seeds?.map((e) => e.toJson()).toList()
  };
}

class Seeds {
  final String? id;
  final String? title;
  final List<Versions>? versions;
  final String? key;
  final List<Screens>? screens;
  final String? author;
  final String? date;
  final String? views;
  final String? likes;
  final String? downloads;
  final String? description;

  Seeds({
    this.id,
    this.title,
    this.versions,
    this.key,
    this.screens,
    this.author,
    this.date,
    this.views,
    this.likes,
    this.downloads,
    this.description,
  });

  Seeds.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        title = json['title'] as String?,
        versions = (json['versions'] as List?)?.map((dynamic e) => Versions.fromJson(e as Map<String,dynamic>)).toList(),
        key = json['key'] as String?,
        screens = (json['screens'] as List?)?.map((dynamic e) => Screens.fromJson(e as Map<String,dynamic>)).toList(),
        author = json['author'] as String?,
        date = json['date'] as String?,
        views = json['views'] as String?,
        likes = json['likes'] as String?,
        downloads = json['downloads'] as String?,
        description = json['description'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'versions' : versions?.map((e) => e.toJson()).toList(),
    'key' : key,
    'screens' : screens?.map((e) => e.toJson()).toList(),
    'author' : author,
    'date' : date,
    'views' : views,
    'likes' : likes,
    'downloads' : downloads,
    'description' : description
  };
}

class Versions {
  final String? code;

  Versions({
    this.code,
  });

  Versions.fromJson(Map<String, dynamic> json)
      : code = json['code'] as String?;

  Map<String, dynamic> toJson() => {
    'code' : code
  };
}

class Screens {
  final String? url;

  Screens({
    this.url,
  });

  Screens.fromJson(Map<String, dynamic> json)
      : url = json['url'] as String?;

  Map<String, dynamic> toJson() => {
    'url' : url
  };
}