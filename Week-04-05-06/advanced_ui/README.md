# Advanced UI

## Actions and Shortcuts

`Actions` are necessary for GUI applications to execute user requests. However, in larger applications, the code for invoking the action and the code for the action itself may be in different places, and shortcuts may need to be defined at a high level. Flutter's actions and shortcuts system addresses this by allowing developers to define actions that fulfill intents bound to them. An `Intent` is a general action that the user wants to perform, and it can be fulfilled by different actions in different contexts. `Shortcuts` are key bindings that activate by pressing a key or combination of keys, and they are associated with an intent. When activated, shortcuts send their matching intent to the actions subsystem for fulfillment. This article demonstrates how to use actions and shortcuts to allow users to select and copy text in a text field using buttons and shortcuts.

#### Why separate Actions from Intents?

Intents serve as a useful layer of abstraction between key mapping definitions and action definitions. They allow a single key combination to be mapped to the intended operation in an app, which can adapt automatically to the focused context. Flutter's `ActivateIntent` widget maps each control to its corresponding version of an `ActivateAction`, which is executed when the control is activated. Without Intents, action definitions would need to be elevated to a level where shortcuts could see them, causing shortcuts to have unnecessary knowledge about which action to invoke and state that it does not need. Intents allow actions to serve multiple uses by configuring them to fulfill different intents. However, care should be taken not to pass state in the Intent that applies to all invocations of an Action. Instead, this state should be passed to the `Constructor` of the Action to keep the Intent from knowing too much. An example of an Intent is `DirectionalFocusIntent`, which takes a direction to move the focus in and allows the `DirectionalFocusAction` to know which direction to move the focus.

#### Why not use callbacks?

You may ask why use an Action object instead of a callback. The reason for using an Action object is that it allows the actions to determine if they are enabled or not by implementing the `isEnabled` method. Moreover, it's beneficial to have the key bindings and their implementation separated into different locations.

If you don't require the flexibility of Actions and Shortcuts and only need callbacks, you can utilize the `CallbackShortcuts` widget. The example for `CallbackShortcuts` is shown [here](./advanced_ui_examples/lib/callback_shortcuts_example.dart).

### Shortcuts

Actions can be used independently, but they are often bound to keyboard shortcuts using the `Shortcuts` widget. This widget is inserted into the widget hierarchy to define key combinations that represent the user's intent when the keys are pressed. To associate the key combination with a specific action, the Actions widget maps the intent to an action. For example, a SelectAllIntent can be mapped to a `SelectAllAction` or a `CanvasSelectAllAction`. The map in the Shortcuts widget maps a LogicalKeySet or a ShortcutActivator to an Intent instance, where the LogicalKeySet represents a set of one or more keys, and the intent indicates the intended purpose of the keypress. When a keypress is detected, the Shortcuts widget looks up the intent in the map and passes it to the action's invoke() method.

#### The ShortcutManager

The shortcut manager is a persistent object that receives key events and determines how to handle them by walking up the tree to find other shortcut mappings. It maintains a map of key combinations to intents. The Shortcuts widget can be customized by subclassing the `ShortcutManager` passed to it.

For example, if you wanted to log each key that a Shortcuts widget handled, you could make a `LoggingShortcutManager`:

```dart
class LoggingShortcutManager extends ShortcutManager {
  @override
  KeyEventResult handleKeypress(BuildContext context, RawKeyEvent event) {
    final KeyEventResult result = super.handleKeypress(context, event);
    if (result == KeyEventResult.handled) {
      print('Handled shortcut $event in $context');
    }
    return result;
  }
}
```

### Actions

`Actions` are functions that can be invoked by an Intent to perform operations in an application. They can be enabled or disabled and receive arguments from the Intent to allow configuration.

#### Defining an Action

Actions, in their simplest form, are just subclasses of Action<Intent> with an invoke() method. Here’s a simple action that simply invokes a function on the provided model:

```dart
class SelectAllAction extends Action<SelectAllIntent> {
  SelectAllAction(this.model);

  final Model model;

  @override
  void invoke(covariant SelectAllIntent intent) => model.selectAll();
}
```

#### Invoking Actions

The actions system can be invoked in various ways, including through the use of the Shortcuts widget. However, there are also other ways to access and trigger actions within the system that are not bound to keys.

To invoke the action (if it exists), call:

```dart
Object? result = Actions.maybeInvoke<SelectAllIntent>(context, SelectAllIntent());
```

