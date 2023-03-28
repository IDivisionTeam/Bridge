import 'package:bridge/ui/application.dart';
import 'package:core_data/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'widget_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthenticationRepository>(),
  MockSpec<RoomRepository>(),
  MockSpec<UserRepository>(),
  MockSpec<TokenRepository>(),
])
void main() {
  testWidgets('blank test', (WidgetTester tester) async {
    final application = Application(
      authenticationRepository: MockAuthenticationRepository(),
      roomRepository: MockRoomRepository(),
      userRepository: MockUserRepository(),
      tokenRepository: MockTokenRepository(),
    );

    await tester.pumpWidget(application);
    await tester.pumpAndSettle(const Duration(seconds: 1));
  });
}
