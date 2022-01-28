import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Browser'),
          actions: [
            NavigationController(_controller.future)
          ],
        ),
        body: Builder(
          builder: (BuildContext context){
            return WebView(
              initialUrl: "https://google.com",
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController){
                _controller.complete(webViewController);
              },
              javascriptChannels: <JavascriptChannel>[
                snackbarJavascript(context)
              ].toSet(),
            );
          },
        ),
      ),
    );
  }
}

JavascriptChannel snackbarJavascript(BuildContext context){
  return JavascriptChannel(
      name: 'SnackBarJSChannel',
      onMessageReceived: (JavascriptMessage message){
        Scaffold.of(context).showSnackBar(
            SnackBar(
                content: Text(message.message)
            )
        );
      }
  );
}

class NavigationController extends StatelessWidget {
  NavigationController(this._webviewControllerFuture);
  final Future<WebViewController> _webviewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _webviewControllerFuture,
        builder: (BuildContext context, AsyncSnapshot<WebViewController> snapshot){
          final bool webViewReady = snapshot.connectionState ==
              ConnectionState.done;
          final WebViewController controller = snapshot.data;

          return Row(
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: !webViewReady ? null : ()async{
                    if(await controller.canGoBack()){
                      controller.goBack();
                    }
                    else{
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text("No Back History Item")));
                    }
                  }
              ),
              IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: !webViewReady ? null : ()async{
                    if(await controller.canGoForward()){
                      controller.goForward();
                    }
                    else{
                      Scaffold.of(context).showSnackBar(SnackBar(content:
                      Text("No Forward History Item")));
                    }
                  }
              ),
              IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: !webViewReady ? null : ()async{
                    controller.reload();
                  }
              ),
            ],
          );
        }
    );
  }
}

