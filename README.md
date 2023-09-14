# MarvelCharacters

This app will shown list of marvel characters and for every character we will have some events, stories, series and comics.
The project is done with MVVM-C pattern and combine. The design is not perfect since there is no figma design to depends on.

List Screen:
This screen includes a tableview and a headerview.The tableview will list the characters and save them to cache. The Requester Class is done just for this app.
Ofcourse we can do more customizable class and it covers many apis responses. Also the cache can be done in a better way.
The header view is a component. I did not depend on the navigation bar since I inisisted on creating a component to check how components are done.

Second Screen:
Here we can take the data from the character selected and the comics, series etc.. from this object. I also insisted here to call more 
than 1 api and check how i would manage this call.
Now this screen displays the character's image, title and description.Inaddition to that i will display as a list the comics, series, etc..
Here we can check how i reload the data.

I use combine, coordinator, extensions, multithreading, delegates, protocols, struct, class, weak, etc..
