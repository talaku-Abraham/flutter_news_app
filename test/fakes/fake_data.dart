import 'package:news_app/data/model/article.dart';

final fakeArticles = [
  Article(
    author: "Lucas Ropek",
    content: '''
Ever since the crypto industry helped
 bankroll his presidential campaign last year,
  Trump and the HODLers have been on pretty good terms. The Trump family is busy launching its own crypto 
 ventures wh… [+2568 chars''',
    description:
        "A new report claims that Roger Ver may have reached a deal with the government.",
    publishedAt: "2025-10-10T13:50:09Z",
    source: "Gizmodo.com",
    title: "Under Trump, ‘Bitcoin Jesus’ May Be Redeemed",
    url:
        "https://gizmodo.com/under-trump-bitcoin-jesus-may-be-redeemed-2000670784",
    urlToImage:
        "https://gizmodo.com/app/uploads/2025/10/Roger-Ver-1200x675.jpg",
  ),
];
final fakeJson = {
  "status": "ok",
  "totalResults": 12300,
  "articles": [
    {
      "source": {"id": null, "name": "Gizmodo.com"},
      "author": "Lucas Ropek",
      "title": "Under Trump, ‘Bitcoin Jesus’ May Be Redeemed",
      "description":
          "A new report claims that Roger Ver may have reached a deal with the government.",
      "url":
          "https://gizmodo.com/under-trump-bitcoin-jesus-may-be-redeemed-2000670784",
      "urlToImage":
          "https://gizmodo.com/app/uploads/2025/10/Roger-Ver-1200x675.jpg",
      "publishedAt": "2025-10-10T13:50:09Z",
      "content":
          "Ever since the crypto industry helped bankroll his presidential campaign last year, Trump and the HODLers have been on pretty good terms. The Trump family is busy launching its own crypto ventures wh… [+2568 chars]",
    },
  ],
};
