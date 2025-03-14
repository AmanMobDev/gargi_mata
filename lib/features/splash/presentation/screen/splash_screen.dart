import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(SplashInitialEvent()),
      child: Scaffold(
        body: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            debugPrint(state.toString());
            // Handle different states
            if (state is SplashInitialState) {
            } else if (state is SplashLoadingState) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/gargi_splash.jpeg',
                    scale: 1.0,
                    fit: BoxFit.fitHeight,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    color: AppColor.backgroundColorWithOpacity,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "जय गार्गी माता",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          inherit: true,
                          color: AppColor.whiteColor,
                        ),
                      ),
                      SizedBox(height: 50.0),
                    ],
                  ),
                ],
              );
            } else if (state is SplashLoadedState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, RouteName.baseScreen);
              });

              // BlocProvider.of<SplashBloc>(context).add(
              //   SplashInitialEvent(),
              // );
            } else if (state is SplashErrorState) {
              // Display an error message
              return Center(child: Text('Error: ${state.message}'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
