import 'package:find_my_doctor/Utils/all_imports.dart';

class WholePageLoader extends StatelessWidget {
  const WholePageLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SizedBox(
          height: 10.i,width: 10.i,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(ColorUtils.red),
          ),
        ),
      ),
    );
  }
}