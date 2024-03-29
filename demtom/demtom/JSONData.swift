//
//  JSONData.swift
//  demtom
//
//  Created by hwly on 2021/8/6.
//

import CommonCrypto
import Foundation

extension String {
    var md5: String {
        let utf8 = cString(using: .utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(utf8, CC_LONG(utf8!.count - 1), &digest)
        return digest.reduce("") { $0 + String(format: "%02x", $1) }
    }

    var URLEncode: String {
        if count < 1 {
            return ""
        }
        
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        let encodableDelimiters = CharacterSet(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")

        var allowedCharactersWithSpace = CharacterSet.urlQueryAllowed.subtracting(encodableDelimiters)
         
        allowedCharactersWithSpace.insert(charactersIn: " ")

        return self.addingPercentEncoding(withAllowedCharacters: allowedCharactersWithSpace) ?? self
    
    }
}

public let DartJson = """
[
      {
        "title": "Accessibility",
        "desc": "Make your app accessible.",
        "url": "/docs/development/ui/widgets/accessibility",
        "list": [
          {
            "title": "ExcludeSemantics",
            "desc":
                "A widget that drops all the semantics of its descendants. This can be used to hide subwidgets that would otherwise be reported but that would only be confusing. For example, the Material Components Chip widget hides the avatar since it is redundant with the chip label.",
            "url":
                "https://api.flutter.dev/flutter/widgets/ExcludeSemantics-class.html"
          },
          {
            "title": "MergeSemantics",
            "desc": "A widget that merges the semantics of its descendants.",
            "url":
                "https://api.flutter.dev/flutter/widgets/MergeSemantics-class.html"
          },
          {
            "title": "Semantics",
            "desc":
                "A widget that annotates the widget tree with a description of the meaning of the widgets. Used by accessibility tools, search engines, and other semantic analysis software to determine the meaning of the application.",
            "url":
                "https://api.flutter.dev/flutter/widgets/Semantics-class.html"
          }
        ]
      },
      {
        "title": "Animation and Motion",
        "desc": "Bring animations to your app.",
        "url": "/docs/development/ui/widgets/animation",
        "list": [
          {
            "title": "AnimatedAlign",
            "desc":
                "Animated version of Align which automatically transitions the child's position over a given duration whenever the given alignment changes.",
            "url":
                "https://api.flutter.dev/flutter/widgets/AnimatedAlign-class.html"
          },
          {
            "title": "AnimatedBuilder",
            "desc":
                "A general-purpose widget for building animations. AnimatedBuilder is useful for more complex widgets that wish to include animation as part of a larger build function. To use AnimatedBuilder, simply construct the widget and pass it a builder function.",
            "url":
                "https://api.flutter.dev/flutter/widgets/AnimatedBuilder-class.html"
          },
          {
            "title": "AnimatedContainer",
            "desc":
                "A container that gradually changes its values over a period of time.",
            "url":
                "https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html"
          },
          {
            "title": "AnimatedCrossFade",
            "desc":
                "A widget that cross-fades between two given children and animates itself between their sizes.",
            "url":
                "https://api.flutter.dev/flutter/widgets/AnimatedCrossFade-class.html"
          },
          {
            "title": "AnimatedDefaultTextStyle",
            "desc":
                "Animated version of DefaultTextStyle which automatically transitions the default text style (the text style to apply to descendant Text widgets without explicit style) over a given duration whenever the given style changes.",
            "url":
                "https://api.flutter.dev/flutter/widgets/AnimatedDefaultTextStyle-class.html"
          },
          {
            "title": "AnimatedListState",
            "desc":
                "The state for a scrolling container that animates items when they are inserted or removed.",
            "url":
                "https://api.flutter.dev/flutter/widgets/AnimatedListState-class.html"
          },
          {
            "title": "AnimatedModalBarrier",
            "desc":
                "A widget that prevents the user from interacting with widgets behind itself.",
            "url":
                "https://api.flutter.dev/flutter/widgets/AnimatedModalBarrier-class.html"
          },
          {
            "title": "AnimatedOpacity",
            "desc":
                "Animated version of Opacity which automatically transitions the child's opacity over a given duration whenever the given opacity changes.",
            "url":
                "https://api.flutter.dev/flutter/widgets/AnimatedOpacity-class.html"
          },
          {
            "title": "AnimatedPhysicalModel",
            "desc": "Animated version of PhysicalModel.",
            "url":
                "https://api.flutter.dev/flutter/widgets/AnimatedPhysicalModel-class.html"
          },
          {
            "title": "AnimatedPositioned",
            "desc":
                "Animated version of Positioned which automatically transitions the child's position over a given duration whenever the given position changes.",
            "url":
                "https://api.flutter.dev/flutter/widgets/AnimatedPositioned-class.html"
          },
          {
            "title": "AnimatedSize",
            "desc":
                "Animated widget that automatically transitions its size over a given duration whenever the given child's size changes.",
            "url":
                "https://api.flutter.dev/flutter/widgets/AnimatedSize-class.html"
          },
          {
            "title": "AnimatedWidget",
            "desc":
                "A widget that rebuilds when the given Listenable changes value.",
            "url":
                "https://api.flutter.dev/flutter/widgets/AnimatedWidget-class.html"
          },
          {
            "title": "AnimatedWidgetBaseState",
            "desc": "A base class for widgets with implicit animations.",
            "url":
                "https://api.flutter.dev/flutter/widgets/AnimatedWidgetBaseState-class.html"
          },
          {
            "title": "DecoratedBoxTransition",
            "desc":
                "Animated version of a DecoratedBox that animates the different properties of its Decoration.",
            "url":
                "https://api.flutter.dev/flutter/widgets/DecoratedBoxTransition-class.html"
          },
          {
            "title": "FadeTransition",
            "desc": "Animates the opacity of a widget.",
            "url":
                "https://api.flutter.dev/flutter/widgets/FadeTransition-class.html"
          },
          {
            "title": "Hero",
            "desc":
                "A widget that marks its child as being a candidate for hero animations.",
            "url": "https://api.flutter.dev/flutter/widgets/Hero-class.html"
          },
          {
            "title": "PositionedTransition",
            "desc":
                "Animated version of Positioned which takes a specific Animation to transition the child's position from a start position to and end position over the lifetime of the animation.",
            "url":
                "https://api.flutter.dev/flutter/widgets/PositionedTransition-class.html"
          },
          {
            "title": "RotationTransition",
            "desc": "Animates the rotation of a widget.",
            "url":
                "https://api.flutter.dev/flutter/widgets/RotationTransition-class.html"
          },
          {
            "title": "ScaleTransition",
            "desc": "Animates the scale of transformed widget.",
            "url":
                "https://api.flutter.dev/flutter/widgets/ScaleTransition-class.html"
          },
          {
            "title": "SizeTransition",
            "desc": "Animates its own size and clips and aligns the child.",
            "url":
                "https://api.flutter.dev/flutter/widgets/SizeTransition-class.html"
          },
          {
            "title": "SlideTransition",
            "desc":
                "Animates the position of a widget relative to its normal position.",
            "url":
                "https://api.flutter.dev/flutter/widgets/SlideTransition-class.html"
          }
        ]
      },
      {
        "title": "Assets, Images, and Icons",
        "desc": "Manage assets, display images, and show icons.",
        "url": "/docs/development/ui/widgets/assets",
        "list": [
          {
            "title": "AssetBundle",
            "desc":
                "Asset bundles contain resources, such as images and strings, that can be used by an application. Access to these resources is asynchronous so that they can be transparently loaded over a network (e.g., from a NetworkAssetBundle) or from the local file system without blocking the application's user interface.",
            "url":
                "https://api.flutter.dev/flutter/services/AssetBundle-class.html"
          },
          {
            "title": "Icon",
            "desc": "A Material Design icon.",
            "url": "https://api.flutter.dev/flutter/widgets/Icon-class.html"
          },
          {
            "title": "Image",
            "desc": "A widget that displays an image.",
            "url": "https://api.flutter.dev/flutter/widgets/Image-class.html"
          },
          {
            "title": "RawImage",
            "desc": "A widget that displays a dart:ui.Image directly.",
            "url": "https://api.flutter.dev/flutter/widgets/RawImage-class.html"
          }
        ]
      },
      {
        "title": "Async",
        "desc": "Async patterns to your Flutter application.",
        "url": "/docs/development/ui/widgets/async",
        "list": [
          {
            "title": "FutureBuilder",
            "desc":
                "Widget that builds itself based on the latest snapshot of interaction with a Future.",
            "url":
                "https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html"
          },
          {
            "title": "StreamBuilder",
            "desc":
                "Widget that builds itself based on the latest snapshot of interaction with a Stream.",
            "url":
                "https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html"
          }
        ]
      },
      {
        "title": "Basics",
        "desc":
            "Widgets you absolutely need to know before building your first Flutter app.",
        "url": "/docs/development/ui/widgets/basics",
        "list": [
          {
            "title": "Appbar",
            "desc":
                "A Material Design app bar. An app bar consists of a toolbar and potentially other widgets, such as a TabBar and a FlexibleSpaceBar.",
            "url": "https://api.flutter.dev/flutter/material/AppBar-class.html"
          },
          {
            "title": "Column",
            "desc": "Layout a list of child widgets in the vertical direction.",
            "url": "https://api.flutter.dev/flutter/widgets/Column-class.html"
          },
          {
            "title": "Container",
            "desc":
                "A convenience widget that combines common painting, positioning, and sizing widgets.",
            "url":
                "https://api.flutter.dev/flutter/widgets/Container-class.html"
          },
          {
            "title": "ElevatedButton",
            "desc":
                "A Material Design elevated button. A filled button whose material elevates when pressed.",
            "url":
                "https://api.flutter.dev/flutter/material/ElevatedButton-class.html"
          },
          {
            "title": "FlutterLogo",
            "desc":
                "The Flutter logo, in widget form. This widget respects the IconTheme.",
            "url":
                "https://api.flutter.dev/flutter/material/FlutterLogo-class.html"
          },
          {
            "title": "Icon",
            "desc": "A Material Design icon.",
            "url": "https://api.flutter.dev/flutter/widgets/Icon-class.html"
          },
          {
            "title": "Image",
            "desc": "A widget that displays an image.",
            "url": "https://api.flutter.dev/flutter/widgets/Image-class.html"
          },
          {
            "title": "Placeholder",
            "desc":
                "A widget that draws a box that represents where other widgets will one day be added.",
            "url":
                "https://api.flutter.dev/flutter/widgets/Placeholder-class.html"
          },
          {
            "title": "Row",
            "desc":
                "Layout a list of child widgets in the horizontal direction.",
            "url": "https://api.flutter.dev/flutter/widgets/Row-class.html"
          },
          {
            "title": "Scaffold",
            "desc":
                "Implements the basic Material Design visual layout structure. This class provides APIs for showing drawers, snack bars, and bottom sheets.",
            "url":
                "https://api.flutter.dev/flutter/material/Scaffold-class.html"
          },
          {
            "title": "Text",
            "desc": "A run of text with a single style.",
            "url": "https://api.flutter.dev/flutter/widgets/Text-class.html"
          }
        ]
      },
      {
        "title": "Cupertino (iOS-style widgets)",
        "desc":
            "Beautiful and high-fidelity widgets for current iOS design language.",
        "url": "/docs/development/ui/widgets/cupertino",
        "list": [
          {
            "title": "CupertinoActionSheet",
            "desc":
                "An iOS-style modal bottom action sheet to choose an option among many.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoActionSheet-class.html"
          },
          {
            "title": "CupertinoActivityIndicator",
            "desc":
                "An iOS-style activity indicator. Displays a circular 'spinner'.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoActivityIndicator-class.html"
          },
          {
            "title": "CupertinoAlertDialog",
            "desc": "An iOS-style alert dialog.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoAlertDialog-class.html"
          },
          {
            "title": "CupertinoButton",
            "desc": "An iOS-style button.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoButton-class.html"
          },
          {
            "title": "CupertinoContextMenu",
            "desc":
                "An iOS-style full-screen modal route that opens when the child is long-pressed. Used to display relevant actions for your content.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoContextMenu-class.html"
          },
          {
            "title": "CupertinoDatePicker",
            "desc": "An iOS-style date or date and time picker.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoDatePicker-class.html"
          },
          {
            "title": "CupertinoDialog",
            "desc": "An iOS-style dialog.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoDialog-class.html"
          },
          {
            "title": "CupertinoDialogAction",
            "desc": "A button typically used in a CupertinoAlertDialog.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoDialogAction-class.html"
          },
          {
            "title": "CupertinoFullscreenDialogTransition",
            "desc":
                "An iOS-style transition used for summoning fullscreen dialogs.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoFullscreenDialogTransition-class.html"
          },
          {
            "title": "CupertinoNavigationBar",
            "desc":
                "An iOS-style top navigation bar. Typically used with CupertinoPageScaffold.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoNavigationBar-class.html"
          },
          {
            "title": "CupertinoPageScaffold",
            "desc":
                "Basic iOS style page layout structure. Positions a navigation bar and content on a background.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoPageScaffold-class.html"
          },
          {
            "title": "CupertinoPageTransition",
            "desc": "Provides an iOS-style page transition animation.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoPageTransition-class.html"
          },
          {
            "title": "CupertinoPicker",
            "desc":
                "An iOS-style picker control. Used to select an item in a short list.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoPicker-class.html"
          },
          {
            "title": "CupertinoPopupSurface",
            "desc":
                "Rounded rectangle surface that looks like an iOS popup surface, such as an alert dialog or action sheet.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoPopupSurface-class.html"
          },
          {
            "title": "CupertinoScrollbar",
            "desc":
                "An iOS-style scrollbar that indicates which portion of a scrollable widget is currently visible.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoScrollbar-class.html"
          },
          {
            "title": "CupertinoSearchTextField",
            "desc": "An iOS-style search field.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoSearchTextField-class.html"
          },
          {
            "title": "CupertinoSegmentedControl",
            "desc":
                "An iOS-style segmented control. Used to select mutually exclusive options in a horizontal list.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoSegmentedControl-class.html"
          },
          {
            "title": "CupertinoSlider",
            "desc": "Used to select from a range of values.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoSlider-class.html"
          },
          {
            "title": "CupertinoSlidingSegmentedControl",
            "desc":
                "An iOS-13-style segmented control. Used to select mutually exclusive options in a horizontal list.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoSlidingSegmentedControl-class.html"
          },
          {
            "title": "CupertinoSliverNavigationBar",
            "desc":
                "An iOS-styled navigation bar with iOS-11-style large titles using slivers.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoSliverNavigationBar-class.html"
          },
          {
            "title": "CupertinoSwitch",
            "desc":
                "An iOS-style switch. Used to toggle the on/off state of a single setting.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoSwitch-class.html"
          },
          {
            "title": "CupertinoTabBar",
            "desc":
                "An iOS-style bottom tab bar. Typically used with CupertinoTabScaffold.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoTabBar-class.html"
          },
          {
            "title": "CupertinoTabScaffold",
            "desc":
                "Tabbed iOS app structure. Positions a tab bar on top of tabs of content.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoTabScaffold-class.html"
          },
          {
            "title": "CupertinoTabView",
            "desc":
                "Root content of a tab that supports parallel navigation between tabs. Typically used with CupertinoTabScaffold.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoTabView-class.html"
          },
          {
            "title": "CupertinoTextField",
            "desc": "An iOS-style text field.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoTextField-class.html"
          },
          {
            "title": "CupertinoTimerPicker",
            "desc": "An iOS-style countdown timer picker.",
            "url":
                "https://api.flutter.dev/flutter/cupertino/CupertinoTimerPicker-class.html"
          }
        ]
      },
      {
        "title": "Input",
        "desc":
            "Take user input in addition to input widgets in Material Components and Cupertino.",
        "url": "/docs/development/ui/widgets/input",
        "list": [
          {
            "title": "Autocomplete",
            "desc":
                "A widget for helping the user make a selection by entering some text and choosing from among a list of options.",
            "url":
                "https://api.flutter.dev/flutter/material/Autocomplete-class.html"
          },
          {
            "title": "Form",
            "desc":
                "An optional container for grouping together multiple form field widgets (e.g. TextField widgets).",
            "url": "https://api.flutter.dev/flutter/widgets/Form-class.html"
          },
          {
            "title": "FormField",
            "desc":
                "A single form field. This widget maintains the current state of the form field, so that updates and validation errors are visually reflected in the UI.",
            "url":
                "https://api.flutter.dev/flutter/widgets/FormField-class.html"
          },
          {
            "title": "RawKeyboardListener",
            "desc":
                "A widget that calls a callback whenever the user presses or releases a key on a keyboard.",
            "url":
                "https://api.flutter.dev/flutter/widgets/RawKeyboardListener-class.html"
          }
        ]
      },
      {
        "title": "Interaction Models",
        "desc": "Respond to touch events and route users to different views.",
        "url": "/docs/development/ui/widgets/interaction",
        "list": [
          {
            "title": "Touch interactions",
            "list": [
              {
                "title": "AbsorbPointer",
                "desc":
                    "A widget that absorbs pointers during hit testing. When absorbing is true, this widget prevents its subtree from receiving pointer events by terminating hit testing at itself. It still consumes space during layout and paints its child as usual. It just prevents its children from being the target of located events, because it returns true from RenderBox.hitTest.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/AbsorbPointer-class.html"
              },
              {
                "title": "Dismissible",
                "desc":
                    "A widget that can be dismissed by dragging in the indicated direction. Dragging or flinging this widget in the DismissDirection causes the child to slide out of view. Following the slide animation, if resizeDuration is non-null, the Dismissible widget animates its height (or width, whichever is perpendicular to the dismiss direction) to zero over the resizeDuration.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/Dismissible-class.html"
              },
              {
                "title": "DragTarget",
                "desc":
                    "A widget that receives data when a Draggable widget is dropped. When a draggable is dragged on top of a drag target, the drag target is asked whether it will accept the data the draggable is carrying. If the user does drop the draggable on top of the drag target (and the drag target has indicated that it will accept the draggable's data), then the drag target is asked to accept the draggable's data.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/DragTarget-class.html"
              },
              {
                "title": "Draggable",
                "desc":
                    "A widget that can be dragged from to a DragTarget. When a draggable widget recognizes the start of a drag gesture, it displays a feedback widget that tracks the user's finger across the screen. If the user lifts their finger while on top of a DragTarget, that target is given the opportunity to accept the data carried by the draggable.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/Draggable-class.html"
              },
              {
                "title": "DraggableScrollableSheet",
                "desc":
                    "A container for a Scrollable that responds to drag gestures by resizing the scrollable until a limit is reached, and then scrolling.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/DraggableScrollableSheet-class.html"
              },
              {
                "title": "GestureDetector",
                "desc":
                    "A widget that detects gestures. Attempts to recognize gestures that correspond to its non-null callbacks. If this widget has a child, it defers to that child for its sizing behavior. If it does not have a child, it grows to fit the parent instead.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/GestureDetector-class.html"
              },
              {
                "title": "IgnorePointer",
                "desc":
                    "A widget that is invisible during hit testing. When ignoring is true, this widget (and its subtree) is invisible to hit testing. It still consumes space during layout and paints its child as usual. It just cannot be the target of located events, because it returns false from RenderBox.hitTest.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/IgnorePointer-class.html"
              },
              {
                "title": "InteractiveViewer",
                "desc":
                    "A widget that enables pan and zoom interactions with its child.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/InteractiveViewer-class.html"
              },
              {
                "title": "LongPressDraggable",
                "desc": "Makes its child draggable starting from long press.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/LongPressDraggable-class.html"
              },
              {
                "title": "Scrollable",
                "desc":
                    "Scrollable implements the interaction model for a scrollable widget, including gesture recognition, but does not have an opinion about how the viewport, which actually displays the children, is constructed.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/Scrollable-class.html"
              }
            ]
          },
          {
            "title": "Routing",
            "list": [
              {
                "title": "Hero",
                "desc":
                    "A widget that marks its child as being a candidate for hero animations.",
                "url": "https://api.flutter.dev/flutter/widgets/Hero-class.html"
              },
              {
                "title": "Navigator",
                "desc":
                    "A widget that manages a set of child widgets with a stack discipline. Many apps have a navigator near the top of their widget hierarchy to display their logical history using an Overlay with the most recently visited pages visually on top of the older pages. Using this pattern lets the navigator visually transition from one page to another by moving the widgets around in the overlay. Similarly, the navigator can be used to show a dialog by positioning the dialog widget above the current page.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/Navigator-class.html"
              }
            ]
          }
        ]
      },
      {
        "title": "Layout",
        "desc":
            "Arrange other widgets columns, rows, grids, and many other layouts.",
        "url": "/docs/development/ui/widgets/layout",
        "list": [
          {
            "title": "Single-child layout widgets",
            "list": [
              {
                "title": "Align",
                "desc":
                    "A widget that aligns its child within itself and optionally sizes itself based on the child's size.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/Align-class.html"
              },
              {
                "title": "AspectRatio",
                "desc":
                    "A widget that attempts to size the child to a specific aspect ratio.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/AspectRatio-class.html"
              },
              {
                "title": "Baseline",
                "desc":
                    "A widget that positions its child according to the child's baseline.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/Baseline-class.html"
              },
              {
                "title": "Center",
                "desc": "A widget that centers its child within itself.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/Center-class.html"
              },
              {
                "title": "ConstrainedBox",
                "desc":
                    "A widget that imposes additional constraints on its child.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/ConstrainedBox-class.html"
              },
              {
                "title": "Container",
                "desc":
                    "A convenience widget that combines common painting, positioning, and sizing widgets.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/Container-class.html"
              },
              {
                "title": "CustomSingleChildLayout",
                "desc":
                    "A widget that defers the layout of its single child to a delegate.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/CustomSingleChildLayout-class.html"
              },
              {
                "title": "Expanded",
                "desc":
                    "A widget that expands a child of a Row, Column, or Flex.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/Expanded-class.html"
              },
              {
                "title": "FittedBox",
                "desc":
                    "Scales and positions its child within itself according to fit.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/FittedBox-class.html"
              },
              {
                "title": "FractionallySizedBox",
                "desc":
                    "A widget that sizes its child to a fraction of the total available space. For more details about the layout algorithm, see RenderFractionallySizedOverflowBox.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/FractionallySizedBox-class.html"
              },
              {
                "title": "IntrinsicHeight",
                "desc":
                    "A widget that sizes its child to the child's intrinsic height.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/IntrinsicHeight-class.html"
              },
              {
                "title": "IntrinsicWidth",
                "desc":
                    "A widget that sizes its child to the child's intrinsic width.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/IntrinsicWidth-class.html"
              },
              {
                "title": "LimitedBox",
                "desc":
                    "A box that limits its size only when it's unconstrained.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/LimitedBox-class.html"
              },
              {
                "title": "Offstage",
                "desc":
                    "A widget that lays the child out as if it was in the tree, but without painting anything, without making the child available for hit testing, and without taking any room in the parent.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/Offstage-class.html"
              },
              {
                "title": "OverflowBox",
                "desc":
                    "A widget that imposes different constraints on its child than it gets from its parent, possibly allowing the child to overflow the parent.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/OverflowBox-class.html"
              },
              {
                "title": "Padding",
                "desc": "A widget that insets its child by the given padding.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/Padding-class.html"
              },
              {
                "title": "SizedBox",
                "desc":
                    "A box with a specified size. If given a child, this widget forces its child to have a specific width and/or height (assuming values are permitted by this widget's parent). If either the width or height is null, this widget will size itself to match the child's size in that dimension.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/SizedBox-class.html"
              },
              {
                "title": "SizedOverflowBox",
                "desc":
                    "A widget that is a specific size but passes its original constraints through to its child, which will probably overflow.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/SizedOverflowBox-class.html"
              },
              {
                "title": "Transform",
                "desc":
                    "A widget that applies a transformation before painting its child.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/Transform-class.html"
              }
            ]
          },
          {
            "title": "Multi-child layout widgets",
            "list": [
              {
                "title": "Column",
                "desc":
                    "Layout a list of child widgets in the vertical direction.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/Column-class.html"
              },
              {
                "title": "CustomMultiChildLayout",
                "desc":
                    "A widget that uses a delegate to size and position multiple children.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/CustomMultiChildLayout-class.html"
              },
              {
                "title": "Flow",
                "desc": "A widget that implements the flow layout algorithm.",
                "url": "https://api.flutter.dev/flutter/widgets/Flow-class.html"
              },
              {
                "title": "GridView",
                "desc":
                    "A grid list consists of a repeated pattern of cells arrayed in a vertical and horizontal layout. The GridView widget implements this component.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/GridView-class.html"
              },
              {
                "title": "IndexedStack",
                "desc":
                    "A Stack that shows a single child from a list of children.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/IndexedStack-class.html"
              },
              {
                "title": "LayoutBuilder",
                "desc":
                    "Builds a widget tree that can depend on the parent widget's size.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/LayoutBuilder-class.html"
              },
              {
                "title": "ListBody",
                "desc":
                    "A widget that arranges its children sequentially along a given axis, forcing them to the dimension of the parent in the other axis.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/ListBody-class.html"
              },
              {
                "title": "ListView",
                "desc":
                    "A scrollable, linear list of widgets. ListView is the most commonly used scrolling widget. It displays its children one after another in the scroll direction. In the cross axis, the children are required to fill the ListView.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/ListView-class.html"
              },
              {
                "title": "Row",
                "desc":
                    "Layout a list of child widgets in the horizontal direction.",
                "url": "https://api.flutter.dev/flutter/widgets/Row-class.html"
              },
              {
                "title": "Stack",
                "desc":
                    "This class is useful if you want to overlap several children in a simple way, for example having some text and an image, overlaid with a gradient and a button attached to the bottom.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/Stack-class.html"
              },
              {
                "title": "Table",
                "desc":
                    "A widget that uses the table layout algorithm for its children.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/Table-class.html"
              },
              {
                "title": "Wrap",
                "desc":
                    "A widget that displays its children in multiple horizontal or vertical runs.",
                "url": "https://api.flutter.dev/flutter/widgets/Wrap-class.html"
              }
            ]
          },
          {
            "title": "Sliver widgets",
            "list": [
              {
                "title": "CupertinoSliverNavigationBar",
                "desc":
                    "An iOS-styled navigation bar with iOS-11-style large titles using slivers.",
                "url":
                    "https://api.flutter.dev/flutter/cupertino/CupertinoSliverNavigationBar-class.html"
              },
              {
                "title": "CustomScrollView",
                "desc":
                    "A ScrollView that creates custom scroll effects using slivers.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/CustomScrollView-class.html"
              },
              {
                "title": "SliverAppBar",
                "desc":
                    "A material design app bar that integrates with a CustomScrollView.",
                "url":
                    "https://api.flutter.dev/flutter/material/SliverAppBar-class.html"
              },
              {
                "title": "SliverChildBuilderDelegate",
                "desc":
                    "A delegate that supplies children for slivers using a builder callback.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/SliverChildBuilderDelegate-class.html"
              },
              {
                "title": "SliverChildListDelegate",
                "desc":
                    "A delegate that supplies children for slivers using an explicit list.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/SliverChildListDelegate-class.html"
              },
              {
                "title": "SliverFixedExtentList",
                "desc":
                    "A sliver that places multiple box children with the same main axis extent in a linear array.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/SliverFixedExtentList-class.html"
              },
              {
                "title": "SliverGrid",
                "desc":
                    "A sliver that places multiple box children in a two dimensional arrangement.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/SliverGrid-class.html"
              },
              {
                "title": "SliverList",
                "desc":
                    "A sliver that places multiple box children in a linear array along the main axis.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/SliverList-class.html"
              },
              {
                "title": "SliverPadding",
                "desc":
                    "A sliver that applies padding on each side of another sliver.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/SliverPadding-class.html"
              },
              {
                "title": "SliverPersistentHeader",
                "desc":
                    "A sliver whose size varies when the sliver is scrolled to the edge of the viewport opposite the sliver's GrowthDirection.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/SliverPersistentHeader-class.html"
              },
              {
                "title": "SliverToBoxAdapter",
                "desc": "A sliver that contains a single box widget.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/SliverToBoxAdapter-class.html"
              }
            ]
          }
        ]
      },
      {
        "title": "Material Components",
        "desc":
            "Visual, behavioral, and motion-rich widgets implementing the Material Design guidelines.",
        "url": "/docs/development/ui/widgets/material",
        "list": [
          {
            "title": "App structure and navigation",
            "list": [
              {
                "title": "Appbar",
                "desc":
                    "A Material Design app bar. An app bar consists of a toolbar and potentially other widgets, such as a TabBar and a FlexibleSpaceBar.",
                "url":
                    "https://api.flutter.dev/flutter/material/AppBar-class.html"
              },
              {
                "title": "BottomNavigationBar",
                "desc":
                    "Bottom navigation bars make it easy to explore and switch between top-level views in a single tap. The BottomNavigationBar widget implements this component.",
                "url":
                    "https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html"
              },
              {
                "title": "Drawer",
                "desc":
                    "A Material Design panel that slides in horizontally from the edge of a Scaffold to show navigation links in an application.",
                "url":
                    "https://api.flutter.dev/flutter/material/Drawer-class.html"
              },
              {
                "title": "MaterialApp",
                "desc":
                    "A convenience widget that wraps a number of widgets that are commonly required for applications implementing Material Design.",
                "url":
                    "https://api.flutter.dev/flutter/material/MaterialApp-class.html"
              },
              {
                "title": "Scaffold",
                "desc":
                    "Implements the basic Material Design visual layout structure. This class provides APIs for showing drawers, snack bars, and bottom sheets.",
                "url":
                    "https://api.flutter.dev/flutter/material/Scaffold-class.html"
              },
              {
                "title": "SliverAppBar",
                "desc":
                    "A material design app bar that integrates with a CustomScrollView.",
                "url":
                    "https://api.flutter.dev/flutter/material/SliverAppBar-class.html"
              },
              {
                "title": "TabBar",
                "desc":
                    "A Material Design widget that displays a horizontal row of tabs.",
                "url":
                    "https://api.flutter.dev/flutter/material/TabBar-class.html"
              },
              {
                "title": "TabBarView",
                "desc":
                    "A page view that displays the widget which corresponds to the currently selected tab. Typically used in conjunction with a TabBar.",
                "url":
                    "https://api.flutter.dev/flutter/material/TabBarView-class.html"
              },
              {
                "title": "TabController",
                "desc":
                    "Coordinates tab selection between a TabBar and a TabBarView.",
                "url":
                    "https://api.flutter.dev/flutter/material/TabController-class.html"
              },
              {
                "title": "TabPageSelector",
                "desc":
                    "Displays a row of small circular indicators, one per tab. The selected tab's indicator is highlighted. Often used in conjunction with a TabBarView.",
                "url":
                    "https://api.flutter.dev/flutter/material/TabPageSelector-class.html"
              },
              {
                "title": "WidgetsApp",
                "desc":
                    "A convenience class that wraps a number of widgets that are commonly required for an application.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/WidgetsApp-class.html"
              }
            ]
          },
          {
            "title": "Buttons",
            "list": [
              {
                "title": "DropdownButton",
                "desc":
                    "Shows the currently selected item and an arrow that opens a menu for selecting another item.",
                "url":
                    "https://api.flutter.dev/flutter/material/DropdownButton-class.html"
              },
              {
                "title": "ElevatedButton",
                "desc":
                    "A Material Design elevated button. A filled button whose material elevates when pressed.",
                "url":
                    "https://api.flutter.dev/flutter/material/ElevatedButton-class.html"
              },
              {
                "title": "FloatingActionButton",
                "desc":
                    "A floating action button is a circular icon button that hovers over content to promote a primary action in the application. Floating action buttons are most commonly used in the Scaffold.floatingActionButton field.",
                "url":
                    "https://api.flutter.dev/flutter/material/FloatingActionButton-class.html"
              },
              {
                "title": "IconButton",
                "desc":
                    "An icon button is a picture printed on a Material widget that reacts to touches by filling with color (ink).",
                "url":
                    "https://api.flutter.dev/flutter/material/IconButton-class.html"
              },
              {
                "title": "OutlinedButton",
                "desc":
                    "A Material Design outlined button, essentially a TextButton with an outlined border.",
                "url":
                    "https://api.flutter.dev/flutter/material/OutlinedButton-class.html"
              },
              {
                "title": "PopupMenuButton",
                "desc":
                    "Displays a menu when pressed and calls onSelected when the menu is dismissed because an item was selected.",
                "url":
                    "https://api.flutter.dev/flutter/material/PopupMenuButton-class.html"
              },
              {
                "title": "TextButton",
                "desc":
                    "A Material Design text button. A simple flat button without a border outline.",
                "url":
                    "https://api.flutter.dev/flutter/material/TextButton-class.html"
              }
            ]
          },
          {
            "title": "Input and selections",
            "list": [
              {
                "title": "Checkbox",
                "desc":
                    "Checkboxes allow the user to select multiple options from a set. The Checkbox widget implements this component.",
                "url":
                    "https://api.flutter.dev/flutter/material/Checkbox-class.html"
              },
              {
                "title": "Date & Time Pickers",
                "desc":
                    "Date pickers use a dialog window to select a single date on mobile. Time pickers use a dialog to select a single time (in the hours:minutes format) on mobile.",
                "url":
                    "https://api.flutter.dev/flutter/material/showDatePicker.html"
              },
              {
                "title": "Radio",
                "desc":
                    "Radio buttons allow the user to select one option from a set. Use radio buttons for exclusive selection if you think that the user needs to see all available options side-by-side. ",
                "url":
                    "https://api.flutter.dev/flutter/material/Radio-class.html"
              },
              {
                "title": "Slider",
                "desc":
                    "Sliders let users select from a range of values by moving the slider thumb. ",
                "url":
                    "https://api.flutter.dev/flutter/material/Slider-class.html"
              },
              {
                "title": "Switch",
                "desc":
                    "On/off switches toggle the state of a single settings option. The Switch widget implements this component.",
                "url":
                    "https://api.flutter.dev/flutter/material/Switch-class.html"
              },
              {
                "title": "TextField",
                "desc":
                    "Touching a text field places the cursor and displays the keyboard. The TextField widget implements this component.",
                "url":
                    "https://api.flutter.dev/flutter/material/TextField-class.html"
              }
            ]
          },
          {
            "title": "Dialogs, alerts, and panels",
            "list": [
              {
                "title": "AlertDialog",
                "desc":
                    "Alerts are urgent interruptions requiring acknowledgement that inform the user about a situation. The AlertDialog widget implements this component.",
                "url":
                    "https://api.flutter.dev/flutter/material/AlertDialog-class.html"
              },
              {
                "title": "BottomSheet",
                "desc":
                    "Bottom sheets slide up from the bottom of the screen to reveal more content. You can call showBottomSheet() to implement a persistent bottom sheet or showModalBottomSheet() to implement a modal bottom sheet.",
                "url":
                    "https://api.flutter.dev/flutter/material/BottomSheet-class.html"
              },
              {
                "title": "ExpansionPanel",
                "desc":
                    "Expansion panels contain creation flows and allow lightweight editing of an element. The ExpansionPanel widget implements this component.",
                "url":
                    "https://api.flutter.dev/flutter/material/ExpansionPanel-class.html"
              },
              {
                "title": "SimpleDialog",
                "desc":
                    "Simple dialogs can provide additional details or actions about a list item. For example they can display avatars icons clarifying subtext or orthogonal actions (such as adding an account). ",
                "url":
                    "https://api.flutter.dev/flutter/material/SimpleDialog-class.html"
              },
              {
                "title": "SnackBar",
                "desc":
                    "A lightweight message with an optional action which briefly displays at the bottom of the screen.",
                "url":
                    "https://api.flutter.dev/flutter/material/SnackBar-class.html"
              }
            ]
          },
          {
            "title": "Information displays",
            "list": [
              {
                "title": "Card",
                "desc":
                    "A Material Design card. A card has slightly rounded corners and a shadow.",
                "url":
                    "https://api.flutter.dev/flutter/material/Card-class.html"
              },
              {
                "title": "Chip",
                "desc":
                    "A Material Design chip. Chips represent complex entities in small blocks, such as a contact.",
                "url":
                    "https://api.flutter.dev/flutter/material/Chip-class.html"
              },
              {
                "title": "CircularProgressIndicator",
                "desc":
                    "A material design circular progress indicator, which spins to indicate that the application is busy.",
                "url":
                    "https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html"
              },
              {
                "title": "DataTable",
                "desc":
                    "Data tables display sets of raw data. They usually appear in desktop enterprise products. The DataTable widget implements this component.",
                "url":
                    "https://api.flutter.dev/flutter/material/DataTable-class.html"
              },
              {
                "title": "GridView",
                "desc":
                    "A grid list consists of a repeated pattern of cells arrayed in a vertical and horizontal layout. The GridView widget implements this component.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/GridView-class.html"
              },
              {
                "title": "Icon",
                "desc": "A Material Design icon.",
                "url": "https://api.flutter.dev/flutter/widgets/Icon-class.html"
              },
              {
                "title": "Image",
                "desc": "A widget that displays an image.",
                "url":
                    "https://api.flutter.dev/flutter/widgets/Image-class.html"
              },
              {
                "title": "LinearProgressIndicator",
                "desc":
                    "A material design linear progress indicator, also known as a progress bar.",
                "url":
                    "https://api.flutter.dev/flutter/material/LinearProgressIndicator-class.html"
              },
              {
                "title": "Tooltip",
                "desc":
                    "Tooltips provide text labels that help explain the function of a button or other user interface action. Wrap the button in a Tooltip widget to show a label when the widget long pressed (or when the user takes some other appropriate action).",
                "url":
                    "https://api.flutter.dev/flutter/material/Tooltip-class.html"
              }
            ]
          },
          {
            "title": "Layout",
            "list": [
              {
                "title": "Divider",
                "desc":
                    "A one logical pixel thick horizontal line, with padding on either side.",
                "url":
                    "https://api.flutter.dev/flutter/material/Divider-class.html"
              },
              {
                "title": "ListTile",
                "desc":
                    "A single fixed-height row that typically contains some text as well as a leading or trailing icon.",
                "url":
                    "https://api.flutter.dev/flutter/material/ListTile-class.html"
              },
              {
                "title": "Stepper",
                "desc":
                    "A Material Design stepper widget that displays progress through a sequence of steps.",
                "url":
                    "https://api.flutter.dev/flutter/material/Stepper-class.html"
              }
            ]
          }
        ]
      },
      {
        "title": "Painting and effects",
        "desc":
            "These widgets apply visual effects to the children without changing their layout, size, or position.",
        "url": "/docs/development/ui/widgets/painting",
        "list": [
          {
            "title": "BackdropFilter",
            "desc":
                "A widget that applies a filter to the existing painted content and then paints a child. This effect is relatively expensive, especially if the filter is non-local, such as a blur.",
            "url":
                "https://api.flutter.dev/flutter/widgets/BackdropFilter-class.html"
          },
          {
            "title": "ClipOval",
            "desc": "A widget that clips its child using an oval.",
            "url": "https://api.flutter.dev/flutter/widgets/ClipOval-class.html"
          },
          {
            "title": "ClipPath",
            "desc": "A widget that clips its child using a path.",
            "url": "https://api.flutter.dev/flutter/widgets/ClipPath-class.html"
          },
          {
            "title": "ClipRect",
            "desc": "A widget that clips its child using a rectangle.",
            "url": "https://api.flutter.dev/flutter/widgets/ClipRect-class.html"
          },
          {
            "title": "CustomPaint",
            "desc":
                "A widget that provides a canvas on which to draw during the paint phase.",
            "url":
                "https://api.flutter.dev/flutter/widgets/CustomPaint-class.html"
          },
          {
            "title": "DecoratedBox",
            "desc":
                "A widget that paints a Decoration either before or after its child paints.",
            "url":
                "https://api.flutter.dev/flutter/widgets/DecoratedBox-class.html"
          },
          {
            "title": "FractionalTranslation",
            "desc":
                "A widget that applies a translation expressed as a fraction of the box's size before painting its child.",
            "url":
                "https://api.flutter.dev/flutter/widgets/FractionalTranslation-class.html"
          },
          {
            "title": "Opacity",
            "desc": "A widget that makes its child partially transparent.",
            "url": "https://api.flutter.dev/flutter/widgets/Opacity-class.html"
          },
          {
            "title": "RotatedBox",
            "desc":
                "A widget that rotates its child by a integral number of quarter turns.",
            "url":
                "https://api.flutter.dev/flutter/widgets/RotatedBox-class.html"
          },
          {
            "title": "Transform",
            "desc":
                "A widget that applies a transformation before painting its child.",
            "url":
                "https://api.flutter.dev/flutter/widgets/Transform-class.html"
          }
        ]
      },
      {
        "title": "Scrolling",
        "desc": "Scroll multiple widgets as children of the parent.",
        "url": "/docs/development/ui/widgets/scrolling",
        "list": [
          {
            "title": "CustomScrollView",
            "desc":
                "A ScrollView that creates custom scroll effects using slivers.",
            "url":
                "https://api.flutter.dev/flutter/widgets/CustomScrollView-class.html"
          },
          {
            "title": "DraggableScrollableSheet",
            "desc":
                "A container for a Scrollable that responds to drag gestures by resizing the scrollable until a limit is reached, and then scrolling.",
            "url":
                "https://api.flutter.dev/flutter/widgets/DraggableScrollableSheet-class.html"
          },
          {
            "title": "GridView",
            "desc":
                "A grid list consists of a repeated pattern of cells arrayed in a vertical and horizontal layout. The GridView widget implements this component.",
            "url": "https://api.flutter.dev/flutter/widgets/GridView-class.html"
          },
          {
            "title": "ListView",
            "desc":
                "A scrollable, linear list of widgets. ListView is the most commonly used scrolling widget. It displays its children one after another in the scroll direction. In the cross axis, the children are required to fill the ListView.",
            "url": "https://api.flutter.dev/flutter/widgets/ListView-class.html"
          },
          {
            "title": "NestedScrollView",
            "desc":
                "A scrolling view inside of which can be nested other scrolling views, with their scroll positions being intrinsically linked.",
            "url":
                "https://api.flutter.dev/flutter/widgets/NestedScrollView-class.html"
          },
          {
            "title": "NotificationListener",
            "desc":
                "A widget that listens for Notifications bubbling up the tree.",
            "url":
                "https://api.flutter.dev/flutter/widgets/NotificationListener-class.html"
          },
          {
            "title": "PageView",
            "desc": "A scrollable list that works page by page.",
            "url": "https://api.flutter.dev/flutter/widgets/PageView-class.html"
          },
          {
            "title": "RefreshIndicator",
            "desc":
                "A Material Design pull-to-refresh wrapper for scrollables.",
            "url":
                "https://api.flutter.dev/flutter/material/RefreshIndicator-class.html"
          },
          {
            "title": "ReorderableListView",
            "desc":
                "A list whose items the user can interactively reorder by dragging.",
            "url":
                "https://api.flutter.dev/flutter/material/ReorderableListView-class.html"
          },
          {
            "title": "ScrollConfiguration",
            "desc": "Controls how Scrollable widgets behave in a subtree.",
            "url":
                "https://api.flutter.dev/flutter/widgets/ScrollConfiguration-class.html"
          },
          {
            "title": "Scrollable",
            "desc":
                "Scrollable implements the interaction model for a scrollable widget, including gesture recognition, but does not have an opinion about how the viewport, which actually displays the children, is constructed.",
            "url":
                "https://api.flutter.dev/flutter/widgets/Scrollable-class.html"
          },
          {
            "title": "Scrollbar",
            "desc":
                "A Material Design scrollbar. A scrollbar indicates which portion of a Scrollable widget is actually visible.",
            "url":
                "https://api.flutter.dev/flutter/material/Scrollbar-class.html"
          },
          {
            "title": "SingleChildScrollView",
            "desc":
                "A box in which a single widget can be scrolled. This widget is useful when you have a single box that will normally be entirely visible, for example a clock face in a time picker, but you need to make sure it can be scrolled if the container gets too small in one axis (the scroll direction).",
            "url":
                "https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html"
          }
        ]
      },
      {
        "title": "Styling",
        "desc":
            "Manage the theme of your app, makes your app responsive to screen sizes, or add padding.",
        "url": "/docs/development/ui/widgets/styling",
        "list": [
          {
            "title": "MediaQuery",
            "desc":
                "Establishes a subtree in which media queries resolve to the given data.",
            "url":
                "https://api.flutter.dev/flutter/widgets/MediaQuery-class.html"
          },
          {
            "title": "Padding",
            "desc": "A widget that insets its child by the given padding.",
            "url": "https://api.flutter.dev/flutter/widgets/Padding-class.html"
          },
          {
            "title": "Theme",
            "desc":
                "Applies a theme to descendant widgets. A theme describes the colors and typographic choices of an application.",
            "url": "https://api.flutter.dev/flutter/material/Theme-class.html"
          }
        ]
      },
      {
        "title": "Text",
        "desc": "Display and style text.",
        "url": "/docs/development/ui/widgets/text",
        "list": [
          {
            "title": "DefaultTextStyle",
            "desc":
                "The text style to apply to descendant Text widgets without explicit style.",
            "url":
                "https://api.flutter.dev/flutter/widgets/DefaultTextStyle-class.html"
          },
          {
            "title": "RichText",
            "desc":
                "The RichText widget displays text that uses multiple different styles. The text to display is described using a tree of TextSpan objects, each of which has an associated style that is used for that subtree. The text might break across multiple lines or might all be displayed on the same line depending on the layout constraints.",
            "url": "https://api.flutter.dev/flutter/widgets/RichText-class.html"
          },
          {
            "title": "Text",
            "desc": "A run of text with a single style.",
            "url": "https://api.flutter.dev/flutter/widgets/Text-class.html"
          }
        ]
      }
    ]
"""
