# GitHubUsers
This is my submission for the Circle Senior iOS Engineer take-home assignment (August 27-30, 2021).

The goal of the assignment was to implement an app to search for GitHub users using the [GitHub Search API](https://docs.github.com/en/rest/reference/search). The app was successfully implemented natively in SwiftUI (iOS 15) in Xcode 13 Beta 5 **without** any third-party dependencies. The full feature list and implementation details can be found in the [Feature List](#feature-list) section below. It cannot be guaranteed that this app will work as expected on other versions of the Xcode 13 beta. Furthermore, I wanted to implement unit & UI testing for the app, and while I began, I unfortunately was not able to complete it on time for the deadline as my focus was on refining the app architecture.

## Table of Contents
1. [Feature List](#feature-list)
2. [Encountered XCode 13 Beta Bugs](#xcode-13-beta-5-bugs)
3. [Remarks](#remarks)

## Feature List
My submission was completed with **all** of the base and bonus requirements.

| Feature                               | Implementation 																																					  | Feature Type |  
| ------------------------------------- |:-------------------------------------------------------------------------------------------------------------------------------------------------------------------:| ------------:|
| List users                            | Relevant users are listed upon search 							  																								  | Base         |
| Search users                          | Users can be searched for in the native navigation search bar       																								  | Base         |
| Paginate search results               | results are automatically and seamlessly appended to the list when end of list is reached   																		  | Base         |
| Pull-to-refresh                       | Native pull-to-refresh implementation above the navigation bar 																									  | Base         |
| Search results sorting                | A navigation button will present a sheet with search parameter modifications 																						  | Bonus 		 |
| Progress indication as redacted views | User row views are redacted while they are being fetched & loaded in. However, it is possible to miss the redacted views if your internet connection is fast enough | Bonus 		 |
| Archiecture with reusability in mind  | MVVM architecture was used to separate the model, networking (view model), and view layers. Thus, they can be independently modularized and reused as needed        | Bonus 		 |

## Xcode 13 Beta 5 Bugs
These are the notable bugs I've encountered while testing the app:
1. The alert for handling user-facing errors is an iOS 15 [beta feature](https://developer.apple.com/documentation/swiftui/form/alert%28ispresented:error:actions:message:%29). The linked webpage states the following: 

    > If no actions are present, the system includes a standard “OK” action. No default cancel action is provided. If you want to show a cancel action, use a button with a role of cancel.
     
   While this is the intended behaviour, this is not accurate; whether an action is present or not, the alert always includes a default "Cancel" action. Thus, if you happen to run into the alert while testing the app, please select "OK" action I implemented as it triggers necessary code for the app.
2. For the same aforementioned alert, there has been a rare case of it triggering with empty text and excluding the button I have implemented. This is a bug as I have designed the code to only trigger the alert when the relevant error occurs. For the sake of argument, let's say there is a flaw in my error handling code, the button I implemented should still show as it is directly place within the alert initialization code, but it doesn't.
4. UITests seem to run indefinitely. Unsure what the cause is as I have not implemented any UI testing beyond the template code provided by Xcode.
3. And of course, any unexpected beta bugs

## Remarks
While my solution was ultimately *rejected*, I had lots of fun building the app and am proud of the work I did given the time constraints. There is always room for improvement, and as such, on to the next one.
