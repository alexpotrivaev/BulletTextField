# Build a TextField with bullet points for the use in SwiftUI app

I need help creating a TextField with bullet lists for the use in a SwiftUI app.

## Few requirements and things to keep in mind:

1. The TextField has to work for multiline use case (e.g. either use SwiftUI's TextField with iOS 16's axis: .vertical or UITextView).
2. There would be several modes: users would be able to write in a regular TextField mode, or they would be able to switch to a bullet point mode.
3. If the user switches into the bullet point mode while already having some text written in a regular mode, we should make sure that each line in the original text string (e.g. ending with \n) would be rendered with a bullet point and the keyboard will stay active with cursor active in the textfield.
4. When the user hits a return key, we should create a new line with a new bullet point and move the cursor onto a start of that new line.
4.1. If the cursor was at the end of the previous line, we should create a new empty bullet point
4.2. If the cursor was between the characters of an existing line, we should create a new line with everything that was to the right from the cursor while the previous line should only keep everything that was to the left of the cursor.
5. When the user hits backspace on an empty line, that line should get deleted and the cursor should move back onto the previous line.
6. If the user decides to switch back to the regular TextField mode, we should combine all bullet point lines into a single string separated by "\n".
7. We should support long lines of text and ensure that the alignment is always correct (e.g. left margin between the start of text on the first line is the same as the left margin on the second+ line of a single bullet point) and the bullet point is always aligned with the first line of the text.
8. Even if you build it in UIKit, it needs to be wrapped into UIViewRepresentable for usage in my SwiftUI app and ideally it should not use external library dependencies.

## Nice-to-have's or descopable:

9. I have a character limit (600 max) in my regular TextField mode. Ideally the bullet list mode would also respect that, but that's a nice to have (e.g. I can drop the last characters when saving).
10. Ideally, each bullet point should be part of the same TextField (e.g. you can change the cursor focus by holding and dragging the cursor within all bullet points), but that's descopable if hard.
11. If it's easier for you to create a fully fledged text editing experience similar to Apple Notes app, instead of a binary bullet mode / list mode, it could work as well (e.g. not requiring all lines to be bullet points, but only some, allowing to type "*" or "-" in order to create a new bullet point etc).
12. Bottomline: if you already have a solution that behaves like Craft, Notes, Notion when it comes to bullet point logic: happy to discuss if the existing solution you have can work for us as well.

Happy to jump on a call or answer questions asynchronously, if you require more context.