import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class Uieditor extends StatefulWidget {
  Uieditor({super.key});

  @override
  State<Uieditor> createState() => _UieditorState();
}

class _UieditorState extends State<Uieditor> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Visual Editor')),
      body: VisualEditorScreen(),
    );
  }
}

class VisualEditorScreen extends StatefulWidget {
  @override
  _VisualEditorScreenState createState() => _VisualEditorScreenState();
}

class _VisualEditorScreenState extends State<VisualEditorScreen> {
  List<Widget> canvasItems = [];
  Widget? selectedComponent;
  String currentTextStyle = 'Normal';

  Offset position = Offset(100, 100);

  // Method to add a component to the canvas
  void addComponent(String componentType) {
    setState(() {
      if (componentType == 'textField') {
        canvasItems.add(
          PositionedComponent(
            child: EditableTextFieldComponent(
              initialText: 'Enter text here',
              textStyle: TextStyle(fontSize: 16, color: Colors.black),
            ),
            onSelect: (widget) {
              setState(() {
                selectedComponent = widget;
              });
            },
          ),
        );
      } else if (componentType == 'text') {
        canvasItems.add(PositionedComponent(
          // child: EditableTextComponentWithEdit(),
          child: EditableTextComponent(),
          onSelect: (widget) {
            setState(() {
              selectedComponent = widget;
            });
          },
        ));
      } else if (componentType == 'button') {
        canvasItems.add(PositionedComponent(
          child: EditableButtonComponent(),
          onSelect: (widget) {
            setState(() {
              selectedComponent = widget;
            });
          },
        ));
      } else if (componentType == 'image') {
        canvasItems.add(PositionedComponent(
          child: EditableImageComponent(),
          onSelect: (widget) {
            setState(() {
              selectedComponent = widget;
            });
          },
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visual UI Editor'),
      ),
      body: Row(
        children: [
          Column(
            children: [
              // Component Library
              // Expanded(
              //   flex: 1,
              //   child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Components', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 20),
                    _buildDraggableComponent('Add Text', 'text', Colors.blue),
                    SizedBox(height: 10),
                    _buildDraggableComponent(
                        'Add Button', 'button', Colors.green),
                    SizedBox(height: 10),
                    _buildDraggableComponent('Add Image', 'image', Colors.red),
                    SizedBox(height: 10),
                    _buildDraggableComponent(
                        'Text Field', 'textField', Colors.orange),
                  ],
                ),
              ),
              // ),
              SizedBox(height: 20),

              // Dropdown for text styles
              DropdownButton<String>(
                value: currentTextStyle,
                onChanged: (String? newValue) {
                  setState(() {
                    currentTextStyle = newValue!;
                  });
                },
                items: <String>['Normal', 'Bold', 'Italic', 'Underline']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              // Clear button to reset the canvas
              SizedBox(height: 20),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    canvasItems.clear(); // Clear all items from the canvas
                    selectedComponent =
                        null; // Clear the selected component (optional)
                  });
                },
                child: Text('Clear'),
                style: ElevatedButton.styleFrom(
                  iconColor: Colors.red, // Button color
                ),
              ),
              Spacer(),
              // Property Editor
              // Expanded(
              //   flex: 1,
              //   child: selectedComponent != null
              //       ? PropertyEditor(selectedComponent: selectedComponent!)
              //       : Center(child: Text('Select component')),
              // ),
            ],
          ),
          // Canvas Area
          Expanded(
            flex: 3,
            child: DragTarget<String>(
              onAccept: (data) {
                addComponent(data);
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  padding: EdgeInsets.all(8.0),
                  color: Colors.grey[200],
                  child: Stack(
                    children: canvasItems,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Draggable component widget
  Widget _buildDraggableComponent(String label, String type, Color color) {
    return Draggable<String>(
      data: type,
      feedback: Material(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        color: color,
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

// Wrapper for draggable Positioned components
class PositionedComponent extends StatelessWidget {
  final Widget child;
  final Function(Widget) onSelect;

  PositionedComponent({required this.child, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 50,
      top: 50,
      child: GestureDetector(
        onTap: () => onSelect(child),
        child: child,
      ),
    );
  }
}

// Editable Text Component
class EditableTextComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'New Text',
      style: TextStyle(fontSize: 16, color: Colors.black),
    );
  }
}

class EditableTextComponentWithEdit extends StatefulWidget {
  @override
  _EditableTextComponentWithEditState createState() =>
      _EditableTextComponentWithEditState();
}

class _EditableTextComponentWithEditState
    extends State<EditableTextComponentWithEdit> {
  TextStyle textStyle = TextStyle(fontSize: 16, color: Colors.black);
  TextEditingController _controller = TextEditingController(text: 'New Text');
  FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool isBold = false;
  bool isItalic = false;
  bool isUnderlined = false;
  double fontSize = 16;
  Color fontColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _hideOverlay();
      }
    });
  }

  // Show style options overlay
  void _showOverlay(BuildContext context) {
    if (_overlayEntry != null) return;

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context)!.insert(_overlayEntry!);
  }

  // Hide style options overlay
  void _hideOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  // Update text style based on selected options
  void _updateTextStyle() {
    setState(() {
      textStyle = TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
        decoration:
            isUnderlined ? TextDecoration.underline : TextDecoration.none,
      );
    });
  }

