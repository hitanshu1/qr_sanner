part of 'Widgets.dart';
/// custom Scaffold which will app
class Scaffoldd extends StatelessWidget {
  /// An app bar to display at the top of the scaffold.
  final PreferredSizeWidget? appBar;
  /// body of scaffold
  final Widget? body;
  /// drawer of scaffold
  final Widget?drawer;
  /// The [bottomNavigationBar] is rendered below the [persistentFooterButtons]
  /// and the [body].
  final Widget? bottomNavigationBar;
  /// floating action button
  final FloatingActionButton ?floatingActionButton;
  /// constructor
  const Scaffoldd({super.key,this.body,this.drawer,this.appBar,this.bottomNavigationBar,this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      
      child: Scaffold(
        floatingActionButton: floatingActionButton,
        bottomNavigationBar:bottomNavigationBar ,
        appBar: appBar,
        drawer:drawer ,
        body: SizedBox(
           height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      
          child: body),
      ),
    );
  }
}
