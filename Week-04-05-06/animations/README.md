# Animations

## Flipped Canvas in flutter

In Flutter, the canvas is flipped horizontally, so the origin is in the top left corner, and the positive y-axis points down. This is different from the standard Cartesian coordinate system, where the origin is in the bottom left corner, and the positive y-axis points up. This means that the y-axis is flipped when drawing on the canvas.

## AnimationController

The `AnimationController` is a special Animation object that generates a new value whenever the hardware is ready for a new frame. By default, an AnimationController linearly produces the numbers from 0.0 to 1.0 during a given duration.

## Animation

Unlike `AnimationController`, which can generate a new value whenever the hardware is ready for a new frame, `Animation` is a value that can change over time, but the value does not need to be generated on every frame. For example, an Animation could represent a value that smoothly changes over time, such as a slider moving from 0.0 to 100.0. An Animation could also represent a value that jumps from one value to another, such as a slider that snaps from 0.0 to 100.0. The Animation object knows nothing about rendering or `build()` functions: instead, it just returns a new value whenever the client asks for it, and the client decides what to do with that value. But the Animation object is tied to the AnimationController, and it changes its value based on the AnimationController value.

## Explicit Animations

Explicit animations are animations that are programmed using the `AnimationController` class. Explicit animations are useful when you want to have full control over the animation. For example, you can use the `addListener()` method to trigger an animation every time the animation value changes. You can also use the `addStatusListener()` method to trigger an animation when the animation status changes, such as when the animation starts, stops, or reverses direction.

## Implicit Animations

Implicit animations are animations that are already programmed into a widget, such as the animations that are triggered when you use a `Material` widget. Implicit animations are useful when you want to quickly add an animation to your app without having to write a lot of animation code. For example, you can use the `AnimatedOpacity` widget to animate the opacity of a widget without having to write any animation code.

## Tween

A `Tween` is an object that maps a range of input values to a range of output values. A Tween takes two double values, a begin and an end, and a method that maps a double from the input range to a double in the output range. A Tween is stateless and does not store any data.

## Transform

`Transform` widget allows you to apply various transformations to its child widget. The Transform widget provides different methods to transform
the child widget, such as scaling, rotating, translating, and skewing. The Transform widget is useful when you want to apply some transformation to a widget without changing its layout constraints.

## AnimatedBuilder

The `AnimatedBuilder` widget in Flutter is used to animate the properties of a child widget. The AnimatedBuilder widget provides a builder callback function that is called on every frame of the animation. The builder callback function provides the current animation value as an argument, which can be used to update the child widget.

## Clippers

A `Clipper` is a class that defines a custom clip region for a widget. A Clipper is used with the `CustomClipper` widget. The CustomClipper widget is used to clip the child of a widget using a custom clipper. The CustomClipper widget is used to clip the child of a widget using a custom clipper. The CustomClipper widget is used to clip the child of a widget using a custom clipper.

## CustomClipper

The `CustomClipper` widget in Flutter is used to clip the child of a widget using a custom clipper. The CustomClipper widget is used to clip the child of a widget using a custom clipper. The CustomClipper widget is used to clip the child of a widget using a custom clipper.

## ClipPath

The `ClipPath` widget in Flutter is used to clip the child of a widget using a custom path. The ClipPath widget is used to clip the child of a widget using a custom path. The ClipPath widget is used to clip the child of a widget using a custom path.

## Curves

A `Curve` is a class that defines a mapping from a 0.0 to 1.0 interval to a 0.0 to 1.0 interval. Curves are used by the `Animation` objects to provide a non-linear mapping of the input interval to the output interval.

## Chained Animations

The `AnimationController` class provides a `forward()` method to start the animation, and a `reverse()` method to reverse the animation. The `forward()` method starts the animation from the beginning, and the `reverse()` method starts the animation from the end. The `forward()` and `reverse()` methods are asynchronous, and they return a `Future` that completes when the animation completes. The `forward()` and `reverse()` methods can be called multiple times, and each time the animation starts from the beginning or the end, respectively.

## SingleTickerProviderStateMixin

The `SingleTickerProviderStateMixin` class is a mixin that provides a `TickerProvider` to a State object. The TickerProvider is used to create a Ticker that is used to drive the Animation objects. This mixin is used by widgets that create a single AnimationController.

## TickerAnimationMixin

The `TickerAnimationMixin` class is a mixin that provides a `Ticker` and an `AnimationController` to a State object. The Ticker is used to call `setState()` whenever a frame is rendered. The AnimationController is used to generate a Ticker that is used to drive the Animation objects.

## 3D Animations in Flutter

Currently, Flutter does not support 3D animations. However, you can use the `Transform` widget to create a 3D effect. The `Transform` widget allows you to apply various transformations to its child widget. The `Transform` widget provides different methods to transform the child widget, such as scaling, rotating, translating, and skewing. The `Transform` widget is useful when you want to apply some transformation to a widget without changing its layout constraints.

## Stack

The `Stack` widget in Flutter is used to position the children of a widget in a stack. The Stack widget is used to position the children of a widget in a stack. The Stack widget is used to position the children of a widget in a stack. Stack works in FIFO order, which means that the last child added to the stack is the first child to be displayed.

## Hero

The `Hero` widget in Flutter is used to animate the transition between two widgets with the same tag. The Hero widget is used to animate the transition between two widgets with the same tag. Hero provides us an option named as `flightShuttleBuilder` which is used to customize the transition between two widgets. The `flightShuttleBuilder` is called when the Hero widget is transitioning from one route to another.

## AnimatedContainer

The `AnimatedContainer` widget in Flutter is used to animate the properties of a container. The animated container is useful when you want to animate the properties of a container without having to write a lot of animation code. The `AnimatedContainer` provides a duration property that is used to specify the duration of the animation. The `AnimatedContainer` also provides a curve property that is used to specify the curve of the animation.

## TweenAnimationBuilder

The `TweenAnimationBuilder` widget in Flutter is used to animate a property of a widget using a `Tween`. The `TweenAnimationBuilder` widget is used for `Implicit Animations`, which means that the animation is already programmed into the widget. This widget provides us the following options:

- `tween`: The `Tween` object that is used to animate the property of the widget.
- `duration`: The duration of the animation.
- `onEnd`: The callback function that is called when the animation completes.
- `builder`: The builder callback function that is called on every frame of the animation. The builder callback function provides the current animation value as an argument, which can be used to update the property of the widget.

## CustomPainter

The `CustomPainter` widget is used to create custom graphics and animations by painting on a canvas. The CustomPainter widget provides a `paint()` method that is called to paint on the canvas. The `paint()` method provides a Canvas object that can be used to draw various shapes, lines, and text.
