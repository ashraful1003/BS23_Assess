# bs23_assess

This project is done during the assessment of BrainStation23

I've designed and implemented api with these screen using Flutter.

![Screenshot_1706726437](https://github.com/ashraful1003/BS23_Assess/assets/76874409/bf5f168a-fb48-47af-b4aa-c7521ba64f38)

This is repository list, this part is in the ListView with pagination for infinity loop.

![Screenshot_1706726466](https://github.com/ashraful1003/BS23_Assess/assets/76874409/cf15909e-2718-4340-95b9-41f2f310358a)

User can sort based on updated time and star count using the dropdown widget.

![Screenshot_1706726485](https://github.com/ashraful1003/BS23_Assess/assets/76874409/e87171cf-132d-44e4-9a1a-6504032beeaa)

This is the details of the repository selected from the repository list.

All data will come from [this API](https://api.github.com/search/repositories?q=topic:flutter&per_page=2) in JSON format.

![image](https://github.com/ashraful1003/BS23_Assess/assets/76874409/acbb2f8b-76d3-46bd-9b28-1eb67dda3422)
![image](https://github.com/ashraful1003/BS23_Assess/assets/76874409/ea802c93-dfa1-492a-a223-815b4a95a4ef)
![image](https://github.com/ashraful1003/BS23_Assess/assets/76874409/72b8fdab-748f-49ce-aa53-f9396a8a181d)

I used here:
- Getx State Management
- Dio for network call
- MVC Pattern for structuring
- ListView
- Cached Netword Image

Future Scope:
- Authentication can be added
- Search Option can be added beside sorting
- Anyone can contact with the owner for next collaboration or anything
- Redirect to the repository link
