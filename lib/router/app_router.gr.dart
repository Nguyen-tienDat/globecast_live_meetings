// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$GcbAppRouter extends RootStackRouter {
  // ignore: unused_element
  _$GcbAppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CreateMeetingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateMeetingScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    JoinMeetingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JoinMeetingScreen(),
      );
    },
    MeetingRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MeetingRouteArgs>(
          orElse: () => MeetingRouteArgs(code: pathParams.getString('code')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MeetingScreen(
          key: args.key,
          code: args.code,
        ),
      );
    },
  };
}

/// generated route for
/// [CreateMeetingScreen]
class CreateMeetingRoute extends PageRouteInfo<void> {
  const CreateMeetingRoute({List<PageRouteInfo>? children})
      : super(
          CreateMeetingRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateMeetingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JoinMeetingScreen]
class JoinMeetingRoute extends PageRouteInfo<void> {
  const JoinMeetingRoute({List<PageRouteInfo>? children})
      : super(
          JoinMeetingRoute.name,
          initialChildren: children,
        );

  static const String name = 'JoinMeetingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MeetingScreen]
class MeetingRoute extends PageRouteInfo<MeetingRouteArgs> {
  MeetingRoute({
    Key? key,
    required String code,
    List<PageRouteInfo>? children,
  }) : super(
          MeetingRoute.name,
          args: MeetingRouteArgs(
            key: key,
            code: code,
          ),
          rawPathParams: {'code': code},
          initialChildren: children,
        );

  static const String name = 'MeetingRoute';

  static const PageInfo<MeetingRouteArgs> page =
      PageInfo<MeetingRouteArgs>(name);
}

class MeetingRouteArgs {
  const MeetingRouteArgs({
    this.key,
    required this.code,
  });

  final Key? key;

  final String code;

  @override
  String toString() {
    return 'MeetingRouteArgs{key: $key, code: $code}';
  }
}
