import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdp_ui9_instagram_blackfone/model/post_model.dart';
import 'package:pdp_ui9_instagram_blackfone/model/story_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Story> _stories = [
    Story('assets/images/user_1.jpeg', 'Jazmin'),
    Story('assets/images/user_2.jpeg', 'Sylvester'),
    Story('assets/images/user_3.jpeg', 'Lavina'),
    Story('assets/images/user_1.jpeg', 'Jazmin'),
    Story('assets/images/user_2.jpeg', 'Sylvester'),
    Story('assets/images/user_3.jpeg', 'Lavina'),
  ];

  List<Post> _posts = [
    Post(
        userName: 'Brianne',
        userImage: 'assets/images/user_1.jpeg',
        postImage: 'assets/images/feed_1.jpeg',
        caption: 'Consequatur nihil aliquid omnis consequatur'),
    Post(
        userName: 'Henri',
        userImage: 'assets/images/user_2.jpeg',
        postImage: 'assets/images/feed_2.jpeg',
        caption: 'Consequatur nihil aliquid omnis consequatur'),
    Post(
        userName: 'Mariano',
        userImage: 'assets/images/user_3.jpeg',
        postImage: 'assets/images/feed_3.jpeg',
        caption: 'Consequatur nihil aliquid omnis consequatur'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),
              //#stories
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Stories',
                      style: TextStyle(color: Colors.grey[200], fontSize: 14),
                    ),
                    Text(
                      'Watch all',
                      style: TextStyle(color: Colors.grey[200], fontSize: 14),
                    ),
                  ],
                ),
              ),
              // #storyList
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: _stories.map((story) {
                    return _itemOfStory(story);
                  }).toList(),
                ),
              ),

              // #postList
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _posts.length,
                  itemBuilder: (ctx, i) {
                    return _itemOfPost(_posts[i]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemOfStory(Story story) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              border: Border.all(
                width: 3,
                color: Color(0xFF8e44ad),
              )),
          child: Container(
            padding: EdgeInsets.all(1),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          story.name,
          style: TextStyle(color: Colors.grey[200]),
        ),
      ],
    );
  }

  Widget _itemOfPost(Post post) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      post.userName,
                      style: TextStyle(color: Colors.grey[200]),
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    SimpleLineIcons.options,
                    color: Colors.grey[200],
                  ),
                ),
              ],
            ),
          ),
          FadeInImage(
            placeholder: AssetImage('assets/images/placeholder.png'),
            image: AssetImage(post.postImage),
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
