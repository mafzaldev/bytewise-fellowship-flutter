# Animations

## Flipped Canvas in flutter

In Flutter, the canvas is flipped horizontally, so the origin is in the top left corner, and the positive y-axis points down. This is different from the standard Cartesian coordinate system, where the origin is in the bottom left corner, and the positive y-axis points up. This means that the y-axis is flipped when drawing on the canvas.

## AnimationController

The AnimationController is a special Animation object that generates a new value whenever the hardware is ready for a new frame. By default, an AnimationController linearly produces the numbers from 0.0 to 1.0 during a given duration.

## Animation

Unlike `AnimationController`, which can generate a new value whenever the hardware is ready for a new frame, `Animation` is a value that can change over time, but the value does not need to be generated on every frame. For example, an `Animation` could represent a value that smoothly changes over time, such as a slider moving from 0.0 to 100.0. An `Animation` could also represent a value that jumps from one value to another, such as a slider that snaps from 0.0 to 100.0. The `Animation` object knows nothing about rendering or `build()` functions: instead, it just returns a new value whenever the client asks for it, and the client decides what to do with that value. But the `Animation` object is tied to the `AnimationController`, and it changes its value based on the `AnimationController` value.

## Tween

A `Tween` is an object that maps a range of input values to a range of output values. A Tween takes two double values, a begin and an end, and a method that maps a double from the input range to a double in the output range. A Tween is stateless and does not store any data.

## Transform

`Transform` widget allows you to apply various transformations to its child widget. The Transform widget provides different methods to transform
the child widget, such as scaling, rotating, translating, and skewing. The Transform widget is useful when you want to apply some transformation to a widget without changing its layout constraints.

## AnimatedBuilder

The `AnimatedBuilder` widget in Flutter is used to animate the properties of a child widget. The AnimatedBuilder widget provides a builder callback function that is called on every frame of the animation. The builder callback function provides the current animation value as an argument, which can be used to update the child widget.
