import 'dart:convert';

class PixaBayImage {
  int? id;
  String? pageUrl;
  String? type;
  String? tags;
  String? previewUrl;
  int? previewWidth;
  int? previewHeight;
  String? webformatUrl;
  int? webformatWidth;
  int? webformatHeight;
  String? largeImageUrl;
  String? fullHdurl;
  String? imageUrl;
  int? imageWidth;
  int? imageHeight;
  int? imageSize;
  int? views;
  int? downloads;
  int? likes;
  int? comments;
  int? userId;
  String? user;
  String? userImageUrl;
  PixaBayImage({
    this.id,
    this.pageUrl,
    this.type,
    this.tags,
    this.previewUrl,
    this.previewWidth,
    this.previewHeight,
    this.webformatUrl,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageUrl,
    this.fullHdurl,
    this.imageUrl,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageUrl,
  });

  PixaBayImage copyWith({
    int? id,
    String? pageUrl,
    String? type,
    String? tags,
    String? previewUrl,
    int? previewWidth,
    int? previewHeight,
    String? webformatUrl,
    int? webformatWidth,
    int? webformatHeight,
    String? largeImageUrl,
    String? fullHdurl,
    String? imageUrl,
    int? imageWidth,
    int? imageHeight,
    int? imageSize,
    int? views,
    int? downloads,
    int? likes,
    int? comments,
    int? userId,
    String? user,
    String? userImageUrl,
  }) {
    return PixaBayImage(
      id: id ?? this.id,
      pageUrl: pageUrl ?? this.pageUrl,
      type: type ?? this.type,
      tags: tags ?? this.tags,
      previewUrl: previewUrl ?? this.previewUrl,
      previewWidth: previewWidth ?? this.previewWidth,
      previewHeight: previewHeight ?? this.previewHeight,
      webformatUrl: webformatUrl ?? this.webformatUrl,
      webformatWidth: webformatWidth ?? this.webformatWidth,
      webformatHeight: webformatHeight ?? this.webformatHeight,
      largeImageUrl: largeImageUrl ?? this.largeImageUrl,
      fullHdurl: fullHdurl ?? this.fullHdurl,
      imageUrl: imageUrl ?? this.imageUrl,
      imageWidth: imageWidth ?? this.imageWidth,
      imageHeight: imageHeight ?? this.imageHeight,
      imageSize: imageSize ?? this.imageSize,
      views: views ?? this.views,
      downloads: downloads ?? this.downloads,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      userId: userId ?? this.userId,
      user: user ?? this.user,
      userImageUrl: userImageUrl ?? this.userImageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (pageUrl != null) {
      result.addAll({'pageUrl': pageUrl});
    }
    if (type != null) {
      result.addAll({'type': type});
    }
    if (tags != null) {
      result.addAll({'tags': tags});
    }
    if (previewUrl != null) {
      result.addAll({'previewUrl': previewUrl});
    }
    if (previewWidth != null) {
      result.addAll({'previewWidth': previewWidth});
    }
    if (previewHeight != null) {
      result.addAll({'previewHeight': previewHeight});
    }
    if (webformatUrl != null) {
      result.addAll({'webformatUrl': webformatUrl});
    }
    if (webformatWidth != null) {
      result.addAll({'webformatWidth': webformatWidth});
    }
    if (webformatHeight != null) {
      result.addAll({'webformatHeight': webformatHeight});
    }
    if (largeImageUrl != null) {
      result.addAll({'largeImageUrl': largeImageUrl});
    }
    if (fullHdurl != null) {
      result.addAll({'fullHdurl': fullHdurl});
    }
    if (imageUrl != null) {
      result.addAll({'imageUrl': imageUrl});
    }
    if (imageWidth != null) {
      result.addAll({'imageWidth': imageWidth});
    }
    if (imageHeight != null) {
      result.addAll({'imageHeight': imageHeight});
    }
    if (imageSize != null) {
      result.addAll({'imageSize': imageSize});
    }
    if (views != null) {
      result.addAll({'views': views});
    }
    if (downloads != null) {
      result.addAll({'downloads': downloads});
    }
    if (likes != null) {
      result.addAll({'likes': likes});
    }
    if (comments != null) {
      result.addAll({'comments': comments});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (user != null) {
      result.addAll({'user': user});
    }
    if (userImageUrl != null) {
      result.addAll({'userImageUrl': userImageUrl});
    }

    return result;
  }

  factory PixaBayImage.fromMap(Map<String, dynamic> map) {
    return PixaBayImage(
      id: map['id']?.toInt(),
      pageUrl: map['pageURL'],
      type: map['type'] ?? '',
      tags: map['tags'] ?? '',
      previewUrl: map['previewURL'] ??
          'https://cdn.pixabay.com/photo/2013/10/15/09/12/flower-195893_150.jpg',
      previewWidth: map['previewWidth']?.toInt(),
      previewHeight: map['previewHeight']?.toInt(),
      webformatUrl: map['webformatURL'],
      webformatWidth: map['webformatWidth']?.toInt(),
      webformatHeight: map['webformatHeight']?.toInt(),
      largeImageUrl: map['largeImageURL'],
      fullHdurl: map['fullHDURL'],
      imageUrl: map['imageURL'],
      imageWidth: map['imageWidth']?.toInt(),
      imageHeight: map['imageHeight']?.toInt(),
      imageSize: map['imageSize']?.toInt(),
      views: map['views']?.toInt(),
      downloads: map['downloads']?.toInt(),
      likes: map['likes']?.toInt(),
      comments: map['comments']?.toInt(),
      userId: map['user_id']?.toInt(),
      user: map['user'] ?? 'Unknown',
      userImageUrl: map['userImageURL'] ??
          'https://cdn.pixabay.com/photo/2013/10/15/09/12/flower-195893_150.jpg',
    );
  }

  String toJson() => json.encode(toMap());

  factory PixaBayImage.fromJson(String source) =>
      PixaBayImage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PixaBayImage(id: $id, pageUrl: $pageUrl, type: $type, tags: $tags, previewUrl: $previewUrl, previewWidth: $previewWidth, previewHeight: $previewHeight, webformatUrl: $webformatUrl, webformatWidth: $webformatWidth, webformatHeight: $webformatHeight, largeImageUrl: $largeImageUrl, fullHdurl: $fullHdurl, imageUrl: $imageUrl, imageWidth: $imageWidth, imageHeight: $imageHeight, imageSize: $imageSize, views: $views, downloads: $downloads, likes: $likes, comments: $comments, userId: $userId, user: $user, userImageUrl: $userImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PixaBayImage &&
        other.id == id &&
        other.pageUrl == pageUrl &&
        other.type == type &&
        other.tags == tags &&
        other.previewUrl == previewUrl &&
        other.previewWidth == previewWidth &&
        other.previewHeight == previewHeight &&
        other.webformatUrl == webformatUrl &&
        other.webformatWidth == webformatWidth &&
        other.webformatHeight == webformatHeight &&
        other.largeImageUrl == largeImageUrl &&
        other.fullHdurl == fullHdurl &&
        other.imageUrl == imageUrl &&
        other.imageWidth == imageWidth &&
        other.imageHeight == imageHeight &&
        other.imageSize == imageSize &&
        other.views == views &&
        other.downloads == downloads &&
        other.likes == likes &&
        other.comments == comments &&
        other.userId == userId &&
        other.user == user &&
        other.userImageUrl == userImageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        pageUrl.hashCode ^
        type.hashCode ^
        tags.hashCode ^
        previewUrl.hashCode ^
        previewWidth.hashCode ^
        previewHeight.hashCode ^
        webformatUrl.hashCode ^
        webformatWidth.hashCode ^
        webformatHeight.hashCode ^
        largeImageUrl.hashCode ^
        fullHdurl.hashCode ^
        imageUrl.hashCode ^
        imageWidth.hashCode ^
        imageHeight.hashCode ^
        imageSize.hashCode ^
        views.hashCode ^
        downloads.hashCode ^
        likes.hashCode ^
        comments.hashCode ^
        userId.hashCode ^
        user.hashCode ^
        userImageUrl.hashCode;
  }
}
