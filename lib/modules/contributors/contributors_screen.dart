import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'contributors_bloc.dart';
import 'contributors_body.dart';
import 'models/user.dart';
import '../../themes/contributors_theme.dart';

class ContributorsScreen extends StatelessWidget {
  final String repository;

  ContributorsScreen({this.repository});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ContributorsTheme(
        child: Provider<ContributorsBloc>(
          create: (context) => ContributorsBloc(repository: this.repository),
          dispose: (_, bloc) => bloc.dispose(),
          child: ContributorsBody(
            designer: User(
              name: 'Eugeniu Clim',
              avatarUrl:
                  'https://media-exp2.licdn.com/dms/image/C4E03AQFTJSqGo-jJ9w/profile-displayphoto-shrink_800_800/0?e=1585180800&v=beta&t=WwF4gNih7kBRHsQpiWxIznPdClOImSE2vXcID-xmhAQ',
              location: 'Senior UX/UI Designer @Endava',
            ),
          ),
        ),
      ),
    );
  }
}