The Actions.handler function is used to invoke an action in response to pressing a button or another control. It creates a handler closure if the intent has a mapping to an enabled action. If there is no matching enabled action in the context, it returns null, which disables the button.

```dart
@override
Widget build(BuildContext context) {
  return Actions(
    actions: <Type, Action<Intent>>{
      SelectAllIntent: SelectAllAction(model),
    },
    child: Builder(
      builder: (context) => TextButton(
        child: const Text('SELECT ALL'),
        onPressed: Actions.handler<SelectAllIntent>(
          context,
          SelectAllIntent(controller: controller),
        ),
      ),
    ),
  );
}
```

Actions can be invoked only when they are enabled, and the framework provides the Actions widget to look for enabled actions in the current widget hierarchy. The Builder class is used to ensure that the framework finds the actions defined in the same build function. To invoke an action without needing a BuildContext, you can create an Action instance or find one in an appropriate context with Actions.find. To invoke the action, pass it to the invoke method on an ActionDispatcher, which can be either created yourself or retrieved from an existing Actions widget using the Actions.of(context) method. It's important to check whether the action is enabled before calling invoke.

#### Action dispatchers

In some cases, it may be necessary to log executed actions. This can be achieved by creating a custom `ActionDispatcher` and passing it to the Actions widget. When invoking an action, the Actions widget looks for an ActionDispatcher and passes the action to it for invocation. If there is no custom ActionDispatcher provided, the widget creates a default one that simply invokes the action.

The example below shows how to create a custom ActionDispatcher that logs the action that is invoked:

```dart
class LoggingActionDispatcher extends ActionDispatcher {
  @override
  Object? invokeAction(
    covariant Action<Intent> action,
    covariant Intent intent, [
    BuildContext? context,
  ]) {
    print('Action invoked: $action($intent) from $context');
    super.invokeAction(action, intent, context);

    return null;
  }
}
```

Then you pass that to your top-level Actions widget:

```dart
@override
Widget build(BuildContext context) {
  return Actions(
    dispatcher: LoggingActionDispatcher(),
    actions: <Type, Action<Intent>>{
      SelectAllIntent: SelectAllAction(model),
    },
    child: Builder(
      builder: (context) => TextButton(
        child: const Text('SELECT ALL'),
        onPressed: Actions.handler<SelectAllIntent>(
          context,
          SelectAllIntent(),
        ),
      ),
    ),
  );
}
```

The complete example for `Actions and Shortcuts` is prvovided [here](./advanced_ui_examples/lib/actions_shortcuts_example.dart).

## Fonts and typography

`Typography` refers to the design and presentation of fonts, including their weight, slant, and letter spacing. Different fonts have different styles and appearances. While there is a lot to know about fonts, this page focuses on Flutter's support for both variable and static fonts.

### Variable fonts

`Variable fonts` are a new kind of font technology that allows for a single font file to contain a range of variations within a typeface, such as weight, width, and slant. This enables a wide range of typographic styles to be achieved from a single font file, rather than requiring multiple files for different variations. Flutter has built-in support for variable fonts, allowing developers to take advantage of this technology in their apps.

### Static fonts

`Static fonts` are limited to a fixed set of styles and weights, so if you need a variation of a font that's not available, you would have to create a new font file or use a different font altogether. In contrast, variable fonts allow you to define a range of styles and weights within a single font file, which can be adjusted dynamically using a small set of parameters. This provides greater flexibility and allows for more efficient use of storage space.

## Keyboard focus system

Flutter includes a feature called `focus system` that allows users to direct keyboard input to a specific part of the application. To achieve this, users need to focus the input on the desired UI element by clicking or tapping on it. This causes any text entered with the keyboard to be directed to that part of the application, until the focus is moved to another part. Additionally, focus can be moved by pressing the Tab key, which is commonly used for `Tab traversal`.

### FocusNode and FocusScopeNode

The `FocusNode` and `FocusScopeNode` objects are essential for the focus system in Flutter. They store the focus state and attributes persistently and enable developers to control various aspects of the focus system. However, their primary use is to serve as an opaque handle to request focus on a widget. These attributes are typically set using `Focus` or `FocusScope` widgets, but custom versions can also be created.

#### Unfocusing

The `FocusNode.unfocus()` API removes focus from a node and passes it to another node, either the nearest `FocusScopeNode` or a previously focused node in that scope, depending on the argument given. If more control is needed over where the focus goes, other methods like `nextFocus` or `previousFocus` can be used. The disposition argument has two modes: `scope` and `previouslyFocusedChild`. The former gives focus to the nearest parent focus scope, while the latter searches for the previously focused child and requests focus on it, or `defaults` to scope if none is found.

