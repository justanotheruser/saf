# SAF (slow as f**k)

Simple command to notify you when some other bash command has finished or requires your action. Use SAF by passing that command to it as string argument.

## Why
Suppose you want to install Django. You type 
```sh
$ pip install django
```
and wait. How long? You don't know. You heard it's a big framework but it's first time you're installing it, you want to use it for your pet project which idea just came to mind, so you are eager to start right away. You have 3 options now:
  - stare at the terminal until installation finishes
  - return to other activities and check it every 10 seconds
  - same but forget to check; find out 20 minutes later that you might have been coding for quite some time

## How
With SAF you can run it like this instead:
```sh
$ saf "pip install django"
```
It will play sound effect when command has finished. Sound effects will be different for successfull (returned code 0) and unsuccessfull (returned code 1) operations. For visual pop-up
instad use it like that:
```sh
$ saf -mv "pip install django"
```
**-v** flag stands for 'visual' and **-m** stands for 'mute'

To be prepared for sound effect or pop-ups (or just test if it even works on your system which, honestly, you definetly should — this is very raw version) run:
```sh
$ saf --demo
```
## Planned features
  - Special trigger for user interaction request
  - Customizible sounds
    