  // Create the overlay entry for the style box
  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        width: 200,
        left: offset.dx,
        top: offset.dy - 50, // Show above the text
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          child: Material(
            elevation: 4.0,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.format_bold,
                          color: isBold ? Colors.blue : Colors.black),
                      onPressed: () {
                        setState(() {
                          isBold = !isBold;
                          _updateTextStyle();
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.format_italic,
                          color: isItalic ? Colors.blue : Colors.black),
                      onPressed: () {
                        setState(() {
                          isItalic = !isItalic;
                          _updateTextStyle();
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.format_underline,
                          color: isUnderlined ? Colors.blue : Colors.black),
                      onPressed: () {
                        setState(() {
                          isUnderlined = !isUnderlined;
                          _updateTextStyle();
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.format_color_text, color: fontColor),
                      onPressed: () {
                        // Toggle color for simplicity; use color picker if needed
                        setState(() {
                          fontColor = fontColor == Colors.black
                              ? Colors.red
                              : Colors.black;
                          _updateTextStyle();
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          fontSize += 2;
                          _updateTextStyle();
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          fontSize = fontSize > 10 ? fontSize - 2 : 10;
                          _updateTextStyle();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: () {
          // Show the cursor and allow text editing
          FocusScope.of(context).requestFocus(_focusNode);
          _showOverlay(context);
        },
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          style: textStyle,
          decoration: InputDecoration(border: InputBorder.none),
          onChanged: (value) {
            // Handle text changes if needed
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _hideOverlay();
    _focusNode.dispose();
    super.dispose();
  }
}

// Editable TextField Component
class EditableTextFieldComponent extends StatelessWidget {
  final String initialText;
  final TextStyle textStyle;

  EditableTextFieldComponent(
      {required this.initialText, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    // TextEditingController to manage the text
    TextEditingController _controller =
        TextEditingController(text: initialText);

    return TextField(
      controller: _controller,
      style: textStyle,
      decoration: InputDecoration(
        // hintText: 'Enter text...',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        // Handle text changes if necessary
      },
    );
  }
}

// Editable Button Component
class EditableButtonComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('Button clicked');
      },
      child: Text('New Button'),
    );
  }
}

// Editable Image Component
class EditableImageComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://tse2.mm.bing.net/th?id=OIP.HKIUboR5ztaqYMowtrBhcwHaHa&pid=Api&P=0&h=220',
      width: 150,
      height: 150,
    );
  }
}

// Property Editor for selected components
class PropertyEditor extends StatelessWidget {
  final Widget selectedComponent;

  PropertyEditor({required this.selectedComponent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Edit it', style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          // if (selectedComponent is EditableTextComponent) _buildTextEditor(),
          if (selectedComponent is EditableTextComponentWithEdit)
            _buildTextEditor(),
          if (selectedComponent is EditableButtonComponent)
            _buildButtonEditor(),
          if (selectedComponent is EditableImageComponent) _buildImageEditor(),
        ],
      ),
    );
  }

  Widget _buildTextEditor() {
    return Column(
      children: [
        Text('Text Properties'),
        // Add more property controls here (e.g., font size, color)
      ],
    );
  }

  Widget _buildButtonEditor() {
    return Column(
      children: [
        Text('Button Properties'),
        // Add more property controls here (e.g., label, action)
      ],
    );
  }

  Widget _buildImageEditor() {
    return Column(
      children: [
        Text('Image Properties'),
        // Add more property controls here (e.g., image source, size)
      ],
    );
  }
}