### Focus widget

The `Focus` widget is a crucial part of Flutter's focus system, as it manages the focus node and its attributes. Its main purpose is to enable a widget subtree to receive focus when tapped or clicked, as well as to manage the attaching and detaching of focus nodes to the focus tree. If you don't pass a `FocusNode` object to the Focus widget, it creates its own. However, creating your own FocusNode allows you to control focus from a parent widget by calling requestFocus() on the node. Other functionality of a FocusNode is usually best accessed by modifying the attributes of the Focus widget itself. Flutter's own controls use the Focus widget extensively to implement their focus functionality.

An example for `Focus` widget is provided [here](./advanced_ui_examples/lib/focus_widget_example.dart)

#### Key events

To monitor key events in a specific part of a widget hierarchy, an onKey handler can be assigned to the Focus widget. If the handler doesn't handle the event, it is passed up to the parent focus node until it reaches the root of the focus tree. If the event remains unhandled, it is returned to the platform to be passed to the next native control in the application. However, handled events are not propagated to other Flutter widgets or native widgets.

Here is an example of Focus widget that won’t allow the letter “a” to be typed into the text field:

```dart
@override
Widget build(BuildContext context) {
  return Focus(
    onKey: (node, event) {
      return (event.logicalKey == LogicalKeyboardKey.keyA)
          ? KeyEventResult.handled
          : KeyEventResult.ignored;
    },
    child: TextField(),
  );
}
```

#### Controlling focus

To control the focus process, three attributes, namely `canRequestFocus`, `skipTraversal`, and `descendantsAreFocusable`, can be used for a focus node.

- If the skipTraversal attribute is set to true, then this focus node will be skipped in the focus traversal system, although it can still be focused through requestFocus.
- The canRequestFocus attribute controls whether the node can request focus, with false indicating that it cannot be focused and will be skipped during focus traversal.
- The descendantsAreFocusable attribute determines if the descendants of this node can receive focus while this node is still focusable. It is used to disable focusability for an entire widget subtree, such as the ExcludeFocus widget, which is a Focus widget with this attribute set.

#### Autofocus

When you set the `autofocus` attribute of a Focus widget, it means that the widget will automatically request focus the `first` time its focus scope is focused. However, it's important to note that if `multiple` widgets have autofocus set within the same scope, it's `random` which one will receive the focus, so it's best to only set it on `one` widget per scope. It's worth noting that the autofocus attribute will only take effect if there isn't already a focus in the scope that the node belongs to.If you set the autofocus attribute on two nodes that belong to different focus scopes, each of them will become the focused widget when their corresponding scopes are focused, and this behavior is well-defined.

### FocusScope widget

The `FocusScope` widget manages a `FocusScopeNode` and serves as a grouping mechanism for focus nodes in a subtree. Focus traversal stays within a scope, which also keeps track of current and historical focus. It serves as a `starting` context to find the next focusable control, and if focused, attempts to focus the most recent or requested autofocus node in its subtree, or focuses itself if there is no such node.

### FocusableActionDetector widget

The `FocusableActionDetector` widget combines the capabilities of `Actions`, `Shortcuts`, `MouseRegion`, and a `Focus` widget to build a detector that defines actions and key bindings as well as callbacks for handling focus and hover highlights. It is what Flutter controls use to achieve all of the control's features. It is simply done using the constituent widgets, so if you don't require all of its features, you can just use the ones you require, but it is an easy approach to incorporate these behaviors into your bespoke controls.

### Controlling focus traversal

After implementing focus in an application, the next step is often to allow users to control the focus using input devices such as keyboards. Tab traversal is a common example where users press the Tab key to navigate to the next control. The default focus traversal algorithm in Flutter, `ReadingOrderTraversalPolicy`, works well for most applications, but may not be suitable for some layouts or designs. In such cases, there are other mechanisms available to achieve the desired focus traversal order.

#### FocusTraversalGroup widget

To control the order of focus traversal in a widget tree, the `FocusTraversalGroup` widget can be used to group related widgets together. The default ordering algorithm, `ReadingOrderTraversalPolicy`, is usually suitable for most applications. However, if more control is needed, an `OrderedTraversalPolicy` can be used, with the order argument of the FocusTraversalOrder widget specifying the order of the focusable components. There are two provided order subclasses: NumericFocusOrder and LexicalFocusOrder. If these do not meet the application's needs, a custom policy can be written.

[Here](./advanced_ui_examples/lib/focus_traversal_widget_example.dart) is an example for FocusTraversalGroup widget.

