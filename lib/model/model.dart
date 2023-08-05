

class Article {
   final String title;
   final String urlToImage;
   final String description;
   final String author;
   Article({
    required this.title, required this.urlToImage, required this.author, required this.description
   });

   factory Article.fromJson(Map<String, dynamic> json){
    var s = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw7DMGiw_CvnRfrnZUeoS7UX14Wat2jE8ZrA&usqp=CAU';
    return Article(
      title: json["title"] ?? '',
      urlToImage: json["urlToImage"] ?? s,
      author: json["author"] ?? '',
      description: json["description"]??'',
      );
   }


}