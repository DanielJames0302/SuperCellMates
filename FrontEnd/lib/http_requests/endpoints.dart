enum EndPoints {
  home,
  login,
  checkUniqueUsername,
  register,
  logout,
  addTagRequest,

  profileIndex,
  addTags,
  obtainTags,
  searchTags,
  canRemoveTag,
  removeTag,
  setProfileImage,
  changeUsername, 
  changePassword,
  changeName,

  viewFriends,
  viewFriendRequests,
  addFriendRequest,
  search,
  searchUsername,
  searchFriend,
  viewProfile,
  addFriend,
  deleteFriend,

  createPost,
  getProfilePosts,
  editPost,
  deletePost,

  getHomeFeed,
  getPost,

  getChatID,
  getPrivateChats,
  getGroupChats,
  getPrivateMessages,
  getGroupMessages,
  uploadFile,
  getImage,
  createGroupChat,
  getMembers,
  addMember,
  removeUser,
  removeAdmin,
  addAdmin,
  transferOwnership,

  getUnreadChats,
  seeMessage,
  getAcceptedRequests,

}

extension ExtendedEndPoints on EndPoints {
  static const endpoints = {
    EndPoints.home: "/home_async",
    EndPoints.login: "/login_async",
    EndPoints.checkUniqueUsername: "/check_unique_username_async",
    EndPoints.register: "/register_async",
    EndPoints.logout: "/logout_async",
    EndPoints.addTagRequest: "/add_tag_request",
    EndPoints.profileIndex: "/profile/async",
    EndPoints.addTags: "/profile/add_tags",
    EndPoints.obtainTags: "/profile/obtain_tags",
    EndPoints.searchTags: "/profile/search_tags",
    EndPoints.setProfileImage: "/profile/set_profile_image",
    EndPoints.changeUsername: "/change_username",
    EndPoints.changePassword: "/change_password",
    EndPoints.changeName: "/profile/change_name",
    EndPoints.viewFriends: "/user/friends_async",
    EndPoints.viewFriendRequests: "/user/friend_requests_async",
    EndPoints.addFriendRequest: "/user/add_friend_request",
    EndPoints.search: "/user/search",
    EndPoints.searchUsername: "/user/search_username",
    EndPoints.searchFriend: "/user/search_friend",
    EndPoints.viewProfile: "/user/profile_async",
    EndPoints.addFriend: "/user/add_friend",
    EndPoints.deleteFriend: "/user/delete_friend",
    EndPoints.createPost: "/post/create_post",
    EndPoints.getProfilePosts: "/post/posts/",
    EndPoints.editPost: "/post/post/edit/",
    EndPoints.deletePost: "/post/delete",
    EndPoints.getHomeFeed: "/post/",
    EndPoints.getPost: "/post/post/",
    EndPoints.getChatID: "/messages/get_chat_id",
    EndPoints.getPrivateChats: "/messages/get_private_chats",
    EndPoints.getGroupChats: "/messages/get_group_chats",
    EndPoints.getPrivateMessages: "/messages/get_private_messages/",
    EndPoints.getGroupMessages: "/messages/get_group_messages/",
    EndPoints.uploadFile: "/messages/upload_file",
    EndPoints.getImage: "/messages/image/",
    EndPoints.createGroupChat: "/messages/create_group_chat",
    EndPoints.getMembers: "/messages/get_members",
    EndPoints.addMember: "/messages/add_member",
    EndPoints.removeUser: "/messages/remove_user",
    EndPoints.removeAdmin: "/messages/remove_admin",
    EndPoints.addAdmin: "/messages/add_admin",
    EndPoints.transferOwnership: "/messages/assign_leader",
    EndPoints.canRemoveTag: "/profile/can_remove_tag",
    EndPoints.removeTag: "/profile/remove_tag",    
    EndPoints.getUnreadChats: "/notification/chats_new_messages",
    EndPoints.seeMessage: "/notification/see_message",
    EndPoints.getAcceptedRequests: "/notification/friends",

  };

  String get endpoint => endpoints[this]!;
}
