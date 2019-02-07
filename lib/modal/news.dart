/**
 * News Bean
 * 
 */

class News {
  String reason;
  Result result;
  int errorCode;

  News({this.reason, this.result, this.errorCode});

  News.fromJson(Map<String, dynamic> json) {
    reason = json['reason'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reason'] = this.reason;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['error_code'] = this.errorCode;
    return data;
  }
}

class Result {
  String stat;
  List<Data> data;

  Result({this.stat, this.data});

  Result.fromJson(Map<String, dynamic> json) {
    stat = json['stat'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stat'] = this.stat;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String uniquekey;
  String title;
  String date;
  String category;
  String authorName;
  String url;
  String thumbnailPicS;
  String thumbnailPics2;
  String thumbnailPics3;

  Data(
      {this.uniquekey,
      this.title,
      this.date,
      this.category,
      this.authorName,
      this.url,
      this.thumbnailPicS,
      this.thumbnailPics2,
      this.thumbnailPics3});

  Data.fromJson(Map<String, dynamic> json) {
    uniquekey = json['uniquekey'];
    title = json['title'];
    date = json['date'];
    category = json['category'];
    authorName = json['author_name'];
    url = json['url'];
    thumbnailPicS = json['thumbnail_pic_s'];
    thumbnailPics2 = json['thumbnail_pic_s02'];
    thumbnailPics3 = json['thumbnail_pic_s03'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uniquekey'] = this.uniquekey;
    data['title'] = this.title;
    data['date'] = this.date;
    data['category'] = this.category;
    data['author_name'] = this.authorName;
    data['url'] = this.url;
    data['thumbnail_pic_s'] = this.thumbnailPicS;
    data['thumbnail_pic_s02'] = this.thumbnailPics2;
    data['thumbnail_pic_s03'] = this.thumbnailPics3;
    
    return data;
  }
}
