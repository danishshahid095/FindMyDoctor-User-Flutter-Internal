import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../App/locator.dart';
import '../../Utils/constants.dart';
import '../../ViewModels/main_view_model.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  @override
  Widget build(BuildContext context) {
    print("CallID UserApp" + widget.callID);
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return Scaffold();
        // return ZegoUIKitPrebuiltCall(
        //   appID: Constants.appId,
        //   appSign: Constants.appSign,
        //   userID: model.userID.toString(),
        //   userName: model.userID.toString(),
        //   callID: widget.callID,
        //   config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        // );
      },
    );
  }
}