import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

// "flutter packages pub run build_runner watch"

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: MainScaffold.page),
        AutoRoute(page: FriendsRoute.page),
        AutoRoute(page: PrivacyAgreementRoute.page),
        AutoRoute(page: AchievementRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: AddTagRoute.page),
        AutoRoute(page: EditProfileRoute.page),
        AutoRoute(page: ChangeNameRoute.page),
        AutoRoute(page: ChangeUsernameRoute.page),
        AutoRoute(page: ChangePasswordRoute.page),
        AutoRoute(page: OthersProfileRoute.page),
        AutoRoute(page: RequestTagRoute.page),
        AutoRoute(page: CreatePostRoute.page),
        AutoRoute(page: SinglePhotoViewer.page),
        AutoRoute(page: MultiplePhotosViewer.page),
        AutoRoute(page: ChatRoomRoute.page),
        AutoRoute(page: CreateGroupRoute.page),
        AutoRoute(page: GroupChatSettingsRoute.page),
        AutoRoute(page: GroupChatInviteFriendRoute.page),
        AutoRoute(page: OnePostRoute.page),
      ];
}
