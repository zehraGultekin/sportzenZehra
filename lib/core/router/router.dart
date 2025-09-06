import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/feature/home/view/club_register.dart';
import 'package:sportzenzehra/feature/home/view/home_view.dart';
import 'package:sportzenzehra/feature/home/view/news_atp_view.dart';
import 'package:sportzenzehra/feature/home/view/news_tenis_view.dart';
import 'package:sportzenzehra/feature/home/view/news_view.dart';
import 'package:sportzenzehra/feature/home/view/reservation_view.dart';
import 'package:sportzenzehra/feature/login/view/login_view.dart';
import 'package:sportzenzehra/feature/login/view/register_view.dart';
import 'package:sportzenzehra/feature/messages/view/message_view.dart';
import 'package:sportzenzehra/feature/navigator/views/navigator_view.dart';
import 'package:sportzenzehra/feature/notification/view/notification_view.dart';
import 'package:sportzenzehra/feature/reservation/view/reservation_view.dart';
import 'package:sportzenzehra/feature/settings/view/account_settings_view.dart';
import 'package:sportzenzehra/feature/settings/view/change_password.dart';
import 'package:sportzenzehra/feature/settings/view/finance_view.dart';
import 'package:sportzenzehra/feature/settings/view/help_center.dart';
import 'package:sportzenzehra/feature/settings/view/kvkk_view.dart';
import 'package:sportzenzehra/feature/settings/view/profile_view.dart';
import 'package:sportzenzehra/feature/settings/view/settings_view.dart';

enum AppRoutes {
  login,
  home,
  reservation,
  reservationDetail,
  notification,
  messages,
  settings,
  register,
  news,
  profile,
  kvkk,
  finance,
  account,
  changePassword,
  helpCenter,
  newsAtp,
  newsTenis,
  clubRegister;

  String get path => "/$name";
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.login.path,
  routes: [
    GoRoute(
      path: AppRoutes.login.path,
      name: AppRoutes.login.name,
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: AppRoutes.register.path,
      name: AppRoutes.register.name,
      builder: (context, state) => RegisterView(),
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          (BottomNavigator(navigationShell: navigationShell)),

      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home.path,
              name: AppRoutes.home.name,
              builder: (context, state) => HomeView(),
              routes: [
                GoRoute(
                  path: AppRoutes.clubRegister.path,
                  name: AppRoutes.clubRegister.name,
                  builder: (context, state) => ClubRegisterView(),
                ),
                GoRoute(
                  path: AppRoutes.news.path,
                  name: AppRoutes.news.name,
                  builder: (context, state) => NewsView(),
                  routes: [
                    GoRoute(
                      path: AppRoutes.newsAtp.path,
                      name: AppRoutes.newsAtp.name,
                      builder: (context, state) => NewAtpDetail(),
                    ),
                    GoRoute(
                      path: AppRoutes.newsTenis.path,
                      name: AppRoutes.newsTenis.name,
                      builder: (context, state) => NewsTenisDetail(),
                    ),
                  ],
                ),
                GoRoute(
                  path: AppRoutes.reservationDetail.path,
                  name: AppRoutes.reservationDetail.name,
                  builder: (context, state) => ReservationDetailView(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.reservation.path,
              name: AppRoutes.reservation.name,
              builder: (context, state) => ReservationView(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.notification.path,
              name: AppRoutes.notification.name,
              builder: (context, state) => NotificationView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.messages.path,
              name: AppRoutes.messages.name,
              builder: (context, state) => MessageView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.settings.path,
              name: AppRoutes.settings.name,
              builder: (context, state) => SettingsView(),
              routes: [
                GoRoute(
                  path: AppRoutes.profile.path,
                  name: AppRoutes.profile.name,
                  builder: (context, state) => ProfileView(),
                ),
                GoRoute(
                  path: AppRoutes.kvkk.path,
                  name: AppRoutes.kvkk.name,
                  builder: (context, state) => KvkkView(),
                ),
                GoRoute(
                  path: AppRoutes.finance.path,
                  name: AppRoutes.finance.name,
                  builder: (context, state) => FinanceView(),
                ),
                GoRoute(
                  path: AppRoutes.account.path,
                  name: AppRoutes.account.name,
                  builder: (context, state) => AccountSettingsView(),
                  routes: [
                    GoRoute(
                      path: AppRoutes.changePassword.path,
                      name: AppRoutes.changePassword.name,
                      builder: (context, state) => ChangePasswordView(),
                    ),
                  ],
                ),
                GoRoute(
                  path: AppRoutes.helpCenter.path,
                  name: AppRoutes.helpCenter.name,
                  builder: (context, state) => HelpCenterView(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
