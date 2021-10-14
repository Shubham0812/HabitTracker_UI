# Architecture


## General

These are general guidelines that shows you how the project is structured and how you should create and organise the files .

## Base Architecture

#### File and Folder Structuring

These are the groups that the project has currently. You can create more groups if it is needed. Make sure to put it in an appropriate place. 

- Extensions
- Code
	* Controllers
	* Models
	* Services
	* Support Views
	* Views 
		* Modules
			* Models
			* Support Shapes
			* Support Views
- Utils
- Resources
	*  Fonts


Put everything related to the project inside the **Code** group. Code or files that can be reused in other projects, can be put into **Extensions** / **Utils** / **New group**.


### Extensions

 Create Swift files and put extensions belonging to a particular struct / class in a single file.

> FoundationExtensions contains extensions to Double and Int structs.


### Code 

#### Controllers

Put Swift files that contains the core logic for the project in this group. If you plan to add navigation / routing logic or anything core, please do it here.
> Currently the app only contains the @main app file. 


#### Models

Put Swift files that contains the models that are core to the project, and which can be used within multiple Modules.


#### Services
Put Swift files like ViewModels, Data fetchers / Defaults manager that can be used by Views to fetch/store data in this group.


#### Support Views
Put common reusable subviews in this group.

#### Views
Views contains Modules, currently we have Onboarding and Main.

**Module** contains - 
		
*  Models		
> Put models local to a Module in this group.
* Support Shapes
> Put shapes local to a Module in this group
* Support Views
> Put subviews and smaller views local to a Module in this group.


### Utils

### Resources

#### Fonts
