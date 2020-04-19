# SAF (slow as f**k)

Simple command to notify you when some other bash command has finished or requires your action. Use SAF by passing that command to it as string argument.

## Why
Suppose you want to install Tensorflow:
```sh
$ pip install --upgrade tensorflow
```
You have 3 options now:
  - stare at the terminal until installation finishes
  - return to other activities and check it every 10 seconds
  - same but forget to check; find out 20 minutes later that you might have continued whatever you have been doing for quite some time

## How
With SAF you can run it like this instead:
```sh
$ saf pip install --upgrade tensorflow
```
It will play sound effect when command has finished. Sound effects will be different for successfull (returned code 0) and unsuccessfull (returned code 1) operations

## Planned features
  - Visual pop-up option instead of sound
  - Special sound/pop-up for user interaction request
    