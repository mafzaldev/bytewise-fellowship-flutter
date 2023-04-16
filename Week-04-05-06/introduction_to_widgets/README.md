# Introduction to widgets

An example of flutter app with basic widgets and lifecycle methods are shown [here](./widgets_example_app).

Flutter's framework is modern and draws inspiration from React, with the core concept being the construction of UI using widgets. Widgets define the appearance of the view based on their present settings and state. When a widget's state alters, it recreates its definition, and the framework compares it with the previous one to determine the smallest changes required in the render tree to switch between states.

## Running the flutter app

The Flutter app starts with the `main()` function. The `main()` function is the entry point of the app. The `main()` function calls the `runApp()` function to run the app. The `runApp()` function takes the `MyApp` widget and makes it the root of the widget tree. The widget tree in this case consists of a single `MyApp` widget. The `runApp()` function sets the provided Widget as the root of the widget tree. In the example below, the widget tree includes two widgets: the Center widget and its child, the Text widget. The framework automatically scales the root widget to occupy the entire screen, resulting in the "Hello, world" text appearing in the center of the screen. It is necessary to specify the text direction in this example. However, when using the MaterialApp widget, this task is already handled for you, as shown later.

```dart
void main() {
  runApp(
    const Center(
      child: Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
```

While developing an app, it is typical to create new widgets that are either `StatelessWidget` or `StatefulWidget` subclasses, depending on whether they manage state or not. The primary responsibility of a widget is to implement a `build()` function, which defines the widget in terms of other, lower-level widgets. The framework then builds those widgets in sequence until it reaches the bottom-level widgets that represent the underlying RenderObject, which calculates and defines the widget's geometry.

## Basic widgets

Flutter provides a wide variety of basic widgets. The following are some of the most commonly used widgets:

- `Scaffold` - This widget provides a default app bar, title, and a body property that holds the widget tree for the home screen.

- `Text` - The Text widget displays text and can be configured with different fonts, sizes, and colors.

- `Row` and `Column` - These widgets are used to arrange child widgets in a horizontal or vertical list.

- `Stack` - This widget is used to arrange child widgets in a z-index manner.

- `SizeBox` - This widget is used to specify the width and height of a widget.

- `Center` - This widget is used to center its child widget within itself.

- `Container` - This widget is used to create a rectangular visual element. It is a convenience widget that combines common painting, positioning, and sizing widgets.

## Using Material Components

Flutter provides a set of Material widgets that implement the Material Design specification. Material Design is a design language that combines the classic principles of successful design along with innovation and technology. The Flutter framework is built on the same principles as Google's Android and iOS operating systems.

The following example shows how to use the Material Design widgets in a Flutter app.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic Widgets'),
          backgroundColor: Colors.blueGrey,
        ),
        body: const Center(
          child: Text('Hello, world!'),
        ),
      ),
    ),
  );
}
```

In the example above, the `MaterialApp` widget is the root of the widget tree. It provides the theme and other configuration parameters for the app. The `Scaffold` widget provides a default app bar, title, and a body property that holds the widget tree for the home screen. The widget tree in this case consists of a single `Center` widget, which centers its child, the `Text` widget.

## Handling gestures

The Flutter framework provides a `GestureDetector` widget that listens for touch events. The `GestureDetector` widget has a `onTap` property that defines what should happen when the widget is tapped. The following example shows how to use the `GestureDetector` widget to print a message when the screen is tapped.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyButton(),
    ),
  );
}

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: const Center(
          child: Text('Click me!'),
        ),
      ),
    );
  }
}
```

In the example above, the `GestureDetector` widget listens for taps on the `Container` widget. When the `Container` is tapped, it prints `MyButton was tapped!` to the console. The `GestureDetector` widget is a common pattern used in Flutter apps. It is used to detect gestures such as taps, drags, and scales. The `GestureDetector` widget has a `onTap` property that defines what should happen when the widget is tapped. The `GestureDetector` widget also has other gesture detection properties such as `onDoubleTap`, `onLongPress`, and `onVerticalDragUpdate`.

## Changing widgets with user input

In order to build more complex experiences—for example, to react in more interesting ways to user input—applications typically carry some state. Flutter uses StatefulWidgets to capture this idea. StatefulWidgets are special widgets that know how to generate State objects, which are then used to hold state. Consider the following example, which increments a counter each time the user taps the button:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget Example'),
      ),
      body: Center(
        child: Text('You have pushed the button this many times: $counter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

In the above example, the `StatefulWidget` class is called `MyApp`. The `StatefulWidget` class is, itself, immutable, but the `State` class persists over the lifetime of the widget. Here, the `State` class is called `_MyAppState`. When the user taps the button, the `onPressed` callback is called, which calls `setState()`, telling the Flutter framework to redraw the `MyApp` widget with the new counter value. The `setState()` method is a special method that tells the framework to rerun the `build()` method so that the display can reflect the updated values. If we didn't call `setState()`, then the `build()` method would not be called again, and so nothing would appear to happen.

## Responding to widget lifecycle events

When you create a `StatefulWidget` in Flutter, the framework creates a new state object and calls `initState()` on it, allowing you to perform any one-time setup tasks, such as configuring animations or subscribing to platform services. To properly initialize the state object, you must always call `super.initState()` at the beginning of your `initState()` implementation.

Similarly, when the state object is no longer needed, the framework calls `dispose()` on it, giving you an opportunity to clean up any resources that were allocated during the state object's lifetime, such as cancelling timers or unsubscribing from platform services. To ensure proper disposal of the state object, you should call `super.dispose()` at the end of your `dispose()` implementation.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  initState(){
    super.initState();
    someAPICall();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful widget'),
      ),
      body: Column(children: someChildren),
    );
  }
}
```

## Keys

In Flutter, `Keys` are objects that are used to uniquely identify widgets or elements in the widget tree. They are used to help Flutter efficiently update the UI when changes occur in the widget tree.

When a widget is rebuilt, Flutter looks at the old and new widgets and tries to match them up by their types and key values. If a matching widget is found, Flutter will update the existing widget instead of creating a new one. This helps reduce unnecessary widget rebuilds and can improve app performance.

There are several types of keys in Flutter, including:

- `ValueKey`: Used to identify widgets by a specific value, such as a string or number.
- `ObjectKey`: Used to identify widgets by an object reference, such as a model object.
- `GlobalKey`: Used to identify widgets across different parts of the widget tree, such as between parent and child widgets or between different routes.
- `UniqueKey`: Used to identify widgets that are guaranteed to be unique within the widget tree, such as when creating new widgets on demand.
