# MarvelCharacters

This app will show list of marvel characters and for every character we will have some events, stories, series and comics.
The project is done with MVVM-C pattern. The design is not perfect for having no figma design to depend on.

List Screen:
This screen includes a tableview and a headerview.The tableview will list the characters and save them to cache. The Requester Class is done just for this app.
Ofcourse we can do more customizable class that covers many apis responses. Also the cache can be done in a better way.
The header view is a component. I didn't depend on the navigation bar since I inisisted on creating a component to check how components are done.

Second Screen:
This screen displays the character's image, title, description, the list of comics, series, etc..
Here, we can take the comics, series, etc from the selected character object. I also insisted here to call more than 1 api and check how i would manage these apis calls.

This app includes the following:
- Combine
- ViewModel
- URLSession
- Coordinator
- Extensions
- Multithreading
- Delegates
- Protocols
- Struct
- Class
- Weak
- Kingfisher pod for image
- Unit Testing
- etc
