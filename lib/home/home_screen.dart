import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController commentController = TextEditingController();
  List<TextEditingController> commentReplyControllers = [];
  List<CommentsModel> data = [
    CommentsModel(
        image: "assets/image.png.png",
        name: "Lurline",
        comment:
            "I don't know. He had a great start to the season? Maybe he can bring it back",
        time: "15 min",
        isReply: false,
        isFavorite: false,
        replies: [] // Initialize the replies as an empty list
        ),
    CommentsModel(
        image: "assets/image.png.png",
        name: "Lurline",
        comment:
            "I don't know. He had a great start to the season? Maybe he can bring it back",
        time: "15 min",
        isReply: false,
        isFavorite: false,
        replies: [] // Initialize the replies as an empty list
        ),
    CommentsModel(
        image: "assets/image.png.png",
        name: "Lurline",
        comment:
            "I don't know. He had a great start to the season? Maybe he can bring it back",
        time: "15 min",
        isReply: false,
        isFavorite: false,
        replies: [] // Initialize the replies as an empty list
        ),
    CommentsModel(
        image: "assets/image.png.png",
        name: "Lurline",
        comment:
            "I don't know. He had a great start to the season? Maybe he can bring it back",
        time: "15 min",
        isReply: false,
        isFavorite: false,
        replies: [] // Initialize the replies as an empty list
        ),
  ];

  @override
  void dispose() {
    // Dispose each controller in the list
    for (var controller in commentReplyControllers) {
      controller.dispose();
    }
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Comments"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.only(topRight: Radius.circular(33))),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // Ensure the commentReplyControllers list is large enough for each comment
                    if (commentReplyControllers.length <= index) {
                      commentReplyControllers.add(TextEditingController());
                    }
                    return Column(
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(data[index].image))),
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                              width: 260,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data[index].name),
                                  const SizedBox(height: 8),
                                  Text(data[index].comment),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(data[index].time)
                          ],
                        ),
                        const SizedBox(height: 8),
                        data[index].isReply
                            ? Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          width: 1, color: Colors.grey)),
                                  child: TextFormField(
                                    controller: commentReplyControllers[index],
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(top: 40),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              data[index].isReply =
                                                  !data[index].isReply;
                                              data[index].replies.add(
                                                    CommentsModel(
                                                      image:
                                                          "assets/image.png.png",
                                                      name: "Mark",
                                                      comment:
                                                          commentReplyControllers[
                                                                  index]
                                                              .text
                                                              .trim(),
                                                      time: "15 min",
                                                      isReply: false,
                                                      isFavorite: false,
                                                      replies: [],
                                                    ),
                                                  );
                                            });
                                          },
                                          child: const Icon(Icons.send),
                                        ),
                                      ),
                                      border: const OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(left: 45),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          data[index].isReply =
                                              !data[index].isReply;
                                        });
                                      },
                                      child: const Icon(Icons.reply_all),
                                    ),
                                    const SizedBox(width: 70),
                                    data[index].isFavorite
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                data[index].isFavorite =
                                                    !data[index].isFavorite;
                                              });
                                            },
                                            child: const Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                data[index].isFavorite =
                                                    !data[index].isFavorite;
                                              });
                                            },
                                            child: const Icon(Icons
                                                .favorite_border_outlined)),
                                  ],
                                ),
                              ),
                        const SizedBox(height: 20),
                        // Display the replies for each comment
                        if (data[index].replies.isNotEmpty)
                          ListView.builder(
                            itemCount: data[index].replies.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, replyIndex) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(data[index]
                                                  .replies[replyIndex]
                                                  .image))),
                                    ),
                                    const SizedBox(width: 12),
                                    SizedBox(
                                      width: 260,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(data[index]
                                              .replies[replyIndex]
                                              .name),
                                          const SizedBox(height: 8),
                                          Text(data[index]
                                              .replies[replyIndex]
                                              .comment),
                                          const SizedBox(height: 8),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        const Divider()
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: Colors.grey.shade100)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                SizedBox(
                  width: 290,
                  child: TextFormField(
                    controller: commentController,
                    decoration: const InputDecoration(
                        hintText: "Type here something...",
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        data.add(CommentsModel(
                          image: "assets/image.png.png",
                          name: "Lurline",
                          comment: commentController.text.trim(),
                          time: "15 min",
                          isReply: false,
                          isFavorite: false,
                          replies: [], // Initialize with an empty list
                        ));
                      });
                    },
                    child: const Icon(Icons.send))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommentsModel {
  final String image;
  final String name;
  final String comment;
  final String time;
  bool isReply;
  bool isFavorite;
  List<CommentsModel>
      replies; // Added this line to hold replies for each comment

  CommentsModel({
    required this.image,
    required this.name,
    required this.comment,
    required this.time,
    required this.isReply,
    required this.isFavorite,
    this.replies = const [], // Initialize with an empty list
  });
}