#### FocusTraversalPolicy

The `FocusTraversalPolicy` is responsible for determining which widget is next in the focus traversal order. This is done based on requests like findFirstFocus, findLastFocus, next, previous, and inDirection. The policy is an abstract base class for specific policies such as `ReadingOrderTraversalPolicy`, `OrderedTraversalPolicy`, and `DirectionalFocusTraversalPolicyMixin`.To use a `FocusTraversalPolicy`, it must be assigned to a FocusTraversalGroup, which defines the widget subtree where the policy will be applied. Typically, the member functions of the policy are not called directly, but are used by the focus system.

### Focus Manager

The `FocusManager` keeps the system's current principal focus. It just contains a few API elements that are valuable to focus system users. The `FocusManager.instance.primaryFocus` property, which stores the currently focused focus node and is also accessible via the global primaryFocus field, is one example.

## Gesture system

In Flutter, the `gesture system` operates through two distinct layers:

- The first layer is responsible for handling the raw pointer events that record the location and movement of pointers on the screen.
- The second layer handles gestures, which are semantic actions that consist of one or more pointer movements.

### Pointer

Pointers provide fundamental data about the user's interactions with a device's screen, and there are four types of pointer events: PointerDownEvent, PointerMoveEvent, PointerUpEvent, and PointerCancelEvent. When a pointer is pressed down on the screen, the Flutter framework performs a hit test to determine which widget is present at that location. The pointer down event (and subsequent events for that pointer) are then sent to the innermost widget found by the hit test. The events then propagate up the widget tree and are delivered to all widgets on the path from the innermost widget to the root. There is no mechanism to halt or cancel the dispatching of pointer events.

### Gestures

Gestures are semantic actions that consist of one or more pointer movements. The gesture system is responsible for recognizing gestures, such as taps, drags, and swipes, and converting them into high-level events. The gesture system is also responsible for dispatching pointer events to the appropriate gesture detectors.

### Gesture detectors

Gesture detectors are widgets that recognize gestures. If a gesture is recognized, the gesture detector invokes a callback. Most gesture detectors can be configured to recognize one or more types of gestures. For example, a `TapGestureRecognizer` can be configured to recognize taps, double taps, and long presses. The following gesture detectors are available:

- GestureDetector: Detects gestures that correspond to its non-null callbacks. It is the most commonly used gesture detector.

- InkWell: Detects taps and taps that result in long presses. It is a rectangular widget that generates a ripple effect when tapped. It is commonly used in lists and other widgets that require user interaction.

### Gesture disambiguation

When multiple gesture detectors are active at the same time, the gesture system must disambiguate between them. The gesture system uses the following rules to determine which gesture detector receives a pointer event:

- If the event is a pointer down event, the system delivers the event to the front-most detector, as determined by the widget tree.

- If the event is a pointer move event, the system delivers the event to the detector that owns the pointer.

- If the event is a pointer up event, the system delivers the event to the detector that owns the pointer.

- If the event is a pointer cancel event, the system delivers the event to the detector that owns the pointer.

## Slivers

Slivers are a more advanced form of scrollable widgets. They are designed to be used in a CustomScrollView, which allows them to be combined with other scrollable widgets. Slivers are useful when you have a large number of children that you want to display in a list. Slivers are more efficient than regular list views because they only build the children that are visible on the screen. Slivers are also more flexible than regular list views because they can be combined with other widgets.

### SliverList

The `SliverList` widget is a sliver that places multiple box children in a linear array. The `SliverList` constructor takes a `SliverChildListDelegate`, which is similar to a `ListView`'s `children` property. The `SliverChildListDelegate` takes a `List<Widget>`, which is a list of the children that will be displayed. The `SliverList` widget is more efficient than a `ListView` because it only builds the children that are visible on the screen.

### SliverGrid

The `SliverGrid` widget is a sliver that places multiple box children in a two-dimensional array. The `SliverGrid` constructor takes a `SliverChildDelegate`, which is similar to a `GridView`'s `children` property. The `SliverChildDelegate` takes a `List<Widget>`, which is a list of the children that will be displayed. The `SliverGrid` widget is more efficient than a `GridView` because it only builds the children that are visible on the screen.

### SliverAppBar

The `SliverAppBar` widget is a sliver that displays a collapsible app bar. The `SliverAppBar` widget is typically used in a `CustomScrollView` widget. The `SliverAppBar` widget is more efficient than a `AppBar` widget because it only builds the children that are visible on the screen.
