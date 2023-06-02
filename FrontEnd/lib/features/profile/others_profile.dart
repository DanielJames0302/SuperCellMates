import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:supercellmates/http_requests/get_image.dart';
import 'package:supercellmates/http_requests/endpoints.dart';
import 'package:supercellmates/http_requests/make_requests.dart';
import 'package:supercellmates/router/router.gr.dart';
import 'package:supercellmates/features/dialogs.dart';

@RoutePage()
class OthersProfilePage extends StatefulWidget {
  const OthersProfilePage({Key? key, required this.data}) : super(key: key);

  final dynamic data;

  @override
  State<OthersProfilePage> createState() => OthersProfilePageState();
}

class OthersProfilePageState extends State<OthersProfilePage> {
  bool dataLoaded = false;
  dynamic profileImage;

  @override
  void initState() {
    dataLoaded = false;
    super.initState();
    initProfileImage();
  }

  void initProfileImage() async {
    dataLoaded = false;
    profileImage =  await getImage(widget.data["image_url"]);
    setState(() {
      dataLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var tagList = widget.data["tagListString"];
    double myPostsHeight = MediaQuery.of(context).size.height;
    myPostsHeight -= 80; // appbar height
    myPostsHeight -= 60; // taglist height
    myPostsHeight -= 10; // divider height
    myPostsHeight -= 30; // buffer

    void sendFriendRequest() async {
      dynamic body = {"username": widget.data["username"]};

      dynamic message =
          await postWithCSRF(EndPoints.addFriendRequest.endpoint, body);

      if (message == "ok") {
        showSuccessDialog(context, "Friend request sent!");
      } else {
        showErrorDialog(context, message);
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.lightBlue,
        titleSpacing: 0,
        title: Row(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: dataLoaded
                    ? profileImage!
                    : const CircularProgressIndicator(),
                onPressed: () {},
                iconSize: 50,
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Column(children: [
              SizedBox(
                height: 25,
                width: 130,
                child: Text(
                  widget.data["name"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 1),
                height: 20,
                width: 130,
                child: Text(
                  widget.data["username"],
                  style: const TextStyle(fontSize: 14, color: Colors.blueGrey),
                ),
              ),
            ]),
          ],
        ),
        actions: [
          widget.data["is_friend"]
              ? Container()
              : Column(
                  children: [
                    const Padding(padding: EdgeInsets.all(3)),
                    SizedBox(
                      height: 40,
                      child: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          showConfirmationDialog(
                              context,
                              "Are you sure to send a friend request?",
                              sendFriendRequest);
                        },
                        iconSize: 35,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                      child: Text(
                        "Add",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
          Column(
            children: [
              const Padding(padding: EdgeInsets.all(3)),
              SizedBox(
                height: 40,
                child: IconButton(
                  icon: const Icon(Icons.pentagon),
                  onPressed: () => AutoRouter.of(context).push(AchievementRoute(
                      name: widget.data["name"], myProfile: false)),
                  iconSize: 35,
                ),
              ),
              const SizedBox(
                height: 30,
                child: Text(
                  "Lv.1",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          Container(padding: const EdgeInsets.all(5)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            child: Flex(direction: Axis.horizontal, children: [
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: tagList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return tagList[index] == null
                          ? Container()
                          : TextButton(
                              onPressed: () => {},
                              child: Text(tagList[index]["name"]));
                    }),
              )
            ]),
          ),
          const Divider(
            height: 10,
            color: Colors.grey,
            indent: 15,
            endIndent: 15,
          ),
          // TODO: Change to Posts class
          // The Posts should return a column whose width is full width of phone
          // and pass this column to a flex expanded so that can scroll down
          SizedBox(
            height: myPostsHeight,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 30,
                  child: Text("Post Entry $index"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}