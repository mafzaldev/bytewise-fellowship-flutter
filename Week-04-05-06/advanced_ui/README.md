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
